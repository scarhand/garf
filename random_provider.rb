require 'singleton'

class RandomProvider
  include Singleton
  
  def initialize
    @random = Random.new
  end
  
  def next_double
    @random.rand
  end
  
  def next_int(min = nil, max = nil)
    if(min.nil? && max.nil?)
      min = 0
      max = 2_147_483_647 #from c_sharp Integer.MaxValue
    elsif(!min.nil? && max.nil?)
      max = min
      min = 0
    end
    @random.rand min..max
  end
end