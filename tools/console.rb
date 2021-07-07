require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console
s1 = Startup.new("Alex", "Bill", "FinTech")
s2 = Startup.new("Bob", "Simon", "Crypto")
s3 = Startup.new("Sergio", "Woijech", "MedTech")

v1 = VentureCapitalist.new("Rik", 1_000_000_000_000)
v2 = VentureCapitalist.new("Bil", 2_000_000)
v3 = VentureCapitalist.new("Chris", 4_000_000)

f1 = FundingRound.new(s1, v1, "Seed", 300_000 )
f2 = FundingRound.new(s1, v1, "Angel", 700_000 )
f3 = FundingRound.new(s2, v2, "Series 1", 600_000 )
f4 = FundingRound.new(s3, v3, "Series 2", 500_000 )



binding.pry
0 #leave this here to ensure binding.pry isn't the last line