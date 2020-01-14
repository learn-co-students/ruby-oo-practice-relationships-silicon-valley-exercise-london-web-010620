class VentureCapitalist
    attr_accessor :total_worth
    attr_reader :name

    @@all = []

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        @@all << self
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        @@all.select { |vp| vp.total_worth > 1000000000 }
    end

    def offer_contract(startup, type, investment)
        FundingRound.new(startup, self, type, investment)
    end

    def funding_rounds
        FundingRound.all.select { |fr| fr.venture_capitalist == self }
    end

    def portfolio
        self.funding_rounds.map { |fr| fr.startup }.uniq
    end

    def biggest_investment
        self.funding_rounds.max { |fr1, fr2| fr1.investment <=> fr2.investment }
    end

end
