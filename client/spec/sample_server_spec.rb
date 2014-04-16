describe "sample service" do
  it "works" do
    @sample_servce = SampleService.new
    @sample_servce.get
    wait
    @sample_servce.result.should.not.equal nil
  end


  def wait sec = 0.1
    CFRunLoopRunInMode(KCFRunLoopDefaultMode, sec, false)
  end
end
