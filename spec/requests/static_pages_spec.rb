require 'spec_helper'

describe "StaticPages" do
  describe "GET /" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get '/'
      response.status.should be(200)
    end
  end

  describe "homepage" do
    it "should have one wrap div" do
      visit '/'
      page.should have_content('Aloha')
      page.should have_selector('div#wrap')
    end
  end
end
