class VentureCapitalist

    attr_accessor :name, :total_worth

    @@all = []

    def initialize(name,total_worth)
        @name = name
        @total_worth = total_worth
        @@all << self

    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        @@all.select {|vc| vc.total_worth > 999999999}
    end

    def offer_contract(startup,type,investment)
        FundingRound.new(startup,type,investment,self)
    end

    def funding_rounds
        FundingRound.all.select {|round| round.venture_capitalist == self}
    end

    def portfolio
        funding_rounds.map {|round| round.startup}.uniq
    end

    def biggest_investment
        funding_rounds.max_by {|round| round.investment}
        
    end

    def invested(domain)
        FundingRound.all.select {|round| round.startup.domain == domain}.map {|round| round.investment}.sum
        
    end
end
