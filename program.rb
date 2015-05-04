require_relative 'Population'
require_relative 'Chromosome'
Dir["./crossover_strategies/*.rb"].each do |file|
  require file
end
Dir["./interfaces/*.rb"].each do |file|
  require file
end
puts __dir__


class Program
  def initialize
    pop = Garf::Population.new
    #CutSpliceCrossover.new
    pop.strategies = [Garf::Strategies::OnePointCrossover.new,
                      Garf::Strategies::TwoPointCrossover.new,
                      Garf::Strategies::UniformCrossover.new]
    gs = (0..20).map do |i|
      Garf::Gene.new(i)
    end
    c1 = Garf::Chromosome.new
    c1.genes = gs
    c2 = Garf::Chromosome.new
    c2.genes = c1.genes.dup.shuffle
    c3 = Garf::Chromosome.new
    c3.genes = c1.genes.dup.shuffle
    c4 = Garf::Chromosome.new
    c4.genes = c1.genes.dup.shuffle
    pop.current_population = [c1, c2, c3, c4]
    puts pop.to_s
    3.times do
      puts "#{'-'*40} EVOLVING... #{'-'*40}"
      pop = pop.evolve
      puts pop.to_s
    end
  end
end


Program.new