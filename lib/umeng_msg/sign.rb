# coding: utf-8
require 'digest/md5'

module UmengMsg
  module Sign
    def self.generate(platform, url, payload)
      Digest::MD5.hexdigest('POST' + url + payload.to_json + UmengMsg.app_master_secret(platform))
    end
  end
end
