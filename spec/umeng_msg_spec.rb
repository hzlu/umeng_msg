require 'spec_helper'

describe UmengMsg do
  it 'has a version number' do
    expect(UmengMsg::VERSION).not_to be nil
  end

  describe '#configure' do
    before do
      UmengMsg.configure do |config|
        config.appkey = 'appkey'
        config.app_master_secret = 'secret'
      end
    end

    it 'configure ok' do

    end

  end
end
