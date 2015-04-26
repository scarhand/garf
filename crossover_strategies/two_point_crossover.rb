class TwoPointCrossover
  
  def crossover(firstChromosome, secondChromosome)
    provider = RandomProvider.instance
    firstChild = firstChromosome.clone
    secondChild = secondChromosome.clone
    minGeneCount = [firstChromosome.genes.count, secondChromosome.genes.count].min
    
    crossoverPoint1 = provider.nextInt(minGeneCount)
    crossoverPoint2 = provider.nextInt(crossoverPoint1, minGeneCount)
    diff = crossoverPoint2 - crossoverPoint1
    
    firstChild.genes =  firstChromosome.genes[0...crossoverPoint1] +
                        secondChromosome.genes[crossoverPoint1...(crossoverPoint1 + diff)] +
                        firstChromosome.genes[crossoverPoint2..-1]
    secondChild.genes = secondChromosome.genes[0...crossoverPoint1] +
                        firstChromosome.genes[crossoverPoint1...(crossoverPoint1 + diff)] +
                        secondChromosome.genes[crossoverPoint2..-1]
    return firstChild, secondChild
  end
  
end