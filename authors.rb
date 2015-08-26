require 'mechanize'

def getAuthor(link)
	mechanize = Mechanize.new
	page = mechanize.get(link)
	authors = []

	# AEI
	if page.at("//a[@rel='author']")
		authors << page.at("//a[@rel='author']").text
	end

	# Amnesty International - No Authors
	# Asia Foundation
	# Asia Society
	# Atlantic Council
	# Bipartisan Policy Center

	# Brookings #
	if page.at("meta[name='ces:authors']")
		text = page.at("meta[name='ces:authors']")[:content]
		authors << text.split(/\s*[;]\s*/)
		
	end

	# Bruegel
	# Canadian International Council
	# Carnegie Council for Ethics in International Affairs
	# Carnegie Endowment for International Peace
	# Cato Institute
	# Center for a New American Security
	# Center for American Progress
	# Center for Global Development
	# Center for Strategic and International Studies
	# Centre for European Reform
	# Chatham House
	# Chicago Council on Global Affairs
	# Committee for Economic Development
	# Council on Foreign Relations
	# Council on Hemispheric Affairs
	# East-West Center
	# EastWest Institute
	# European Policy Centre
	# Foreign Policy Initiative
	# Freedom House
	# French Institute of International Relations 
	# Henry Jackson Society
	# Human Rights Watch
	# Institute for Security & Development Policy
	# Institute for Strategic and Development Studies
	# Institute for the Study of War
	# International Crisis Group
	# International Institute for Strategic Studies
	# International Peace Institute
	# Iran Human Rights Documentation Center
	# Korea Economic Institute of America
	# Legatum Institute
	# Lowy Institute for International Policy
	# Mercatus Center
	# Middle East Institute
	# National Bureau of Asian Research
	# National Democratic Institute
	# National Endowment for Democracy
	# New America Foundation
	# Open Society Institute
	# Oxfam
	# Peterson Institute for International Economics
	# Pew Research Center
	# RAND Corporation
	# Singapore Institute of International Affairs
	# Stockholm International Peace Research Institute
	# Sustainable Development Policy Institute
	# The Aspen Institute
	# The Century Foundation
	# The Heritage Foundation
	# The Hudson Institute
	# The Japan Institute of International Affairs
	# The Population Institute
	# The Stimson Center
	# The Urban Institute
	# United States Institute of Peace
	# Verite Research
	# Washington Institute for Near East Policy
	# Woodrow Wilson International Center for Scholars



	p authors

end



links = [
	"http://www.aei.org/publication/effect-state-policy-on-college-choice-match/",
	"https://www.americanprogress.org/issues/green/report/2015/08/26/120056/a-4-point-plan-for-responsibly-expanding-renewable-energy-production-on-americas-public-lands-and-oceans/"
]



for link in links
	getAuthor(link)
end
