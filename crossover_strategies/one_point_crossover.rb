require_relative '../random_provider.rb'
class OnePointCrossover
  def initialize 
  end
  
  def crossover(first_chromosome, second_chromosome)
    provider = RandomProvider.instance
    firstChild = first_chromosome.clone
    secondChild = second_chromosome.clone
    
    crossoverPoint = provider.next_int(0, [first_chromosome.genes.count, second_chromosome.genes.count].min)
    firstChild.genes = first_chromosome.genes[0...crossoverPoint] + second_chromosome.genes[crossoverPoint..-1]
    secondChild.genes = first_chromosome.genes[crossoverPoint..-1] + second_chromosome.genes[0...crossoverPoint]
    
    return firstChild, secondChild
  end
  
end