require 'spec_helper'

describe Argument do

  let(:user) { FactoryGirl.create(:user) }
  before { @argument = user.arguments.build(topic: "Lorem ipsum", user_id: user.id, locked: false) }


  subject { @argument }

  it { should respond_to(:topic) }
  it { should respond_to(:user_id) }
  it { should respond_to(:locked) }
  it { should respond_to(:user) }
  it { should respond_to(:ideas)}
  its(:user) {should eq user}

  it { should be_valid }

  describe "when user_id is not present" do
    before { @argument.user_id = nil }
    it { should_not be_valid }
  end

  describe "with blank topic" do
    before { @argument.topic = " " }
    it { should_not be_valid }
  end

end