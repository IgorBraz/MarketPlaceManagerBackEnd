class RestClientFactory    
    def self.create(marketplace)
        avaliableRestClients = { "b2w" => B2wRestClient.new, "mercado_livre" => MlRestClient.new, "vtex" => VtexRestClient.new }

        avaliableRestClients[marketplace]
    end
end