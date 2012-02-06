require 'spec_helper'

describe VendingMachine do
  subject { VendingMachine.new }

  it "should let you insert two dollars and then press a button" do
    subject.insert_dollar.should == true
    subject.insert_dollar.should == true
    subject.push_button(:lemonade).should == true
  end

  it "should not let you press a button before inserting two dollars" do
    subject.push_button(:lemonade).should == false
    subject.insert_dollar.should == true
    subject.push_button(:lemonade).should == false
    subject.insert_dollar.should == true
    subject.push_button(:lemonade).should == true
  end

  it "should add a Cola to the tray when purchased" do
    subject.insert_dollar
    subject.insert_dollar
    subject.push_button(:cola)
    subject.tray.should include(:cola)
  end

end
