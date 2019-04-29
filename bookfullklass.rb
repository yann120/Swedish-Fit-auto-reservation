require 'mechanize'

if (ARGV[0] && ARGV[1] && ARGV[2])
	mechanize = Mechanize.new
	username = ARGV[0]
	password = ARGV[1]
	page_url = ARGV[2]
	booked = false
	#login with mechanize
	mechanize.get('https://www.swedishfit.fr/') do |page|
		#click the login link
		login_page = mechanize.click(page.link_with(:text => /m'identifier/))
		# Submit the login form
		my_page = login_page.form_with(:action => 'https://www.swedishfit.fr/lo/') do |f|
			f.em = username
			f.pw = password
		end.click_button
	end
	#go on the sport page and click "reserver"
	mechanize.get(page_url) do |page|
		while (booked == false)
			if page.link_with(:text => /COMPLET/)
				puts "The Klass is full, next try in 5 minutes"
				sleep(300)
			else
				if mechanize.click(page.link_with(:text => /RÉSERVER/))
					puts "Klass booked!"
				else
					puts "Too late! :("
				end
				booked = true
			end
		end
	end
else
	puts "usage : ruby bookfullclass.rb 'login' 'password' 'sport session url'"
end
