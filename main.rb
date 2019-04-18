require 'mechanize'

if (ARGV[0] && ARGV[1] && ARGV[2])
	#wait until midnight
	puts "Le script est démarré, il va s'executer automatiquement à minuit une"
	sleep(Time.parse("23:59:59") + 60 - Time.now)
	
	mechanize = Mechanize.new
	#login with mechanize
	mechanize.get('https://www.swedishfit.fr/') do |page|
		#click the login link
		login_page = mechanize.click(page.link_with(:text => /m'identifier/))
		# Submit the login form
		my_page = login_page.form_with(:action => 'https://www.swedishfit.fr/lo/') do |f|
			f.em = ARGV[0]
			f.pw = ARGV[1]
		end.click_button
	end
	#go on the sport page and click "reserver"
	mechanize.get(ARGV[2]) do |page|
		puts "c'est réservé!" if mechanize.click(page.link_with(:text => /RÉSERVER/))
	end
else
	puts "usage : ruby main.rb 'login' 'password' 'sport session url'"
end