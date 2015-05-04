module Garf
  module Strategies
    class ThreeParentCrossover
      
      def crossover(first_chromosome, second_chromosome, third_chromosome)
        
        raise "Gene counts do not match" if first_chromosome.genes.count != second_chromosome.genes.count || 
                                            second_chromosome.genes.count != third_chromosome.genes.count
        result = first_chromosome.clone
        result.genes = []
        (0...first_chromosome.genes.count).each do |i|
          if first_chromosome.genes[i] == second_chromosome.genes[i]
            result.genes.push first_chromosome.genes[i]
          else
            result.genes.push third_chromosome.genes[i]
          end
        end
        return result
      end
    end
  end
end