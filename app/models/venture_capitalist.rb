class VentureCapitalist
    @@all = [] 
    attr_accessor :name, :total_worth
    
    def initialize(name, total_worth)
         @name = name 
         @total_worth = total_worth
         @@all << self 
    end 

    def self.all
        @@all 
    end 


    def self.tres_commas_club
        self.all.select{|venture_cap| venture_cap.total_worth >= 1_000_000_000}
    end 

    def offer_contract(startup, type, investment)
        VentureCapitalist.new(startup, self, type, investment)
    end 

    def funding_rounds 
        FundingRound.all.select{|fundinground| fundinground.venture_capitalist == self}

    end 

    def portfolio 
        funding_rounds.map{|venture_cap| venture_cap.startup}.uniq

    end 

    def biggest_investment 
        funding_rounds.max_by{|fundinground| fundinground.investment }
    end 

    def invested(domain)
        FundingRound.all.select {|fundinground| fundinground.startup.domain == domain}.map{|domain| domain.investment}.sum

    end 






end
