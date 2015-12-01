require 'spec_helper'

module UmengMsg
  describe Configuration do
    describe 'default config' do
      let(:default) {Configuration.new}
      it 'ios_appkey' do
        expect(default.ios_appkey).to eq 'ios_appkey'
      end

      it 'ios_app_master_secret' do
        expect(default.ios_app_master_secret).to eq 'ios_secret'
      end

      it 'android_appkey' do
        expect(default.android_appkey).to eq 'android_appkey'
      end
      it 'android_app_master_secret' do
        expect(default.android_app_master_secret).to eq 'android_secret'
      end
      it 'production_mode' do
        expect(default.production_mode).to eq 'false'
      end
    end

    describe 'change mode' do
      it 'change to be true' do
        config = Configuration.new
        config.production_mode = 'true'
        expect(config.production_mode).to eq 'true'
      end
    end
  end
end
