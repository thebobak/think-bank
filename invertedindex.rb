# Sample Documents #

doc1 = "new home sales top forecasts".split(' ')
doc2 = "home sales rise in july".split(' ')
doc3 = "increase in home sales in july".split(' ')

# Array of Documents #
docs = [doc1, doc2, doc3]



dict = {}
docid = 0

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
	puts "\"#{key}\" exists in documents #{dict[key].to_s}"
end



