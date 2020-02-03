class B2wRestClient < RestClient
    def new
    end

    def get
        super 'http://jsonplaceholder.typicode.com/todos/1'
    end
end