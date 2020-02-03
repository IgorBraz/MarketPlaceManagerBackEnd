class MlRestClient < RestClient
    def new
    end

    def get
        super 'http://jsonplaceholder.typicode.com/todos/2'
    end
end