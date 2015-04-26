class Population
  
  attr_accessor :currentPopulation, :offspring, :strategies, :currentGeneration
  attr_reader :crossoverChance, :mutationChance
  
  def initialize
    @currentGeneration = 0
    @currentPopulation = [] #Chromosomes
    @offspring = [] #Chromosomes
    @strategies = []
    # Chance that the crossover operation occurs = Pc(1 - CrossoverChance).
    # Default is 0.7 (70% chance).
    @crossoverChance = 0.7 
    # Chance that a mutation occurs in a gene = Pm(1 - MutationChance).
    # Default is 0.001 (0.1% chance)
    @mutationChance = 0.001
  end
  
  def populationSize
    currentPopulation.count
  end
    
  def evolve
    provider = RandomProvider.instance
    population = Population.new
    population.currentGeneration = currentGeneration+1
    population.strategies = strategies
    currentPopulation.inject do |c1,c2|
      p = provider.nextDouble
      if p < @crossoverChance
        strategy = strategies[provider.nextInt(0,strategies.count-1)]
        crossed = strategy.crossover c1, c2
        mutate *crossed
        population.currentPopulation.push *crossed # splat the array to single values
      else
        c1 = c1.clone
        c2 = c2.clone
        mutate c1, c2
        population.currentPopulation.push c1,c2
      end
      c2
    end
    #remove duplicates
    population.currentPopulation.uniq!
    offspring = population.currentPopulation
    return population
  end
  
  def to_s
    "POPULATION (SIZE #{populationSize}) (GENERATION #{currentGeneration}) \n#{currentPopulation.join("\n")}"
  end
  
  private
  def mutate(*chromosomes)
    provider = RandomProvider.instance
    chromosomes.each do |c|
      c.genes.each do |g|
        Mutate.mutate(g) if provider.nextDouble <= @mutationChance
      end
    end
  end
end