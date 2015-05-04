module Garf
  class Mutate
    
    def self.mutate(original_gene)
      original_gene.value ^= 1
    end
    
  end
end