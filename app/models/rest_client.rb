class RestClient
    def get(uri)
        url = URI.parse(uri)

        request = Net::HTTP::Get.new(url.to_s)

        response = Net::HTTP.start(url.host, url.port) {|http| http.request(request)}

        response.body
    end

    def post(uri)
    end
end