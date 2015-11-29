# coding: utf-8
module UmengMsg
  class Configuration
    attr_accessor :ios_appkey, :ios_app_master_secret, :android_appkey, :android_app_master_secret, :production_mode

    def initialize
      @ios_appkey = 'ios_appkey'
      @ios_app_master_secret = 'ios_secret'
      @android_appkey = 'android_appkey'
      @android_app_master_secret = 'android_secret'
      @production_mode = 'false'
    end
  end
end
