class FitnessCondition
  
  attr_accessor :weight
  
  def initialize(weight = nil)
    @weight = (!weight.nil? && weight) || 0
  end
  
  def calculateFitness(chromosome)
  end
  
end