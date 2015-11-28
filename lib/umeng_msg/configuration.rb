# coding: utf-8
module UmengMsg
  class Configuration
    attr_accessor :ios_appkey, :ios_app_master_secret, :android_appkey, :android_app_master_secret, :production_mode

    def initialize
      @ios_appkey = '55f79577e0f55a65fa004f77'
      @ios_app_master_secret = 'ayxfpnvugg6bgynbfzwqctlhf4gun9mv'
      @android_appkey = 'android_appkey'
      @android_app_master_secret = 'android_secret'
      @production_mode = 'false'
    end
  end
end
