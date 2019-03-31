module Constants
  GREEK_LETTERS = {
    'α' => { name: "Alpha",   numeric_value:   1, place_value:  1, value:   2, vowel: true  },
    'β' => { name: "Beta",    numeric_value:   2, place_value:  2, value:   4, vowel: false },
    'γ' => { name: "Gamma",   numeric_value:   3, place_value:  3, value:   6, vowel: false },
    'δ' => { name: "Delta",   numeric_value:   4, place_value:  4, value:   8, vowel: false },
    'ε' => { name: "Epsilon", numeric_value:   5, place_value:  5, value:  10, vowel: true  },
    'ϛ' => { name: "Stigma",  numeric_value:   6, place_value:  0, value:   6, vowel: false },
    'ζ' => { name: "Zeta",    numeric_value:   7, place_value:  6, value:  13, vowel: false },
    'η' => { name: "Eta",     numeric_value:   8, place_value:  7, value:  15, vowel: true  },
    'θ' => { name: "Theta",   numeric_value:   9, place_value:  8, value:  17, vowel: false },
    'ι' => { name: "Iota",    numeric_value:  10, place_value:  9, value:  19, vowel: true  },
    'κ' => { name: "Kappa",   numeric_value:  20, place_value: 10, value:  30, vowel: false },
    'λ' => { name: "Lambda",  numeric_value:  30, place_value: 11, value:  41, vowel: false },
    'μ' => { name: "Mu",      numeric_value:  40, place_value: 12, value:  52, vowel: false },
    'ν' => { name: "Nu",      numeric_value:  50, place_value: 13, value:  63, vowel: false },
    'ξ' => { name: "Xi",      numeric_value:  60, place_value: 14, value:  74, vowel: false },
    'ο' => { name: "Omicron", numeric_value:  70, place_value: 15, value:  85, vowel: true  },
    'π' => { name: "Pi",      numeric_value:  80, place_value: 16, value:  96, vowel: false },
    'ϙ' => { name: "Koppa",   numeric_value:  90, place_value:  0, value:  90, vowel: false },
    'ρ' => { name: "Rho",     numeric_value: 100, place_value: 17, value: 117, vowel: false },
    'σ' => { name: "Sigma",   numeric_value: 200, place_value: 18, value: 218, vowel: false },
    'ς' => { name: "Sigma",   numeric_value: 200, place_value: 18, value: 218, vowel: false },
    'τ' => { name: "Tau",     numeric_value: 300, place_value: 19, value: 319, vowel: false },
    'υ' => { name: "Upsilon", numeric_value: 400, place_value: 20, value: 420, vowel: true  },
    'φ' => { name: "Phi",     numeric_value: 500, place_value: 21, value: 521, vowel: false },
    'χ' => { name: "Chi",     numeric_value: 600, place_value: 22, value: 622, vowel: false },
    'ψ' => { name: "Psi",     numeric_value: 700, place_value: 23, value: 723, vowel: false },
    'ω' => { name: "Omega",   numeric_value: 800, place_value: 24, value: 824, vowel: true  },
    'ϡ' => { name: "Sampsi",  numeric_value: 900, place_value:  0, value: 900, vowel: false }
  }.freeze

  BOOKS = {
    "Mat" => [ "ΚΑΤΑ ΜΑΤΘΑΙΟΝ", "Matthew", "Kata Maththaion", "According to Matthew", "Matthew"],
    "Mrk" => [ "ΚΑΤΑ ΜΑΡΚΟΝ", "Mark", "Kata Markon", "According to Mark", "Mark"],
    "Luk" => [ "ΚΑΤΑ ΛΟΥΚΑΝ", "Luke", "Kata Loukan", "According to Luke", "Luke"],
    "Jhn" => [ "ΚΑΤΑ ΙΩΑΝΝΗΝ", "John", "Kata Ioannen", "According to John", "John"],
    "Act" => [ "ΠΡΑΞΕΙΣ ΤΩΝ ΑΠΟΣΤΟΛΩΝ", "Acts", "Praxeis Apostolon", "Acts or Deeds of Apostles", "Luke"],
    "Rom" => [ "ΠΡΟΣ ΡΩΜΑΙΟΥΣ", "Romans", "Pros Romaious", "To the Romans", "Paul"],
    "1Co" => [ "ΠΡΟΣ ΚΟΡΙΝΘΙΟΥΣ Α", "1 Corinthians", "Pros Korinthious a", "First (letter) to the Corinthians", "Paul"],
    "2Co" => [ "ΠΡΟΣ ΚΟΡΙΝΘΙΟΥΣ Β", "2 Corinthians", "Pros Korinthious b", "Second (letter) to the Corinthians", "Paul"],
    "Gal" => [ "ΠΡΟΣ ΓΑΛΑΤΑΣ", "Galatians", "Pros Galatas", "To the Galatians", "Paul"],
    "Eph" => [ "ΠΡΟΣ ΕΦΕΣΙΟΥΣ", "Ephesians", "Pros Ephesious", "To the Ephesians", "Paul"],
    "Php" => [ "ΠΡΟΣ ΦΙΛΙΠΠΗΣΙΟΥΣ", "Philippians", "Pros Philippesious", "To the Philippians", "Paul"],
    "Col" => [ "ΠΡΟΣ ΚΟΛΟΣΣΑΕΙΣ", "Colossians", "Pros Kolossaeis", "To the Colossians", "Paul"],
    "1Th" => [ "ΠΡΟΣ ΘΕΣΣΑΛΟΝΙΚΕΙΣ Α", "1 Thessalonians", "Pros Thessalonikeis a", "First (letter) to the Thessalonians", "Paul"],
    "2Th" => [ "ΠΡΟΣ ΘΕΣΣΑΛΟΝΙΚΕΙΣ Β", "2 Thessalonians", "Pros Thessalonikeis b", "Second (letter) to the Thessalonians", "Paul"],
    "1Ti" => [ "ΠΡΟΣ ΤΙΜΟΘΕΟΝ Α", "1 Timothy", "Pros Timotheon a", "First (letter) to Timothy", "Paul"],
    "2Ti" => [ "ΠΡΟΣ ΤΙΜΟΘΕΟΝ Β", "2 Timothy", "Pros Timotheon b", "Second (letter) to Timothy", "Paul"],
    "Tit" => [ "ΠΡΟΣ ΤΙΤΟΝ", "Titus", "Pros Titon", "To Titus", "Paul"],
    "Phm" => [ "ΠΡΟΣ ΦΙΛΗΜΟΝΑ", "Philemon", "Pros Philemona", "To Philemon", "Paul"],
    "Heb" => [ "ΠΡΟΣ ΕΒΡΑΙΟΥΣ", "Hebrews", "Pros Hebraious", "To the Hebrews", "UNKNOWN"],
    "Jas" => [ "ΙΑΚΩΒΟΥ", "James", "lakdbou", "Of James", "James"],
    "1Pe" => [ "ΠΕΤΡΟΥ Α", "1 Peter", "Petrou a", "First (letter) of Peter", "Peter"],
    "2Pe" => [ "ΠΕΤΡΟΥ Β", "2 Peter", "Petrou b", "Second (letter) of Peter", "Peter"],
    "1Jn" => [ "ΙΩΑΝΝΟΥ Α", "1 John", "Ioannou a", "First (letter) of John", "John"],
    "2Jn" => [ "ΙΩΑΝΝΟΥ Β", "2 John", "Ioannou b", "Second (letter) of John", "John"],
    "3Jn" => [ "ΙΩΑΝΝΟΥ Γ", "3 John", "Ioannou g", "Third (letter) of John", "John"],
    "Jud" => [ "ΙΟΥΔΑ", "Jude", "louda", "Jude", "Jude"],
    "Rev" => [ "ΑΠΟΚΑΛΥΨΙΣ ΙΩΑΝΝΟΥ", "Revelation", "Apokalypsis Ioannou", "Revelation of John", "John"]
  }.freeze

  PUNCTUATION = %w(¶ — ; [ ] [[ ]] ( ) , . · ¬).freeze

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
  }.freeze

  GENERAL_CRITERIA = [
    # words
    { number:   1, category: "words",      reference: "num_words",                          name: "The number of words" },
    { number:   2, category: "words",      reference: "num_letters",                        name: "The number of letters" },
    { number:   3, category: "words",      reference: "num_forms",                          name: "The number of forms" },
    { number:   4, category: "words",      reference: "num_vowels",                         name: "The number of vowels" },
    { number:   5, category: "words",      reference: "num_consonants",                     name: "The number of consonants" },
    { number:   6, category: "words",      reference: "num_vowel_words",                    name: "The number of words that begin with a vowel" },
    { number:   7, category: "words",      reference: "num_consonant_words",                name: "The number of words that begin with a consonant" },
    { number:   8, category: "words",      reference: "num_once_words",                     name: "The number of words that occur only once" },
    { number:   9, category: "words",      reference: "num_more_than_once_words",           name: "The number of words that occur more than once" },
    { number:  10, category: "words",      reference: "num_one_form_words",                 name: "The number of words that occur in only one form" },
    { number:  11, category: "words",      reference: "num_more_than_one_form",             name: "The number of words that occur in more than one form" },
    { number:  12, category: "words",      reference: "num_nouns",                          name: "The number of nouns" },

    # vocabulary
    { number:  13, category: "vocabulary", reference: "voc_num_words",                      name: "The number of vocabulary words" },
    { number:  14, category: "vocabulary", reference: "voc_num_letters",                    name: "The number of vocabulary letters" },
    { number:  15, category: "vocabulary", reference: "voc_num_vowels",                     name: "The number of vocabulary vowels" },
    { number:  16, category: "vocabulary", reference: "voc_num_consonants",                 name: "The number of vocabulary consonants" },
    { number:  17, category: "vocabulary", reference: "voc_num_vowel_words",                name: "The number of vocabulary words that begin with a vowel" },
    { number:  18, category: "vocabulary", reference: "voc_num_consonant_words",            name: "The number of vocabulary words that begin with a consonant" },
    { number:  19, category: "vocabulary", reference: "voc_num_once_words",                 name: "The number of vocabulary words that occur only once" },
    { number:  20, category: "vocabulary", reference: "voc_num_more_than_once_words",       name: "The number of vocabulary words that occur more than once" },
    { number:  21, category: "vocabulary", reference: "voc_num_one_form_words",             name: "The number of vocabulary words that occur in only one form" },
    { number:  22, category: "vocabulary", reference: "voc_num_more_than_one_form",         name: "The number of vocabulary words that occur in more than one form" },
    { number:  23, category: "vocabulary", reference: "voc_num_nouns",                      name: "The number of vocabulary nouns" },

    # other
    { number:  24, category: "other",      reference: "sum_group_letters",                  name: "The sum of letters for word groups" },
    { number:  25, category: "other",      reference: "num_unique_words",                   name: "The number of words used nowhere else in the New Testament "},

    # proper names
    { number:  26, category: "names",      reference: "num_names",                          name: "The number of names" },
    { number:  27, category: "names",      reference: "num_male_names",                     name: "The number of male names" },
    { number:  28, category: "names",      reference: "num_female_names",                   name: "The number of female names" },

    # values
    { number:  29, category: "values",     reference: "position_vaue",                      name: "Position value" },
    { number:  30, category: "values",     reference: "numeric_value",                      name: "Numeric value" },
    { number:  31, category: "values",     reference: "value",                              name: "Value" },

    # numbers
    { number:  32, category: "numbers",    reference: "num_factors",                        name: "The number of factors" },
    { number:  33, category: "numbers",    reference: "sum_factors",                        name: "The sum of factors" },
    { number:  34, category: "numbers",    reference: "sum_figures",                        name: "The sum of figures" },
  ]
end
