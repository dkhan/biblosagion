class CriterionService
  def populate_criteria
    Constants::GENERAL_CRITERIA.each do |criterion|
      Criterion.create! reference: criterion[:reference], name: criterion[:name]
    end
  end
end
