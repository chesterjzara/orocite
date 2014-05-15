require 'spec_helper'

describe "Argument pages" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  describe "argument creation" do
    before { visit root_path }

    describe "with invalid information" do

      it "should not create an argument" do
        expect { click_button "Post" }.not_to change(Argument, :count)
      end

      describe "error messages" do
        before { click_button "Post" }
        it { should have_content('error') }
      end
    end

    describe "with valid information" do

      before { fill_in 'argument_topic', with: "Lorem ipsum" }
      it "should create an argument" do
        expect { click_button "Post" }.to change(Argument, :count).by(1)
      end
    end
  end
end