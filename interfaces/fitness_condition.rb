module Garf
  class FitnessCondition
    attr_accessor :weight
    
    def initialize(weight = nil)
      @weight = (!weight.nil? && weight) || 0
    end
    
    def calculate_fitness(chromosome)
    end
  end
end