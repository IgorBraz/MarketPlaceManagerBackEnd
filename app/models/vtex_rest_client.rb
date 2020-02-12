class VtexRestClient < RestClient
    def get
        super 'https://wevo.vtexcommercestable.com.br/api/catalog_system/pvt/products/ProductGet/16', { 'X-VTEX-API-AppKey': 'vtexappkey-wevo-NBKRIP', 'X-VTEX-API-AppToken': 'HYYHOTNMNHSGSNDUQJRDBGBRCXZGNDBCDJMFBENTRMXLZTTMNASPVYEAXGFRTGZKGQDIBXTMWYLOJPRJENTMKLGEFLHUYWZLMNFIPKLPHGSWNPRIPWNGMMZUKYDPQYNA' }
    end
end