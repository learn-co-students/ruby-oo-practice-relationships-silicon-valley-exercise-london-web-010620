class VentureCapitalist

    attr_reader :name, :total_worth
    
    @@all = []

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth

        @@all << self
    end

    def self.all
        @@all
    end

    #returns array of venture capitalists with more than 1,000,000,000
    def self.tres_commas_club
        self.all.select {|vcs| vcs.total_worth >= 1000000000}
    end

    def offer_contract(startup, type, investment)
        FundingRound.new(startup, self, type, investment)
    end

    def funding_rounds
        FundingRound.all.select {|round| round.venture_capitalist == self}
    end

    def portfolio
        array = funding_rounds.map {|round| round.startup }
        array.uniq
    end

    def biggest_investment
        funding_rounds.reduce {|total, curr| biggest.investment > curr.investment ? biggest : curr}
    end
        

    def invested(domain)
        array = FundingRound.all.select {|round| round.startup.domain == domain}.map {|round| round.investment}
        array.sum
    end
end
