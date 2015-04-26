class UniformCrossover
  
  def initialize(probability = 0.5)
    @probability = probability
  end
  
  
  def crossover(firstChromosome, secondChromosome)
    
    raise "Gene counts do not match" if firstChromosome.genes.count != secondChromosome.genes.count
    
    provider = RandomProvider.instance
    firstChild = firstChromosome.clone
    secondChild = secondChromosome.clone
    
    firstChild.genes = []
    secondChild.genes = []
    
    (0...firstChromosome.genes.count).each do |i|
      p = provider.nextDouble
      if(p < @probability)
        firstChild.genes.push firstChromosome.genes[i]
        secondChild.genes.push secondChromosome.genes[i]
      else
        firstChild.genes.push secondChromosome.genes[i]
        secondChild.genes.push firstChromosome.genes[i]
      end
    end
    
    return firstChild, secondChild
  end
  
end