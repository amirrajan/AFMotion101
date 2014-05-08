class SampleService
  attr_accessor :base_path

  def initialize
    @base_path = "http://localhost:3000"
  end

  def get(id = 0, &callback)
    AFMotion::JSON.get(@base_path + "/") do |result|
      if result.success?
        callback.call result.object
      else
        callback.call result.error
      end
    end
  end
end
