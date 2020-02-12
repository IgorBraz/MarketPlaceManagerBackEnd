class RestClient
    def get(uri, headers)
        url = URI.parse(uri)

        request = Net::HTTP::Get.new(url.to_s)

        if (headers)
            headers.each do |key, value|
                request[key] = value
            end
        end

        http = Net::HTTP.new(url.host, url.port)

        http.use_ssl = url.scheme == "https"

        response = http.request(request)

        response.body
    end

    def post(uri, headers, body)
        url = URI.parse(uri)

        Net::HTTP.start(url.host, url.port, :use_ssl => url.scheme == 'https') do |http|
            req = Net::HTTP::Post.new(url)
            
            if (headers)
                headers.each do |key, value|
                    req[key] = value
                end
            end
            
            req.body = body.to_json
          
            http.use_ssl = url.scheme == "https"
            
            response = http.request req
            
            response.body
          end
    end
end