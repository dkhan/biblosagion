class WordService
  attr_accessor :word

  SPLIT_WORDS = {
    "μήγε" => [
      { editions: 'BRW', interlinear: 'not', formatted_greek: 'μή', strong_number: 'G3361', morphology: 'PRT-N', lexical_form: 'μή', meaning: 'not', sub_meaning: 'not', variants: nil },
      { editions: 'BIMNRSTH', interlinear: 'surely', formatted_greek: 'γε', strong_number: 'G1065', morphology: 'PRT', lexical_form: 'γέ', meaning: 'indeed', sub_meaning: 'indeed', variants: nil }
    ],
    "ἄραγε" => [
      { editions: 'BIMNRSTWH', interlinear: 'then', formatted_greek: 'ἄρα', strong_number: 'G0686', morphology: 'CONJ', lexical_form: 'ἄρα', meaning: 'therefore', sub_meaning: 'therefore', variants: nil },
      { editions: 'BIMNRSTH', interlinear: 'surely', formatted_greek: 'γε', strong_number: 'G1065', morphology: 'PRT', lexical_form: 'γέ', meaning: 'indeed', sub_meaning: 'indeed', variants: nil }
    ],
    "Ἄραγε" => [
      { editions: 'BIMNRST', interlinear: 'Then', formatted_greek: 'Ἄρα', strong_number: 'G0686', morphology: 'CONJ', lexical_form: 'ἄρα', meaning: 'therefore', sub_meaning: 'therefore', variants: 'HW=ἄρα=G0686=CONJ;' },
      { editions: 'BIMNRSTH', interlinear: 'surely', formatted_greek: 'γε', strong_number: 'G1065', morphology: 'PRT', lexical_form: 'γέ', meaning: 'indeed', sub_meaning: 'indeed', variants: nil }
    ]
  }

  def initialize(word)
    @word = word
  end

  def self.populate
    i = 0
    words.each do |word|
      next if word[:formatted_greek].blank?
      i += 1
      if word[:formatted_greek].in? SPLIT_WORDS.keys
        SPLIT_WORDS[word[:formatted_greek]].each_with_index do |attrs, sub_i|
          new(word.merge(attrs)).create_word(i += sub_i)
        end
        next
      end
      new(word).create_word(i)
    end
    nil
  end

  def self.txt
    File.join Rails.root, "datasets", "tantt.tsv"
  end

  def self.words
    headers = [:reference, :editions, :interlinear, :formatted_greek, :strong_number, :morphology, :lexical_form, :meaning, :sub_meaning, :variants]
    SmarterCSV.process txt,
      col_sep: "\t",
      quote_char: "^",
      user_provided_headers: headers,
      headers_in_file: false,
      skip_lines: 1,
      verbose: true
  end

  def self.normalize(text)
    text.gsub(/[ΆΑάἀἁἂἃἄἅἆἇὰάᾀᾁᾂᾃᾄᾅᾆᾇᾰᾱᾲᾳᾴᾶᾷἈἉἊἋἌἍἎἏᾈᾉᾊᾋᾌᾍᾎᾏᾸᾹᾺΆᾼ]/u, 'α')
        .gsub(/[ΈΕέἐἑἒἓἔἕὲέἘἙἚἛἜἝῈΈ]/u, 'ε')
        .gsub(/[ΉΗήἠἡἢἣἤἥἦἧὴήᾐᾑᾒᾓᾔᾕᾖᾗῂῃῄῆῇἨἩἪἫἬἭἮἯᾘᾙᾚᾛᾜᾝᾞᾟῊΉῌ]/u, 'η')
        .gsub(/[ΊΪΙίΐἰἱἲἳἴἵἶἷὶίῐῑῒΐῖῗἸἹἺἻἼἽἾἿῘῙῚΊ]/u, 'ι')
        .gsub(/[ΌΟόὀὁὂὃὄὅὸόὈὉὊὋὌὍῸΌ]/u, 'ο')
        .gsub(/[ΎΫΥΰϋύὐὑὒὓὔὕὖὗὺύῠῡῢΰῦῧὙὛὝὟῨῩῪΎ]/u, 'υ')
        .gsub(/[ΏΩώὠὡὢὣὤὥὦὧὼώᾠᾡᾢᾣᾤᾥᾦᾧῲῳῴῶῷὨὩὪὫὬὭὮὯᾨᾩᾪᾫᾬᾭᾮᾯῺΏῼ]/u, 'ω')
        .gsub(/[ῤῥῬ]/u, 'ρ')
        .downcase
  end

  def create_word(position)
    w = Word.new reference:          word[:reference],
                 strong_id:          strong_id,
                 strong_number:      word[:strong_number],
                 testament_position: position,
                 editions:           word[:editions],
                 interlinear:        word[:interlinear],
                 formatted_greek:    word[:formatted_greek],
                 normalized_greek:   WordService.normalize(word[:formatted_greek]),
                 morphology:         word[:morphology],
                 lexical_form:       word[:lexical_form],
                 meaning:            word[:meaning],
                 sub_meaning:        word[:sub_meaning],
                 variants:           word[:variants]
    w.save!
    puts w.attributes.values.to_s
  end

  def strong_id
    return nil if word[:formatted_greek].in? %w(¶ — ; [ ] [[ ]] ( ) , . · ¬)

    strong = Strong.find_by_strong_number(word[:strong_number])
    strong = Strong.find_by_greek(word[:formatted_greek]) if strong.nil?
    if strong.nil? && word[:lexical_form].present?
      normalized_strong = WordService.normalize(word[:lexical_form])
      strong = Strong.find_by_normalized_greek(normalized_strong)
    end

    puts "#{word[:formatted_greek]} strong_number #{word[:strong_number]} DOES NOT EXIST!" unless strong.present?
    strong.try(:id)
  end
end
