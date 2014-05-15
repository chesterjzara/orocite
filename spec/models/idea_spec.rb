require 'spec_helper'

describe Idea do

  let(:user) { FactoryGirl.create(:user) }
  let(:argument) { FactoryGirl.create(:argument) }
  before do
    @idea = user.ideas.build(content: "Lorem ipsum", proof: "example.com", argument_id: argument.id) 
#    @idea2 = argument.ideas.build(content: "Lorem ipsum", proof: "example.com") 
  end
# debugger

  subject { @idea }

  it { should respond_to(:content) }
  it { should respond_to(:proof) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  it { should respond_to(:argument) }
  its(:user) {should eq user}

  subject { @idea }

  its(:argument) {should eq argument}

  

  subject { @idea }
  it { should be_valid }

  describe "when user_id is not present" do
    before { @idea.user_id = nil }
    it { should_not be_valid }
  end

  describe "with blank content" do
    before { @idea.content = " " }
    it { should_not be_valid }
  end

  describe "with content that is too long" do
    before { @idea.content = "a" * 201 }
    it { should_not be_valid }
  end

end