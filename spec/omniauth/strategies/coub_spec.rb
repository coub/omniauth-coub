require 'spec_helper'

describe OmniAuth::Strategies::Coub do
  let(:app) {
    -> { [200, {}, ["Hello."]] }
  }

  subject do
    OmniAuth::Strategies::Coub.new(app, 'app_id', 'app_secret', @options || {})
  end

  before do
    OmniAuth.config.test_mode = true
  end

  after do
    OmniAuth.config.test_mode = false
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

  context "scopes" do
    it 'joins scopes' do
      @options = { 'scope' => 'logged_in,channel_edit' }
      subject.authorize_params['scope'].should eq('logged_in channel_edit')
    end
  end
end
