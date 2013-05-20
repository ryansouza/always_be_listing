require "minitest_helper"

describe List do
  before do
    @list = List.new
  end

  it "must be valid" do
    @list.valid?.must_equal true
  end
end
