class FundingRound
    
    attr_reader :venture_capitalist
    attr_accessor :type, :investment, :startup

    @@all = []
    
    def initialize(venture_capitalist,type,investment,startup)
        @venture_capitalist = venture_capitalist
        @type = type
        @investment = investment.to_f
        @startup = startup
        @@all << self
    end

    def self.all
        @@all 
    end

    

end
