require 'mechanize'
require 'rss'
require 'httparty'
require 'mysql'
require 'yaml'

def read_config
	config = YAML.load_file("config/config.yml")
	return config
end



link = 'http://www.brookings.edu/blogs/markaz/posts/2015/07/12-iran-nuclear-deal-prague-agenda-nonproliferation-obama-eisen'
#feed = RSS::Parser.parse(link, false)

	mechanize = Mechanize.new
	page = mechanize.get(link)
	possible = page.search("//a[@rel='author']")
	p page.search("//meta[@name='ces:authors']")[0][:content]

	for item in possible
		puts item
	end


	mystring = "        hello"

	puts mystring
	puts mystring.lstrip





