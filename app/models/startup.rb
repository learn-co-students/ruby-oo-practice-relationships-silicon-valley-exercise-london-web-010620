class Startup

    attr_reader :founder_name
    attr_accessor :name, :domain

    @@all = []

    def initialize(name, founder_name, domain)
        @name = name
        @founder_name = founder_name
        @domain = domain
        @@all << self
    end

    #change the domain and name of the startup
    def pivot(domain, name)
        @domain = domain
        @name = name
    end

    

    def self.all
        @@all
    end

    #given a string of a **founder's name**, returns the **first startup** whose founder's name matches
    def self.find_by_founder(founder)
        self.all.find {|startup| startup.founder_name}
    end

    #should return an **array** of all of the different startup domains
    def self.domains
        self.all.map {|startup| startup.domain}
    end

    
    def sign_contract(venture_capitalist, type, investment)
        FundingRound.new(self, venture_capitalist, type, investment)
    end

    def specific_funding_rounds
        FundingRound.all.select {|round| round.startup == self}
    end
    #Returns the total number of funding rounds that the startup has gotten
    def num_funding_rounds
        specific_funding_rounds.length
    end

    #Returns the total sum of investments that the startup has gotten
    def total_funds
       array = specific_funding_rounds.map {|round| round.investment }
       array.sum
    end

    def investors
        array = specific_funding_rounds.map {|round| round.venture_capitalist}
        array.uniq
    end

    #Returns uniq array of the venture capitalists that have invested in this company 
    # and are in the Trés Commas club
    def big_investors
        #investors is an []
        # .include?() -> returns true or false 
        investors.select {|investor| VentureCapitalist.tres_commas_club.include?(investor)}
    end
end
