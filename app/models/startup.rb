class Startup

    attr_reader :name, :founder, :domain
    attr_accessor :pivot

    @@all = []

    def initialize(name, founder, domain)
        @name = name 
        @founder = founder
        @domain = domain

        @@all << self
    end

    def self.all
        @@all
    end

    def pivot=(new_domain, new_name)
        @name = new_name
        @domain = new_domain
    end


    def self.find_by_founder(founder)
        Startup.all.find {|startup| startup.founder == founder}
    end

    def self.domains
        Startup.all.each {|startup| startup.domain}
    end

    def sign_contract(venture_capitalist, funding_round, investment )
        FundingRound.new(self, venture_capitalist, funding_round, investment)
    end

    def funding_startup
        FundingRound.all.select {|funding| funding.startup == self}
    end

    def num_funding_round
        funding_startup.length
        # FundingRound.all.select {|funding| funding.startup == self}.length
    end

    def total_funds
        funding_startup.map{|i| i.investment}.sum
    end

    def investors 
        funding_startup.map {|i| i.venture_capitalist}.uniq
    end

    def big_investors
        investors.select {|vcs| VentureCapitalist.tres_comma_club.include?(vcs)}
    end

end
