class RailsEngineService
  
  def fetch_path(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
  
  def get_merchants
     fetch_path("api/v1/merchants")
  end
  
  def get_merchant(id)
    fetch_path("api/v1/merchants/#{id}")
  end
  
  private
  
    def conn
      Faraday.new(url: "http://localhost:3000/")
    end
end