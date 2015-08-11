require 'mechanize'
require 'rss'
require 'httparty'
#require 'mysql'
require 'yaml'
require 'mysql2'

STDOUT.sync = true


#########################
# Objects
#########################

class Article
   @@count=0

	def initialize(url, scandate, pubdate, title, organization, author)
   		@url = url
    	@scandate = scandate
    	@pubdate = pubdate
    	@title = title
    	@organization = organization
    	@author = author
    	@@count += 1
    end

    def self.count
    	@@count
    end

    attr_accessor :url
    attr_accessor :scandate
    attr_accessor :pubdate
    attr_accessor :title
    attr_accessor :organization
    attr_accessor :author

end

##################################

def getConfig
	path = "config/config.yml"
	config = YAML.load_file(path)
	return config
end


def getAuthor(link)
	mechanize = Mechanize.new
	page = mechanize.get(link)

	if page.at("meta[name='ces:authors']")
		text = page.at("meta[name='ces:authors']")[:content]
		authors = text.split(/\s*[;]\s*/)
		puts authors
	end

end


########################
# Open MySQL Connection
########################

begin
	config = getConfig
	puts "Opening MySQL Connection...\n"
	#db_connection = Mysql.new('mysql.thebobak.com', 'thebobakcom', 'u2ZRmSh9', 'thinkbankdev')
	db_connection = Mysql2::Client.new(
		:host 		=> config["host"],
		:user 		=> config["user"],
		:password 	=> config["password"],
		:database 	=> config["database"],
		:encoding 	=> config["encoding"]
  	)
	puts "MySQL Connection Open!\n"
	
rescue 	Mysql2::Error => e
	puts "MySQL Error Encountered:"
	puts "------------------------"
	puts e.errno
	puts e.error
	puts "------------------------\n\n"

ensure
	#db_connection.close if db_connection
	#puts "** MySQL Connection Closed **\n\n"
end


################
# Some Globals #
################

links = Array.new
Articles = Array.new


###########################
# Console Welcome Message #
###########################

puts "\n\t\t===== Welcome to Think Bank =====\n\n"

############################################
# Query DB for list of RSS feeds to scrape #
# Push into an array                       #
############################################

sql_statement = 'SELECT * FROM tb_organizations WHERE organization_rss_url IS NOT NULL AND organization_skip_flag IS NULL'
rs = db_connection.query(sql_statement)
rs.each do |h| 
	links.push(h['organization_rss_url'].to_s)
end

puts "\n\n#{rs.size} RSS feeds to be scraped for articles...\n\n"


###################
# Run the Scraper #
###################

for link in links

	feed = RSS::Parser.parse(link, false) #gets links from RSS feed
	

	if (feed != nil)
		puts "NOW SCRAPING:  #{link}"
		count = 0
		for item in feed.items
			# This scrapes the content from each RSS link #
			mechanize = Mechanize.new
			page = mechanize.get(item.link) # gets and loads page

			# page refers to the article's webpage; item refers to the RSS feed item

			theUri		= page.uri.to_s.split('?')[0] #removes extra URL arguments
			theScanDate = Time.new
			thePubDate	= item.pubDate.strftime("%Y-%m-%d %H:%M:%S")
			theTitle	= item.title # page.title adds unnecessary leading whitespace
			theTitle 	= db_connection.escape(theTitle) # escapes for MYSQL
			theOrg		= "" #will hold the organization's name

			# Lookup the Organization's Name based on URL #

			sql_statement = "SELECT * FROM tb_organizations WHERE organization_rss_url = '#{link}'"
			rs = db_connection.query(sql_statement)
			rs.each do |h| 
				theOrg = h['organization_name'].to_s
			end

			#getAuthor(item.link)


			# Push into an array of Articles
			Articles.push(Article.new(theUri, theScanDate, thePubDate, theTitle, theOrg, "Author"))

			# Insert into DB #
			sql_statement = "INSERT IGNORE INTO Think(Title, Hyperlink, PubDate, Organization) VALUES('#{theTitle}', '#{theUri}', '#{thePubDate}', '#{theOrg}')"
	 		db_connection.query(sql_statement)

	 		count += 1
		end
		puts "\t#{count} links scraped and added to the DB"
		puts "DONE SCRAPING:  #{link}\n======================="
	end
end


##################################
# Print out the scanned Articles #
##################################

puts "\n\n\n"
puts "#{Article.count} articles scraped"
for article in Articles
	puts article.url
end


###########################
# Close the DB connection #
###########################

db_connection.close if db_connection


puts "End of Program"