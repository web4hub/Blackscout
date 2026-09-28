require 'uri'
require 'net/http'

url = URI("https://app.swaggerhub.com/proxy/https://app.swaggerhub.com/api/v2/verifier/solidity/methods:lookup")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true

request = Net::HTTP::Post.new(url)
request["Content-Type"] = 'application/json'
request["Accept"] = 'application/json'
request.body = "{\n  \"bytecode\": \"string\",\n  \"abi\": \"string\",\n  \"sourceMap\": \"string\",\n  \"fileIds\": {\n    \"property1\": \"string\",\n    \"property2\": \"string\"\n  }\n}"

response = http.request(request)
puts response.read_body
