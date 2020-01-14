class Startup

    @@all = [] 

    attr_accessor :name, :founder, :domain  
    
    def initialize(name, founder, domain)
        @name = name 
        @founder = founder 
        @domain = domain
        
        @@all << self 
    end 

    def self.all
        @@all 
    end 

    def pivot(new_domain, new_name)
        self.domain = new_domain
        self.name = new_name        
        
    end

    def self.find_by_founder(founder)
        self.all.find{|startup| startup.founder == founder} 
    end 

    def self.domains
        self.all.map{|startup| startup.domain}
    end 

    def sign_contract(venture_capitalist, type, investment)
        FundingRound.new(self, venture_capitalist, type, investment)
    end 

    def fundinground_startup
        FundingRound.all.select{|fundinground| fundinground.startup == self }
    end 

    def num_funding_rounds
        fundinground_startup.count
    end 
    
    def total_funds
        fundinground_startup.map{|fundinground| fundinground.investment}.sum

    end 

    def investors 
        fundinground_startup.map{|fundinground| fundinground.venture_capitalist}.uniq

    end 

    def big_investors 
        #investors.select{|investor| investor.total_worth >= 1_0000_000}
        investors.select{|investor| VentureCapitalist.tres_commas_club.include?(investor)}
    end 

    

            


    

end 










