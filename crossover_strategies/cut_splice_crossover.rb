class CutSpliceCrossover
  
  def crossover(firstChromosome, secondChromosome)
    provider = RandomProvider.instance
    firstChild = firstChromosome.clone
    secondChild = secondChromosome.clone
    
    crossoverPoint1 = provider.nextInt(0, firstChromosome.genes.count)
    crossoverPoint2 = provider.nextInt(0, secondChromosome.genes.count)
    
    firstChild.genes = firstChromosome.genes[0..crossoverPoint1] + secondChromosome.genes[crossoverPoint2..-1]
    secondChild.genes = secondChromosome.genes[crossoverPoint2..-1] + firstChromosome.genes[0..crossoverPoint1]
    
    return firstChild, secondChild
  end
end