class Startup
    attr_accessor  
    attr_reader :founder, :name, :domain

    @@all = []

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
    end

    def pivot(domain, name)
        @name = name
        @domain = domain
    end

    def self.all
        @@all
    end

    def self.find_by_founder(founder)
        @@all.find { |startup| startup.founder == founder }
    end

    def self.domains
        @@all.map { |startup| startup.domain }
    end

    def sign_contract(venture_capitalist, type, investment)
        FundingRound.new(self, venture_capitalist, type, investment)
    end

    def num_funding_rounds
        FundingRound.all.select { |fr| fr.startup == self }.count
    end

    def funding_rounds
        FundingRound.all.select { |fr| fr.startup == self }
    end

    def total_funds
        self.funding_rounds.reduce(0) { |total, fr| total + fr.investment }
    end

    def investors
        self.funding_rounds.map { |fr| fr.venture_capitalist }.uniq
    end

    def big_investors
        investors.select {|investor| VentureCapitalist.tres_commas_club.include?(investor)}
    end


end
