class UniformCrossover
  
  def initialize(probability = 0.5)
    @probability = probability
  end
  
  
  def crossover(first_chromosome, second_chromosome)
    
    raise "Gene counts do not match" if first_chromosome.genes.count != second_chromosome.genes.count
    
    provider = RandomProvider.instance
    firstChild = first_chromosome.clone
    secondChild = second_chromosome.clone
    
    firstChild.genes = []
    secondChild.genes = []
    
    (0...first_chromosome.genes.count).each do |i|
      p = provider.next_double
      if(p < @probability)
        firstChild.genes.push first_chromosome.genes[i]
        secondChild.genes.push second_chromosome.genes[i]
      else
        firstChild.genes.push second_chromosome.genes[i]
        secondChild.genes.push first_chromosome.genes[i]
      end
    end
    
    return firstChild, secondChild
  end
  
end