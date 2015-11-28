module UmengMsg
  class Configuration
    attr_accessor :appkey, :app_master_secret

    def initialize
      @appkey = 'appkey'
      @app_master_secret = 'secret'
    end
  end
end
