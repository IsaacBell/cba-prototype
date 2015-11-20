desc "This task is called by the Heroku scheduler add-on every 10 minutes to prevent the app from going to sleep."
task :call_page => :environment do
	uri = URI.parse('https://cba-prototype.herokuapp.com/')
	Net::HTTP.get(uri)
end

