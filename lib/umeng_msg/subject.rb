# coding: utf-8
require 'rest-client'

module UmengMsg
  class Subject
    attr_reader :payload, :ret, :data
    CAST_TYPE  = %w|unicast listcast filecast broadcast groupcast customizedcast|
    PUSH_URL   = 'http://msg.umeng.com/api/send'
    CHECK_URL  = 'http://msg.umeng.com/api/status'
    CANCEL_URL = 'http://msg.umeng.com/api/cancel'
    UPLOAD_URL = 'http://msg.umeng.com/upload'

    def initialize(platform, **options)
      @platform = platform
      @payload = Params.push_params(platform, **options)
      @content = options['content']
      @ret = 'PENDING'
      @error_code, @file_id, @task_id = nil
    end

    def push
      sign = Sign.generate @platform, PUSH_URL, @payload
      begin
        parse_res RestClient.post("#{PUSH_URL}?sign=#{sign}", @payload.to_json, content_type: :json, accept: :json)
      rescue => e
        parse_res e.response
      end
    end

    def check
      @check_payload = Params.check_params(@platform, @task_id)
      sign = Sign.generate @platform, CHECK_URL, @check_payload
      begin
        parse_res RestClient.post("#{CHECK_URL}?sign=#{sign}", @check_payload.to_json, content_type: :json, accept: :json)
      rescue => e
        parse_res e.response
      end
    end

    def cancel
      @cancel_payload = Params.cancel_params(@platform, @task_id)
      sign = Sign.generate @platform, CANCEL_URL, @cancel_payload
      begin
        parse_res RestClient.post("#{CANCEL_URL}?sign=#{sign}", @cancel_payload.to_json, content_type: :json, accept: :json)
      rescue => e
        parse_res e.response
      end
    end

    def upload
      @upload_payload = Params.upload_params(@platform, @content)
      sign = Sign.generate @platform, CANCEL_URL, @upload_payload
      begin
        parse_res RestClient.post("#{UPLOAD_URL}?sign=#{sign}", @upload_payload.to_json, content_type: :json, accept: :json)
      rescue => e
        parse_res e.response
      end
    end

    private

    def parse_res response
      res_hsh = JSON.parse(response)
      @data = res_hsh['data']
      @ret  = res_hsh['ret']
    end
  end
end

