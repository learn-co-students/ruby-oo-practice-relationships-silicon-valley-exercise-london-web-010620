require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

s1 = Startup.new("Revolut", "John", "Finance")
s2 = Startup.new("Igloo",	"Jane", "Energy")
s3 = Startup.new("Trouva", "Tom", "Retail")

vc1 = VentureCapitalist.new("Perfect Partners", 600000)
vc2 = VentureCapitalist.new("Virtuous Ventures", 30000000)
vc3 = VentureCapitalist.new("Free For All Fund", 1000000000)

fr1 = FundingRound.new(s1, vc1, "Angel", 2000)
fr2 = FundingRound.new(s2, vc1, "Seed", 1000)
fr3 = FundingRound.new(s3, vc2, "Series A", 3000)
fr4 = FundingRound.new(s2, vc3, "Angel", 5000)


binding.pry
0 #leave this here to ensure binding.pry isn't the last line