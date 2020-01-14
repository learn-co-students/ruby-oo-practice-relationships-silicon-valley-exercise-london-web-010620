require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console
s1 = Startup.new("iYeild", "Paul", "PropTech")
s2 = Startup.new("BBB", "Name: BBB", "BBB")
s3 = Startup.new("CCC", "Name: CCC", "PropTech")
s4 = Startup.new("DDD", "Name: DDD", "DDD")
s5 = Startup.new("EEE", "Name: EEE", "BBB")

v1 = VentureCapitalist.new("aaa", 1000)
v2 = VentureCapitalist.new("bbb", 2000)
v3 = VentureCapitalist.new("ccc", 3000)
v4 = VentureCapitalist.new("ddd", 4000)
v5 = VentureCapitalist.new("eee", 5000)
v6 = VentureCapitalist.new("fff", 1000000001)

f1 = FundingRound.new(s1, v1, "Seed", 100.00)
f2 = FundingRound.new(s2, v2, "Angel", 50.00)
f3 = FundingRound.new(s3, v1, "Angel", 10.00)
f4 = FundingRound.new(s4, v2, "Pre-Seed", 12.00)
f5 = FundingRound.new(s5, v5, "Series A", 30.00)
f6 = FundingRound.new(s2, v3, "Series C", 50.00)
f7 = FundingRound.new(s2, v4, "Series C", 200.00)
f8 = FundingRound.new(s2, v4, "Series B", 500.00)
f9 = FundingRound.new(s4, v6, "Pre-Seed", 10_000_000.00)
f10 = FundingRound.new(s1, v6, "Seed", 5000.00)
f11 = FundingRound.new(s5, v5, "Series A", 400.00)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line