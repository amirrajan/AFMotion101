describe "sample service" do
  it "works" do
    @sample_servce = SampleService.new
    @sample_servce.get
    RunLoopHelpers::proper_wait 0.1
    @sample_servce.result.should.not.equal nil
  end
end
