require File.dirname(__FILE__) + '/../../spec_helper.rb'

describe "unordered() helper" do
  it { [1].should == unordered(1) }
  it { [1,2].should == unordered(1,2) }
  it { [2,1].should == unordered(1,2) }
  it { [1].should_not == unordered(1,2) }
  it { [1,2].should_not == unordered(1) }
  it { [1,2].should_not == unordered(1,2,1) }
end
