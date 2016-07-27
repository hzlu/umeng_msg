# coding: utf-8
require 'rest-client'

module UmengMsg
  class Subject
    attr_reader :payload, :ret, :task_id, :error_code, :file_id, :platform, :content
    CAST_TYPE  = %w|unicast listcast filecast broadcast groupcast customizedcast|
    PUSH_URL   = 'http://msg.umeng.com/api/send'
    CHECK_URL  = 'http://msg.umeng.com/api/status'
    CANCEL_URL = 'http://msg.umeng.com/api/cancel'
    UPLOAD_URL = 'http://msg.umeng.com/upload'

    def initialize(platform, **options)
      Rails.logger.error "传递参数为#{options}\n"
      @platform          = platform
      @payload           = Params.push_params(platform, **options)
      @content           = options['content']
      @file_id, @task_id = nil
      @ret               = { push: nil, check: nil, cancel: nil, upload: nil }
      @error_code        = { push: nil, check: nil, cancel: nil, upload: nil }
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
      res_hsh            = JSON.parse(response)
      @ret[:push]        = res_hsh['ret']
      @error_code[:push] = res_hsh['data']['error_code']
      @task_id           = res_hsh['data']['task_id']
    end

    def check_parse
      res_hsh             = JSON.parse(response)
      @ret[:check]        = res_hsh['ret']
      @error_code[:check] = res_hsh['data']['error_code']
      @check_data         = res_hsh['data']
    end

    def cancel_parse
      res_hsh              = JSON.parse(response)
      @ret[:cancel]        = res_hsh['ret']
      @error_code[:cancel] = res_hsh['data']['error_code']
    end

    def upload_parse response
      res_hsh              = JSON.parse(response)
      @ret[:upload]        = res_hsh['ret']
      @error_code[:upload] = res_hsh['data']['error_code']
      @file_id             = res_hsh['data']['file_id']
    end
  end
end
