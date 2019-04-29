# Swedish-Fit-auto-reservation
## This script will auto subscribe to a class from the Swedish Fit website

If you are tired to wait until midnight to book a Klass at Swedish Fit, this script is for you!

## Requirements
Ruby installed on your desktop : [Please follow this link to install Ruby](https://www.phusionpassenger.com/library/walkthroughs/deploy/ruby/ownserver/nginx/oss/install_language_runtime.html)
## How does it works ?
1. Go on [Swedish fit website](https://www.swedishfit.fr/), log in and choose a Klass that will start tomorrow.
2. Copy the URL of the Klass, the link should be like this https://www.swedishfit.fr/cours/detail/?id=489248 or https://www.swedishfit.fr/cours/detail/?id=480112&u=xxxx
3. Install the program with your terminal :
> git clone https://github.com/yann120/Swedish-Fit-auto-reservation.git \
> cd Swedish-Fit-auto-reservation \
> gem install mechanize
4. For booking a Klass that start tomorrow, launch the program bookfortomorrow.rb in your terminal
> ruby bookfortomorrow.rb [Swedish Fit Login] [Swedish Fit Password] [Url of the Klass]  \
for Example \
> ruby bookfortomorrow.rb yann@42.fr 42424242 https://www.swedishfit.fr/cours/detail/?id=489248 
5. the script will book the Klass at Midnight.

4. For booking a Klass that is full, launch the program bookfullklass.rb in your terminal 
> ruby bookfullklass.rb [Swedish Fit Login] [Swedish Fit Password] [Url of the Klass]  \
for Example \
> ruby bookfortomorrow.rb yann@42.fr 42424242 https://www.swedishfit.fr/cours/detail/?id=489248 
if the Klass is full, it will retry every 5 minutes
## Please contact me if something doesn't work!
