class Population
  
  attr_accessor :current_population, :offspring, :strategies, :current_generation
  attr_reader :crossover_chance, :mutation_chance
  
  def initialize
    @current_generation = 0
    @current_population = [] #Chromosomes
    @offspring = [] #Chromosomes
    @strategies = []
    # Chance that the crossover operation occurs = Pc(1 - CrossoverChance).
    # Default is 0.7 (70% chance).
    @crossover_chance = 0.7 
    # Chance that a mutation occurs in a gene = Pm(1 - MutationChance).
    # Default is 0.001 (0.1% chance)
    @mutation_chance = 0.001
  end
  
  def populationSize
    current_population.count
  end
    
  def evolve
    provider = RandomProvider.instance
    population = Population.new
    population.current_generation = current_generation+1
    population.strategies = strategies
    current_population.inject do |c1,c2|
      p = provider.next_double
      if p < @crossover_chance
        strategy = strategies[provider.next_int(0,strategies.count-1)]
        crossed = strategy.crossover c1, c2
        mutate *crossed
        population.current_population.push *crossed # splat the array to single values
      else
        c1 = c1.clone
        c2 = c2.clone
        mutate c1, c2
        population.current_population.push c1,c2
      end
      c2
    end
    #remove duplicates
    population.current_population.uniq!
    offspring = population.current_population
    return population
  end
  
  def to_s
    "POPULATION (SIZE #{populationSize}) (GENERATION #{current_generation}) \n#{current_population.join("\n")}"
  end
  
  private
  def mutate(*chromosomes)
    provider = RandomProvider.instance
    chromosomes.each do |c|
      c.genes.each do |g|
        Mutate.mutate(g) if provider.next_double <= @mutation_chance
      end
    end
  end
end