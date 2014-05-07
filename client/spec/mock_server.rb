class MockServer
  def initialize
    @http = RoutingHTTPServer.alloc.init
  end

  def route_get path, lamb
    @http.handleMethod("GET", withPath: path, block: lamb)
  end

  def route_get_json path, hash
    @http.handleMethod("GET", withPath: path, block: lambda { |req, res| 
      res.setHeader("Content-Type", value: "application/json")
      res.respondWithString(BW::JSON.generate(hash))
    })
  end
  
  def start port
    @http.setDefaultHeader("Server", value: "mock server")
    @http.setPort(port)
    @http.start(nil)
  end

  def stop
    @http.stop
  end
end
