ws = Word.joins(:book, :chapter, :verse).where("books.name = 'Mark' AND chapters.number = 16 AND verses.number BETWEEN 9 AND 20")
sws = ws.where("editions ILIKE ?", "%W%")
sws.map(&:normalized_greek).join(' ')

verses = sws.map(&:verse).uniq
verses.each do |verse|
  verse_words = sws.where(verse: verse).map(&:normalized_greek)
  print "#{verse.number} (#{verse_words.count})  "
  puts verse_words.join(' ')
end;1

text = "αναστας δε πρωι πρωτη σαββατου εφανη πρωτον μαρια τη μαγδαληνη παρ᾽ ης εκβεβληκει επτα δαιμονια εκεινη πορευθεισα απηγγειλεν τοις μετ᾽ αυτου γενομενοις πενθουσι και κλαιουσιν κα᾽ ᾽κεινοι ακουσαντες οτι ζη και εθεαθη υπ᾽ αυτης ηπιστησαν μετα δε ταυτα δυσιν εξ αυτων περιπατουσιν εφανερωθη εν ετερα μορφη πορευομενοις εις αγρον κα᾽ ᾽κεινοι απελθοντες απηγγειλαν τοις λοιποις ουδε εκεινοις επιστευσαν υστερον δε ανακειμενοις αυτοις τοις ενδεκα εφανερωθη και ωνειδισεν την απιστιαν αυτων και σκληροκαρδιαν οτι τοις θεασαμενοις αυτον εγηγερμενον εκ νεκρων ουκ επιστευσαν και ειπεν αυτοις πορευθεντες εις τον κοσμον απαντα κηρυξατε το ευαγγελιον παση τη κτισει ο πιστευσας και βαπτισθεις σωθησεται ο δε απιστησας κατακριθησεται σημεια δε τοις πιστευσασιν ακολουθησει ταυτα εν τω ονοματι μου δαιμονια εκβαλουσιν γλωσσαις λαλησουσιν και εν ταις χερσιν οφεις αρουσιν κα᾽ ᾽ν θανασιμον τι πιωσιν ου μη αυτους βλαψη επι αρρωστους χειρας επιθησουσιν και καλως εξουσιν ο μεν ουν κυριος ιησους μετα το λαλησαι αυτοις ανελημφθη εις τον ουρανον και εκαθισεν εκ δεξιων του θεου εκεινοι δε εξελθοντες εκηρυξαν πανταχου του κυριου συνεργουντος και τον λογον βεβαιουντος δια των επακολουθουντων σημειων"

KNOWN_STRONGS =
  {
    "κα᾽" => "G2532",
    "᾽κεινοι" => "G1565",
    "᾽ν" => "G1437",
    "ακολουθησει" => "G0190"
  }

pws = text.split(' ');1
forms = pws.uniq;1

strongs = []
forms.each do |word|
  v = Word.where(normalized_greek: word).first
  if v.present?
    puts "#{word} => #{v.strong_number}"
    strongs << v.strong
  else
    strong = KNOWN_STRONGS[word]
    puts "#{word} => #{strong || 'NONE'}"
    strongs << Strong.find_by_strong_number(strong)
  end
end;1
strongs.uniq!

sum = 0
text.gsub(/[\s᾽]/, '').chars do |char|
  sum += Constants::GREEK_LETTERS[char][:numeric_value]
end;1

puts sum
2.4.1 :219 > sum
 => 103663                     # Feature 1: numeric value of words
2.4.1 :169 > pws.count
 => 175                        # Feature 2: number of words
2.4.1 :170 > strongs.count
 => 98                         # Feature 3, 4: number of vocabulary words
2.4.1 :172 > forms.count
 => 133                        # Feature 5: number of forms
sum_forms = 0
forms.join('').gsub(/᾽/, '').chars do |char|
  sum_forms += Constants::GREEK_LETTERS[char][:numeric_value]
end;1
2.4.1 :263 > sum_forms
 => 89663                      # Feature 6: numeric value of forms

form_counts = {}
forms.each do |word|
  if form_counts[word].nil?
    form_counts[word] = 1
  else
    form_counts[word] += 1
  end
end;1
multiple_forms = form_counts.select{|k, v|v > 1};1
2.4.1 :283 > multiple_forms.count
 => 21                         # Feature 7: mumber of forms that accure more than once






# --------- fix normalized_greek
bws = Word.where("normalized_greek like ?", "%ῃ%");1
bws.each {|w|w.update_attribute(:normalized_greek, w.normalized_greek.gsub("ῃ", "η"))}



