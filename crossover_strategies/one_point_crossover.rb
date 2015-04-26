require_relative '../random_provider.rb'
class OnePointCrossover
  def initialize 
  end
  
  def crossover(firstChromosome, secondChromosome)
    provider = RandomProvider.instance
    firstChild = firstChromosome.clone
    secondChild = secondChromosome.clone
    
    crossoverPoint = provider.nextInt(0, [firstChromosome.genes.count, secondChromosome.genes.count].min)
    firstChild.genes = firstChromosome.genes[0...crossoverPoint] + secondChromosome.genes[crossoverPoint..-1]
    secondChild.genes = firstChromosome.genes[crossoverPoint..-1] + secondChromosome.genes[0...crossoverPoint]
    
    return firstChild, secondChild
  end
  
end