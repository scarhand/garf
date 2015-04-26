class Mutate
  
  def self.mutate(originalGene)
    originalGene.value ^= 1
  end
  
end