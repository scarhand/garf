class TwoPointCrossover
  
  def crossover(first_chromosome, second_chromosome)
    provider = RandomProvider.instance
    firstChild = first_chromosome.clone
    secondChild = second_chromosome.clone
    minGeneCount = [first_chromosome.genes.count, second_chromosome.genes.count].min
    
    crossoverPoint1 = provider.nextInt(minGeneCount)
    crossoverPoint2 = provider.nextInt(crossoverPoint1, minGeneCount)
    diff = crossoverPoint2 - crossoverPoint1
    
    firstChild.genes =  first_chromosome.genes[0...crossoverPoint1] +
                        second_chromosome.genes[crossoverPoint1...(crossoverPoint1 + diff)] +
                        first_chromosome.genes[crossoverPoint2..-1]
    secondChild.genes = second_chromosome.genes[0...crossoverPoint1] +
                        first_chromosome.genes[crossoverPoint1...(crossoverPoint1 + diff)] +
                        second_chromosome.genes[crossoverPoint2..-1]
    return firstChild, secondChild
  end
  
end