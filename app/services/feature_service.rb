class FeatureService
  attr_accessor :passage

  def initialize(passage)
    @passage = passage
  end

  def print_features
    printf "%s: %20d\n", "The number of words", passage.num_words
  end
end
