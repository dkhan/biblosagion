module Readable
  def Readable.included(includee)
    includee.send :has_many, :features, as: :text
  end

  def text
    words.map(&:normalized_greek).join(' ')
  end

  # words

  def words_num_words
    words.count
  end

  def words_num_letters
    words.map(&:char_count).inject { |c, sum| sum += c }
  end

  def words_num_forms
    words.uniq.count
  end

  # vocabulary

  def vocabulary
    words.map(&:strong).uniq
  end

  # words_num_vowels",
  # words_num_consonants",
  # words_num_vowel_words",
  # words_num_consonant_words",
  # words_num_once_words",
  # words_num_more_than_once_words",
  # words_num_one_form_words",
  # words_num_more_than_one_form",
  # words_num_nouns",
end
