class FundingRound
    attr_accessor :investment, :type
    attr_reader :startup, :venture_capitalist
    
    @@all = []

    def initialize(startup, venture_capitalist, type, investment)
        @startup = startup
        @venture_capitalist = venture_capitalist
        @type = type
        @investment = [investment, 0].max.to_f
        @@all << self
    end

    def self.all
        @@all
    end 


end
