require 'mechanize'

def getAuthor(link)
	mechanize = Mechanize.new
	page = mechanize.get(link)
	authors = ""


	# AEI
	if page.at("//a[@rel='author']")
		authors = page.at("//a[@rel='author']").text
	end


	#Amnesty International - No Authors

	
	# Brookings #
	if page.at("meta[name='ces:authors']")
		text = page.at("meta[name='ces:authors']")[:content]
		authors = text.split(/\s*[;]\s*/)
		
	end




	p authors

end



link = "http://www.aei.org/publication/effect-state-policy-on-college-choice-match/"


getAuthor(link)