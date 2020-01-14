require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console
vc_a = VentureCapitalist.new("vc_11",100)
vc_b = VentureCapitalist.new("vc_22",200) 
vc_c = VentureCapitalist.new("vc_66",2000000000000) 
vc_d = VentureCapitalist.new("vc_33",3000000000)

startup_AA = Startup.new("startup_11","founder_AAA","domain_AAA")
startup_BB = Startup.new("startup_22","founder_BBB","domain_BBB")
startup_CC = Startup.new("startup_33","founder_CCC", "domain_CCC")

round_1 = FundingRound.new(vc_d,"round_A",100,startup_AA)
round_2 = FundingRound.new(vc_b,"round_A",20,startup_BB)
round_3 = FundingRound.new(vc_a,"round_B",30,startup_AA)
round_4 = FundingRound.new(vc_b,"round_D",40,startup_CC)
round_4 = FundingRound.new(vc_d,"round_D",40,startup_AA)

binding.pry

puts "works!"