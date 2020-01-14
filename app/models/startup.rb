class Startup

    attr_accessor :name, :domain
    attr_reader :founder

    @@all = []

    def initialize(name,founder,domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
    end

    def self.find_by_founder(founder)
        self.all.find {|startup| startup.founder == founder}
    end

    def self.all
        @@all
    end

    def pivot(new_domain,startup_name)
        self.name = startup_name
        self.domain = new_domain
    end

    def self.domains
        self.all.map {|startup| startup.domain}
    end

    def sign_contract(vc,type_of_investment,amount)
        FundingRound.new(vc,type_of_investment,amount,self)
    end

    def num_funding_rounds
        FundingRound.all.select {|round| round.startup == self}.length
    end

    def total_funds
        FundingRound.all.select {|round| round.startup == self}.map {|investment| investment.investment}.sum
    end

    def investors
        FundingRound.all.select {|round| round.startup == self}.map {|round| round.venture_capitalist}.uniq
    end

    def big_investors
            # investors.select {|investor| VentureCapitalist.tres_commas_club.include?(investor)}
            big_investors = VentureCapitalist.tres_commas_club.each do |member| 
                if member.name == investors.any?
                    member
                end
            end  
            big_investors         
    end

end
