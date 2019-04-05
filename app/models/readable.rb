module Readable
  def Readable.included(includee)
    includee.send :has_many, :features, as: :text
  end

  def text
    words.map(&:normalized_greek).join(' ')
  end

  def vocabulary
    words.map(&:strong).uniq
  end

  def num_words
    words.count
  end

  def num_letters
    words.map(&:char_count).inject { |c, sum| sum += c }
  end

  def num_forms
    vocabulary.count
  end
end
