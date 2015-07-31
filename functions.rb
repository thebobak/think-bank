require 'mechanize'
require 'mysql'
require 'mongo'
require 'csv'

sites = []

CSV.foreach(File.path("list.csv")) do |col|
    # Where col corresponds to a zero-based value/column in the csv
    sites << [col[0] + " " + col[1]]
end

mechanize = Mechanize.new

puts sites
#baseurl = 'http://brookings.edu'
#page = mechanize.get(baseurl)

#@mainpage = page.links

#puts @mainpage

def isArticle?(url)
	
	# possible parameters:
	# page contains a date

end





def crawl(url, depth)

	# start at top url
	# get list of all links
	# Open each link
		# if the page is an article, push it into the database
		# if it does not exist
		# else,
	# call crawl with new url and depth-1

	# returns true when complete?

end




def addToDb(url, date, title, authors)

end

