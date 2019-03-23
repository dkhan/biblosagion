class WordService
  attr_accessor :word

  def initialize(word)
    @word = word
  end

  def self.populate
    words.each_with_index do |word, i|
      service = new(word)

      Word.create! reference:          word[:reference],
                   strong_id:          service.strong_id,
                   strong_number:      word[:strong_number],
                   testament_position: i,
                   editions:           word[:editions],
                   interlinear:        word[:interlinear],
                   formatted_greek:    word[:formatted_greek],
                   normalized_greek:   service.normalized_greek,
                   morphology:         word[:morphology],
                   lexical_form:       word[:lexical_form],
                   meaning:            word[:meaning],
                   sub_meaning:        word[:sub_meaning],
                   variants:           word[:variants]
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

  def normalized_greek
    @normalized_greek ||= WordService.normalize(word[:formatted_greek])
  end

  def strong_id
    strong = Strong.find_by_strong_number(word[:strong_number])
    strong = Strong.find_by_normalized_greek(normalized_greek) if strong.nil?
    if strong.present?
      strong.id
    else
      puts "#{word[:formatted_greek]} strong_number #{word[:strong_number]} DOES NOT EXIST!"
      nil
    end
  end
end
