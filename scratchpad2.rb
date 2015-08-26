# require 'mechanize'

# link = 'http://www.brookings.edu/blogs/markaz/posts/2015/07/12-iran-nuclear-deal-prague-agenda-nonproliferation-obama-eisen'

# mechanize = Mechanize.new
# page = mechanize.get(link)

# puts page.at('body').text.strip




p doc1 = "new home sales top forecasts".split(' ')
p doc2 = "home sales rise in july".split(' ')
p doc3 = "increase in home sales in july".split(' ')

p docs = [doc1, doc2, doc3]

#words = Array.new
#dict = Array.new

docid = 0
pos = 0

dict = {}

# dict["home"] = [0,1]

# puts dict.keys
# p dict.values
# p dict["home"]
# dict["home"] << 5
# p dict["home"]

# mysym = "hello".to_sym
# p mysym

# p dict["beep"]

for doc in docs
	for word in doc
		w = word.to_sym
		if !dict[w]
			dict[w] = [docid]
		else
			if !dict[w].include?(docid)
				dict[w] << docid
			end
		end
	end
	docid += 1
end


for key in dict.keys
	puts key
	p dict[key]
end

query1 = "home".to_sym
query2 = "sales".to_sym
results = []

docid = 0
while docid < docs.length
	if dict[query1].include?(docid) && dict[query2].include?(docid)
		results << docid
	end
	docid += 1
end

puts "#{results} contains both queries"
