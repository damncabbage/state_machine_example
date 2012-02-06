require 'spec_helper'

describe VendingMachine do
  subject { VendingMachine.new }

  it "should let you to insert a dollar and then press a button" do
    subject.insert_dollar.should == true
    subject.push_button.should == true
  end

  it "should not let you press a button before inserting a dollar" do
    subject.push_button.should == false
    subject.insert_dollar.should == true
  end
end
