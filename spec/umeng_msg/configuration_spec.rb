require 'spec_helper'

module UmengMsg
  describe Configuration do
    describe '#appkey' do
      it 'default value is appkey' do
        default = Configuration.new.appkey
        expect(default).to eq 'appkey'
      end
      it 'can set value' do
        config = Configuration.new
        config.appkey = 'new appkey'
        expect(config.appkey).to eq 'new appkey'
      end
    end

    describe '#app_master_secret' do
      it 'default value is secret' do
        default = Configuration.new.app_master_secret
        expect(default).to eq 'secret'
      end
      it 'can set value' do
        config = Configuration.new
        config.app_master_secret = 'new secret'
        expect(config.app_master_secret).to eq 'new secret'
      end

    end
  end
end
