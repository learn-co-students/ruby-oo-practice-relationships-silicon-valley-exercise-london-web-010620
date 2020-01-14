class FundingRound

    attr_accessor :venture_capitalist
    attr_reader :funding_round, :startup, :investment

    @@all = []

    def initialize(startup, venture_capitalist, funding_round = "Angel", investment = 0.0)
        @startup = startup
        @venture_capitalist = venture_capitalist
        @funding_round = funding_round
        @investment = investment

        @@all << self 
    end

    def self.all
        @@all
    end

end
