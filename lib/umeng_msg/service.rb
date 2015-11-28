# coding: utf-8
require 'rest-client'

module UmengMsg
  module Service
    extend UmengMsg::Logger

    PUSH_URL = "http://msg.umeng.com/api/send"
    UPLOAD_URL = "http://msg.umeng.com/upload"
    CHECK_URL = "http://msg.umeng.com/api/status"

    def self.push(platform, cast_type, options)
      params = Params.push_params(platform, cast_type, options)
      mysign = Sign.generate(platform, PUSH_URL, params)
      post_and_parse(PUSH_URL, mysign, params)
    end

    def self.upload(platform, content)
      params = Params.upload_params(platform, content)
      mysign = Sign.generate(platform, UPLOAD_URL, params)
      post_and_parse(UPLOAD_URL, mysign, params)
    end

    def self.check(platform, task_id)
      params = Params.check_params(platform, task_id)
      mysign = Sign.generate(platform, CHECK_URL, params)
      post_and_parse(CHECK_URL, mysign, params)
    end

    def self.post_and_parse(url, sign, params)
      begin
        umeng_logger.info("推送接口: #{url}")
        umeng_logger.info("推送参数: #{params.inspect}")
        response = RestClient.post("#{url}?sign=#{sign}", params)
        umeng_logger.info("推送返回: #{response.inspect}")
        Result.parse(response)
      rescue => e
        umeng_logger.error("推送错误信息: #{e.inspect}")
        false
      end
    end
  end
end