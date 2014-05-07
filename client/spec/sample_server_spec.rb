describe "sample service" do
  extend WebStub::SpecHelpers

  it "works" do
    @sample_service = SampleService.new
    @sample_service.get
    RunLoopHelpers::proper_wait 0.2
    @sample_service.result["first_name"].should.equal "Amir"
  end

  it "also works" do
    @sample_service = SampleService.new

    @sample_service.stub!(:get) do 
      @sample_service.result = { "first_name" => "Foobar" }
    end

    @sample_service.get
    @sample_service.result["first_name"].should.equal "Foobar"
  end

  it "also also works" do
    mock_server = MockServer.new
    mock_server.route_get_json("/", { first_name: "Amir" })
    mock_server.start 4000

    @sample_service = SampleService.new
    @sample_service.base_path = "http://localhost:4000"

    @sample_service.get
    RunLoopHelpers::proper_wait 0.2
    @sample_service.result["first_name"].should.equal "Amir"

    mock_server.stop
  end

  #https://github.com/HipByte/RubyMotion/blob/master/lib/motion/project/template/ios/spec-helpers/ui.rb
end
