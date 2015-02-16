require 'spec_helper'

describe OmniAuth::Strategies::Coub do

  subject do
    OmniAuth::Strategies::Coub.new({})
  end

  context "general" do
    it "should be called coub" do
      subject.options.name.should eq('coub')
    end
  end

  context "endpoints" do
    it "has correct site" do
      subject.options.client_options.site.should eq("http://coub.com/api/v2")
    end

    it "has correct authorize_url" do
      subject.options.client_options.authorize_url.should eq("http://coub.com/oauth/authorize")
    end

    it "has correct token_url" do
      subject.options.client_options.token_url.should eq("http://coub.com/oauth/token.json")
    end
  end

end
