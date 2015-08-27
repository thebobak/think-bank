require 'mechanize'
require 'sanitize'


COMMON_WORDS = %w(a about above across after again against all almost alone along already also although always among an and another any anybody anyone anything anywhere are area areas around as ask asked asking asks at away b back backed backing backs be became because become becomes been before began behind being beings best better between big both but by c came can cannot case cases certain certainly clear clearly come could d did differ different differently do does done down down downed downing downs during e each early either end ended ending ends enough even evenly ever every everybody everyone everything everywhere f face faces fact facts far felt few find finds first for four from full fully further furthered furthering furthers g gave general generally get gets give given gives go going good goods got great greater greatest group grouped grouping groups h had has have having he her here herself high high high higher highest him himself his how however i if important in interest interested interesting interests into is it its itself j just k keep keeps kind knew know known knows l large largely last later latest least less let lets like likely long longer longest m made make making man many may me member members men might more most mostly mr mrs much must my myself n necessary need needed needing needs never new new newer newest next no nobody non noone not nothing now nowhere number numbers o of off often old older oldest on once one only open opened opening opens or order ordered ordering orders other others our out over p part parted parting parts per perhaps place places point pointed pointing points possible present presented presenting presents problem problems put puts q quite r rather really right right room rooms s said same saw say says second seconds see seem seemed seeming seems sees several shall she should show showed showing shows side sides since small smaller smallest so some somebody someone something somewhere state states still still such sure t take taken than that the their them then there therefore these they thing things think thinks this those though thought thoughts three through thus to today together too took toward turn turned turning turns two u under until up upon us use used uses v very w want wanted wanting wants was way ways we well wells went were what when where whether which while who whole whose why will with within without work worked working works would x y year years yet you young younger youngest your yours z)
FILTER_WORDS = %w(facebook twitter rss youtube)

links = [
	"http://www.aei.org/publication/effect-state-policy-on-college-choice-match/",
	"https://www.americanprogress.org/issues/green/report/2015/08/26/120056/a-4-point-plan-for-responsibly-expanding-renewable-energy-production-on-americas-public-lands-and-oceans/"
]


def buildIndex(link)
	mechanize = Mechanize.new
	page = mechanize.get(link)
	
	content = page.at('body')
	content = Sanitize.clean(content, :remove_contents => ['script', 'style'])
	content = content.downcase.scan(/[a-z]+/i)
	content.delete_if do |word|
		COMMON_WORDS.include?(word)
		end
	content.delete_if do |word|
		FILTER_WORDS.include?(word)
	end
	
	counts = Hash.new 0

	## Creates a hash with the occurrences of each word ##
	# content.each do |word|
	# 	counts[word] += 1
	# end
	# counts = counts.sort_by {|key, value| value}
	# counts = counts.reverse
	# puts counts

	indices = content.each_with_index.inject(Hash.new { Array.new }) do |hash, (obj, i)| 
    	hash[obj] += [i]
    	hash
	end

	puts indices

	# returns the counts of each key (i.e., the length of its 'value' array)
	# indices.each do |key, value|
	# 	p value.length
	# end








end


for link in links
	buildIndex(link)
end

