class SampleService
  attr_accessor :result

  def get
    BW::HTTP.get("http://localhost:3000/") do |result|
      @result = BW::JSON.parse(result.body)
    end
  end
end
