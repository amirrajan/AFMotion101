class SampleService
  attr_accessor :result

  def get
    AFMotion::JSON.get("http://localhost:3000/") do |result|
      @result = result.object
    end
  end
end
