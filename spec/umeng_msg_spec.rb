require 'spec_helper'

describe UmengMsg do
  it 'has a version number' do
    expect(UmengMsg::VERSION).not_to be nil
  end

  describe '#configure' do
    let(:default_config) { UmengMsg.reset }
    let(:config) { UmengMsg.configuration }
    it 'has a default config' do
      expect(default_config.ios_appkey).to eq 'ios_appkey'
    end

    it 'default production_mode is false' do
      expect(default_config.production_mode).to eq 'false'
    end

    describe 'change configuration' do
      before :each do
        UmengMsg.configure do |config|
          config.ios_appkey = 'new_ios_appkey'
          config.android_appkey = 'new_android_appkey'
          config.ios_app_master_secret = 'new_ios_secret'
          config.android_app_master_secret = 'new_android_secret'
          config.production_mode = 'true'
        end
      end

      it 'configure ok' do
        expect(config.ios_appkey).to eq 'new_ios_appkey'
      end
    end
  end
end
