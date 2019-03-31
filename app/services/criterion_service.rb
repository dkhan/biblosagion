class CriterionService
  def self.populate
    Constants::GENERAL_CRITERIA.each do |criterion|
      Criterion.create! number: criterion[:number],
                        category: criterion[:category],
                        reference: criterion[:reference],
                        name: criterion[:name]
    end
  end
end
