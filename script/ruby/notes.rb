verses = Verse.includes(:translations, :words).joins(:book, :chapter).where("books.name = 'Mark' AND chapters.number = 16 AND verses.number BETWEEN 9 AND 20")
text = verses.map(&:text).join(' ')
# αναστας δε πρωι πρωτη σαββατου εφανη πρωτον μαρια τη μαγδαληνη παρ᾽ ης εκβεβληκει επτα δαιμονια εκεινη πορευθεισα απηγγειλεν τοις μετ᾽ αυτου γενομενοις πενθουσι και κλαιουσιν κα᾽ ᾽κεινοι ακουσαντες οτι ζη και εθεαθη υπ᾽ αυτης ηπιστησαν μετα δε ταυτα δυσιν εξ αυτων περιπατουσιν εφανερωθη εν ετερα μορφη πορευομενοις εις αγρον κα᾽ ᾽κεινοι απελθοντες απηγγειλαν τοις λοιποις ουδε εκεινοις επιστευσαν υστερον δε ανακειμενοις αυτοις τοις ενδεκα εφανερωθη και ωνειδισεν την απιστιαν αυτων και σκληροκαρδιαν οτι τοις θεασαμενοις αυτον εγηγερμενον εκ νεκρων ουκ επιστευσαν και ειπεν αυτοις πορευθεντες εις τον κοσμον απαντα κηρυξατε το ευαγγελιον παση τη κτισει ο πιστευσας και βαπτισθεις σωθησεται ο δε απιστησας κατακριθησεται σημεια δε τοις πιστευσασιν ακολουθησει ταυτα εν τω ονοματι μου δαιμονια εκβαλουσιν γλωσσαις λαλησουσιν και εν ταις χερσιν οφεις αρουσιν κα᾽ ᾽ν θανασιμον τι πιωσιν ου μη αυτους βλαψη επι αρρωστους χειρας επιθησουσιν και καλως εξουσιν ο μεν ουν κυριος ιησους μετα το λαλησαι αυτοις ανελημφθη εις τον ουρανον και εκαθισεν εκ δεξιων του θεου εκεινοι δε εξελθοντες εκηρυξαν πανταχου του κυριου συνεργουντος και τον λογον βεβαιουντος δια των επακολουθουντων σημειων

verses.each do |verse|
  puts "#{verse.number} #{verse.text}"
end;1

# 9  αναστας δε πρωι πρωτη σαββατου εφανη πρωτον μαρια τηη μαγδαληνηη παρ᾽ ης εκβεβληκει επτα δαιμονια
# 10 εκεινη πορευθεισα απηγγειλεν τοις μετ᾽ αυτου γενομενοις πενθουσι και κλαιουσιν
# 11 κα᾽ ᾽κεινοι ακουσαντες οτι ζηη και εθεαθη υπ᾽ αυτης ηπιστησαν
# 12 μετα δε ταυτα δυσιν εξ αυτων περιπατουσιν εφανερωθη εν ετερα μορφηη πορευομενοις εις αγρον
# 13 κα᾽ ᾽κεινοι απελθοντες απηγγειλαν τοις λοιποις ουδε εκεινοις επιστευσαν
# 14 υστερον δε ανακειμενοις αυτοις τοις ενδεκα εφανερωθη και ωνειδισεν την απιστιαν αυτων και σκληροκαρδιαν οτι τοις θεασαμενοις αυτον εγηγερμενον εκ νεκρων ουκ επιστευσαν
# 15 και ειπεν αυτοις πορευθεντες εις τον κοσμον απαντα κηρυξατε το ευαγγελιον παση τηη κτισει
# 16 ο πιστευσας και βαπτισθεις σωθησεται ο δε απιστησας κατακριθησεται
# 17 σημεια δε τοις πιστευσασιν ακολουθησει ταυτα εν τω ονοματι μου δαιμονια εκβαλουσιν γλωσσαις λαλησουσιν
# 18 και εν ταις χερσιν οφεις αρουσιν κα᾽ ᾽ν θανασιμον τι πιωσιν ου μη αυτους βλαψη επι αρρωστους χειρας επιθησουσιν και καλως εξουσιν
# 19 ο μεν ουν κυριος ιησους μετα το λαλησαι αυτοις ανελημφθη εις τον ουρανον και εκαθισεν εκ δεξιων του θεου
# 20 εκεινοι δε εξελθοντες εκηρυξαν πανταχου του κυριου συνεργουντος και τον λογον βεβαιουντος δια των επακολουθουντων σημειων

verses.each do |verse|
  puts "#{verse.number} #{verse.text}"
  puts "  #{verse.translations.first.text}"
end;1

9 αναστας δε πρωι πρωτη σαββατου εφανη πρωτον μαρια τη μαγδαληνη παρ᾽ ης εκβεβληκει επτα δαιμονια
   [[Now when he rose early on the first day of the week, he appeared first to Mary Magdalene, from whom he had cast out seven demons.
10 εκεινη πορευθεισα απηγγειλεν τοις μετ᾽ αυτου γενομενοις πενθουσι και κλαιουσιν
   She went and told those who had been with him, as they mourned and wept.
11 κα᾽ ᾽κεινοι ακουσαντες οτι ζη και εθεαθη υπ᾽ αυτης ηπιστησαν
   But when they heard that he was alive and had been seen by her, they would not believe it.
12 μετα δε ταυτα δυσιν εξ αυτων περιπατουσιν εφανερωθη εν ετερα μορφη πορευομενοις εις αγρον
   After these things he appeared in another form to two of them, as they were walking into the country.
13 κα᾽ ᾽κεινοι απελθοντες απηγγειλαν τοις λοιποις ουδε εκεινοις επιστευσαν
   And they went back and told the rest, but they did not believe them.
14 υστερον δε ανακειμενοις αυτοις τοις ενδεκα εφανερωθη και ωνειδισεν την απιστιαν αυτων και σκληροκαρδιαν οτι τοις θεασαμενοις αυτον εγηγερμενον εκ νεκρων ουκ επιστευσαν
   Afterward he appeared to the eleven themselves as they were reclining at table, and he rebuked them for their unbelief and hardness of heart, because they had not believed those who saw him after he had risen.
15 και ειπεν αυτοις πορευθεντες εις τον κοσμον απαντα κηρυξατε το ευαγγελιον παση τη κτισει
   And he said to them, "Go into all the world and proclaim the gospel to the whole creation.
16 ο πιστευσας και βαπτισθεις σωθησεται ο δε απιστησας κατακριθησεται
   Whoever believes and is baptized will be saved, but whoever does not believe will be condemned.
17 σημεια δε τοις πιστευσασιν ακολουθησει ταυτα εν τω ονοματι μου δαιμονια εκβαλουσιν γλωσσαις λαλησουσιν
   And these signs will accompany those who believe: in my name they will cast out demons; they will speak in new tongues;
18 και εν ταις χερσιν οφεις αρουσιν κα᾽ ᾽ν θανασιμον τι πιωσιν ου μη αυτους βλαψη επι αρρωστους χειρας επιθησουσιν και καλως εξουσιν
   they will pick up serpents with their hands; and if they drink any deadly poison, it will not hurt them; they will lay their hands on the sick, and they will recover."
19 ο μεν ουν κυριος ιησους μετα το λαλησαι αυτοις ανελημφθη εις τον ουρανον και εκαθισεν εκ δεξιων του θεου
   So then the Lord Jesus, after he had spoken to them, was taken up into heaven and sat down at the right hand of God.
20 εκεινοι δε εξελθοντες εκηρυξαν πανταχου του κυριου συνεργουντος και τον λογον βεβαιουντος δια των επακολουθουντων σημειων
   And they went out and preached everywhere, while the Lord worked with them and confirmed the message by accompanying signs.]]

words = verses.map(&:words).flatten
ws = text.split(' ')
forms = ws.uniq

# fix bad strongs
# TODO fix multiple strongs
# bws = Word.where(strong_id: nil).where("strong_number is not null").select{|w|w.strong_number.length < 7};1
# bws.each{|w|s = Strong.find_by_strong_number(w.strong_number); w.update_attribute(:strong_id, s.id)};1

strongs = words.map(&:strong)
#strongs.each{|s|puts "#{s.strong_number}: #{s.greek}: #{s.normalized_greek}: #{s.meaning}"};1

ws.count
# 175                        # Feature 1: number of words: 175/7.0 = 25.0

sum = 0
text.gsub(/[\s᾽]/, '').chars do |char|
  sum += Constants::GREEK_LETTERS[char][:numeric_value]
end;1
sum
# 103663                     # Feature 2: numeric value of words: 103663/7.0 = 14809.0

strongs.uniq.count
# 98                         # Feature 3, 4: number of vocabulary words: 98/7.0 = 14.0/7.0 = 2.0

sum_strongs = 0
strongs.uniq.map(&:normalized_greek).join('').gsub(/᾽/, '').chars do |char|
  sum_strongs += Constants::GREEK_LETTERS[char][:numeric_value]
end;1
sum_strongs
# 71057                      # Feature 5: numeric value of vocabulary words: 71057/7.0 = 10151.0

forms.count
# 133                        # Feature 6: number of forms: 133/7.0 = 19

sum_forms = 0
forms.join('').gsub(/᾽/, '').chars do |char|
  sum_forms += Constants::GREEK_LETTERS[char][:numeric_value]
end;1
sum_forms
# 89663                      # Feature 7: numeric value of forms: 89663/7.0 = 12809.0

form_counts = {}
ws.each do |word|
  if form_counts[word].nil?
    form_counts[word] = 1
  else
    form_counts[word] += 1
  end
end;1
multiple_forms = form_counts.select{|k, v|v > 1};1
multiple_forms.count
# 21                         # Feature 8: mumber of forms that accure more than once


# Jesus words
jwords = words.select{|w|w.speaker == 'Jesus'}
jwords.count
# 56                         # Feature 9: words spoken by Jesus: 56/7.0 = 8.0

jstrongs = jwords.map(&:strong)
jstrongs.uniq.count
# 42                         # Feature 10: Jesus' vocabulary: 42/7.0 = 6.0

jwords.map(&:normalized_greek).uniq.count
# 51 jesus' forms: [[3, 1], [17, 1]] 

require 'prime'
Prime.prime_division(s)

s = strongs.uniq.map(&:normalized_greek).map(&:chars).map(&:count).inject { |c, sum| sum += c }
# 552/23.0 = 24
w = words.map(&:normalized_greek).map(&:chars).map(&:count).inject { |c, sum| sum += c }
# 1007/19.0 = 53
f = forms.map(&:chars).map(&:count).inject { |c, sum| sum += c }
# 858/13.0 = 66/11.0 = 6




# reset strongs
def strong_id(word)
  return nil if word[:formatted_greek].in? Constants::PUNCTUATION

  strong = Strong.find_by_strong_number(word[:strong_number])
  strong = Strong.find_by_greek(word[:formatted_greek]) if strong.nil?
  if strong.nil? && word[:lexical_form].present?
    normalized_strong = WordService.normalize(word[:lexical_form])
    strong = Strong.find_by_normalized_greek(normalized_strong)
  end

  puts "#{word[:formatted_greek]} strong_number #{word[:strong_number]} DOES NOT EXIST!" unless strong.present?
  strong.try(:id)
end

Word.find_each do |w|
  w.update_columns(strong_id: strong_id(w))
end;1

