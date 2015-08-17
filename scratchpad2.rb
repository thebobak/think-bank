# require 'mechanize'

# link = 'http://www.brookings.edu/blogs/markaz/posts/2015/07/12-iran-nuclear-deal-prague-agenda-nonproliferation-obama-eisen'

# mechanize = Mechanize.new
# page = mechanize.get(link)

# puts page.at('body').text.strip




p doc1 = "new home sales top forecasts".split(' ')
p doc2 = "home sales rise in july".split(' ')
p doc3 = "increase in home sales in july".split(' ')

p docs = [doc1, doc2, doc3]

words = Array.new
dict = Array.new

for doc in docs
	for word in doc
		if not words.include?(word)
			words.push(word)
			newword = {word => 1}
			dict << newword
			puts newword[word]
		else
			dict[word.to_s] += 1
		end
	end
end

p words
p dict