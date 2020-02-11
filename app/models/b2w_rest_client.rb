class B2wRestClient < RestClient
    def new
    end

    def get
        super 'http://jsonplaceholder.typicode.com/todos/1'
    end

    def post
        body = 
        {
            "product": {
                "sku": "CODIGO_SKU",
                "name": "DESCRICAO PRODUTO",
                "description": "CRIAR PRODUTO COM UMA VARIAÇÃO",
                "status": "enabled",
                "price": 30.00,
                "promotional_price": 29.90,
                "cost": 0.0,
                "weight": 0.100,
                "height": 20,
                "width": 30,
                "length": 20,
                "brand": "Marca",
                "nbm": "98769898",
                "categories": [
                {
                    "code": "01",
                    "name": "SKYHUB HOMOLOGAÇÃO"
                }
                ],
                "images": [
                "http://d26lpennugtm8s.cloudfront.net/stores/154/284/products/camiseta-lisa-verde-bandeira-algodo-p-ao-gg-pronta-entrega-355901-mlb20431777049_092015-o-07fadec89e5ed54705c1b9ab5411dec8-1024-1024.jpg"
                ],
                "specifications": [
                {
                    "key": "Especicações do Produto PAI",
                    "value": "Especificações do Produto PAI"
                }
                ],
                "variations": [
                {
                    "sku": "COD_SKU_VARIACAO",
                    "qty": 10,
                    "ean": "9876543210987",
                    "images": [
                    "http://d26lpennugtm8s.cloudfront.net/stores/154/284/products/camiseta-lisa-verde-bandeira-algodo-p-ao-gg-pronta-entrega-355901-mlb20431777049_092015-o-07fadec89e5ed54705c1b9ab5411dec8-1024-1024.jpg"
                    ],
                    "specifications": [
                    {
                        "key": "Cor",
                        "value": "Verde"
                    },
                    {
                        "key": "Tamanho",
                        "value": "M"
                    }
                    ]
                }
                ],
                "variation_attributes": [
                "Cor",
                "Tamanho"
                ]
            }
        }        

        headers = { 
            'X-User-Email' => 'labs@wevo.com.br',
            'X-Api-Key' => 'tuavYyGdhJywQDQiMsYZ',
            'X-Accountmanager-Key' => 'GkoiHnDjOp',            
            'Content-Type' => 'application/json'
        }

        super 'https://api.skyhub.com.br/products', headers, body
    end
end