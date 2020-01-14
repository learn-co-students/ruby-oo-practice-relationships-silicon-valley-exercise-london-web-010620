class FundingRound

  @@all = [] 

  attr_accessor :startup, :venture_capitalist, :type, :investment
    
  def initialize(startup, venture_capitalist, type, investment)
    @startup = startup
    @venture_capitalist = venture_capitalist
    @type = type 
    @investment = [investment, 0].to_f #no negative and float 
    @@all << self 
  end

  def self.all 
    @@all
  end 










end


