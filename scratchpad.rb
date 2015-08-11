require 'mechanize'
require 'rss'
require 'httparty'
require 'mysql'
require 'yaml'
require_relative 'test'

def read_config
	config = YAML.load_file("config/config.yml")
	return config
end

printSomething()

links = [
	'http://www.brookings.edu/blogs/markaz/posts/2015/07/12-iran-nuclear-deal-prague-agenda-nonproliferation-obama-eisen',
	'http://www.aei.org/publication/in-praise-of-the-sharing-peer-to-peer-economy/',
	'http://www.amnestyusa.org/research/reports/black-friday-carnage-in-rafah-during-2014-israelgaza-conflict',
	'http://www.aei.org/publication/defense-bill-at-an-impasse-but-a-solution-is-within-reach/',
	'http://www.brookings.edu/research/papers/2015/07/29-best-interest-retirement-savers',
	'https://www.americanprogress.org/issues/general/news/2015/07/29/118354/eliminating-abusive-financial-practices-on-campus/',
	'http://csis.org/publication/turkeys-shift-isis-reasons-and-implications'

]

for link in links
#feed = RSS::Parser.parse(link, false)

	mechanize = Mechanize.new
	page = mechanize.get(link)
	possible = page.search("//a[@rel='author']")
	possible2 =  page.search("//meta[@name='ces:authors']")[0][:content]

	if possible
		for item in possible
			puts item
		end
	end



end


