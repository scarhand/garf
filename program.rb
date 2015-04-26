require_relative 'Population'
require_relative 'Chromosome'
Dir.glob("./crossover_strategies/*.rb").each do |file|
  require file
end
Dir.glob("./interfaces/*.rb").each do |file|
  require file
end



class Program
  def initialize
    pop = Population.new
    pop.strategies = [OnePointCrossover.new, TwoPointCrossover.new, UniformCrossover.new]
    gs = (0..9).map do |i|
      Gene.new(i)
    end
    c1 = Chromosome.new
    c1.genes = gs
    c2 = Chromosome.new
    c2.genes = c1.genes.dup.shuffle
    c3 = Chromosome.new
    c3.genes = c1.genes.dup.shuffle
    c4 = Chromosome.new
    c4.genes = c1.genes.dup.shuffle
    pop.currentPopulation = [c1, c2, c3, c4]
    puts pop.to_s
    10.times do
      puts "#{'-'*40} EVOLVING... #{'-'*40}"
      pop = pop.evolve
      puts pop.to_s
    end
    #puts pop.to_s
    #puts "EVOLVING..."
    #pop2 = pop.evolve
    #puts pop2.to_s
    #puts "EVOLVING..."
    #pop3 = pop2.evolve
    #puts pop3.to_s
  end
end


Program.new