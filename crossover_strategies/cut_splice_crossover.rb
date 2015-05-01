class CutSpliceCrossover
  
  def crossover(first_chromosome, second_chromosome)
    provider = RandomProvider.instance
    firstChild = first_chromosome.clone
    secondChild = second_chromosome.clone
    
    crossoverPoint1 = provider.next_int(0, first_chromosome.genes.count)
    crossoverPoint2 = provider.next_int(0, second_chromosome.genes.count)
    
    firstChild.genes = first_chromosome.genes[0..crossoverPoint1] + second_chromosome.genes[crossoverPoint2..-1]
    secondChild.genes = second_chromosome.genes[crossoverPoint2..-1] + first_chromosome.genes[0..crossoverPoint1]
    
    return firstChild, secondChild
  end
end