module Garf
  class Chromosome
    
    attr_accessor :fitness_conditions, :constraints, :genes
    
    def initialize
      @fitness_conditions = []
      @constraints = []
      @genes = []
    end
    
    def calculate_fitness
      sum = 0.0
      @fitness_conditions.each do |f|
        sum += f.weight * f.calculate_fitness(self)
      end
      return 1 / (1 + sum)
    end
    
    def is_valid?
      result = true
      @constraints.each do |c|
        result &= c.is_valid?(self)
      end
      return result
    end
    
    def clone
      result = Chromosome.new
      result.fitness_conditions = fitness_conditions.dup
      result.constraints = constraints.dup
      result.genes = genes.map {|g| g.clone}
      return result
    end
    
    def to_s
      "[#{genes.join(',')}]"
    end
  end
end