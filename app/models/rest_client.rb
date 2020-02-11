class RestClient
    def get(uri)
        url = URI.parse(uri)

        request = Net::HTTP::Get.new(url.to_s)

        response = Net::HTTP.start(url.host, url.port) {|http| http.request(request)}

        response.body
    end

    def post(uri, headers, body)
        url = URI.parse(uri)

        Net::HTTP.start(url.host, url.port, :use_ssl => url.scheme == 'https') do |http|
            req = Net::HTTP::Post.new(url)
            
            headers.each do |key, value|
                req[key] = value
            end
            
            req.body = body.to_json
          
            response = http.request req
            
            response.body
          end
    end
end