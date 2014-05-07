class SampleService
  attr_accessor :result, :base_path

  def initialize
    @base_path = "http://localhost:3000"
  end

  def get
    AFMotion::JSON.get(@base_path + "/") do |result|
      @result = result.object
    end
  end
end
