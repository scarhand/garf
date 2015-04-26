class ThreeParentCrossover
  
  def crossover(firstChromosome, secondChromosome, thirdChromosome)
    
    raise "Gene counts do not match" if firstChromosome.genes.count != secondChromosome.genes.count || 
                                        secondChromosome.genes.count != thirdChromosome.genes.count
    result = firstChromosome.clone
    result.genes = []
    (0...firstChromosome.genes.count).each do |i|
      if firstChromosome.genes[i] == secondChromosome.genes[i]
        result.genes.push firstChromosome.genes[i]
      else
        result.genes.push thirdChromosome.genes[i]
      end
    end
    return result
  end
  
end