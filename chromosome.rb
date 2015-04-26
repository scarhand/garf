class Chromosome
  
  attr_accessor :fitnessConditions, :constraints, :genes
  
  def initialize
    @fitnessConditions = []
    @constraints = []
    @genes = []
  end
  
  def calculateFitness
    sum = 0.0
    @fitnessConditions.each do |f|
      #sum += fitnessCondition.Weight * fitnessCondition.CalculateFitness<Chromosome<T>, T>(this);
      sum += f.weight * f.calculateFitness(self)
    end
    return 1 / (1 + sum)
  end
  
  def isValid?
    result = true
    @constraints.each do |c|
      result &= c.isValid?(self)
    end
    return result
  end
  
  def clone
    result = Chromosome.new
    result.fitnessConditions = fitnessConditions.dup
    result.constraints = constraints.dup
    result.genes = genes.map {|g| g.clone}
    return result
  end
  
  def to_s
    "[#{genes.join(',')}]"
  end
  
end