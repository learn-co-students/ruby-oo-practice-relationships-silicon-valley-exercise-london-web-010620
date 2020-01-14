class VentureCapitalist

    attr_accessor :name, :total_worth
    attr_reader :funding_round, :startup, :venture_capitalist

    @@all = []

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth

        @@all << self
    end

    def self.all 
        @@all
    end

    def self.tres_comma_club
        VentureCapitalist.all.select {|i| i.total_worth > 1000000000}
    end

    def offer_contract(startup, funding_round, investment)
        FundingRound.new(startup, self, funding_round, investment)
    end

    def funding_rounds
        FundingRound.all.select {|i| i.venture_capitalist == self}
    end

    def portfolio
        FundingRound.all.map {|i| i.startup}.uniq
    end

    def biggest_investment
        funding_rounds.max_by {|i| i.investment}
    end

    def invested(domain)
        FundingRound.all.select {|i| i.startup.domain == domain}.map{|domain| domain.investment}.sum
    end

end
