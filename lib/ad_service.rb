require 'open-uri'
require 'net/http'
require 'json'

class AdService

	def call
		url = URI("https://mockbin.org/bin/fcb30500-7b98-476f-810d-463a0b8fc3df")
		http = Net::HTTP.new(url.host, url.port)
		http.use_ssl = true
		request = Net::HTTP::Get.new(url.path)
		response = http.request(request)
		JSON.parse(response.body)
	end
end