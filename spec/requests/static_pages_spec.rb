require 'spec_helper'

describe "StaticPages" do
  describe "GET /" do
    it "works" do
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
