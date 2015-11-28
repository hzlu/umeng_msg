# coding: utf-8
require 'digest/md5'

module UmengMsg
  module Sign
    def self.generate(url, post_body)
      Digest::MD5.hexdigest('POST' + url + post_body + UmengMsg.app_master_secret)
    end
  end
end
