class Gene
  attr_accessor :value
  
  def initialize(value)
    @value = value
  end
  
  def clone
    Gene.new(value)
  end
  
  def to_s
    value.to_s
  end
end