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

    def initialize(platform, options)
      @platform          = platform
      @options           = options
      @content           = options['content']
      @file_id, @task_id = nil, nil
    end

    def push
      @payload = Params.push_params(@platform, @options)
      sign = Sign.generate @platform, PUSH_URL, @payload
      post_youmeng(PUSH_URL, sign, @payload)
    end

    def check
      @check_payload = Params.check_params(@platform, @task_id)
      sign = Sign.generate @platform, CHECK_URL, @check_payload
      post_youmeng(CHECK_URL, sign, @check_payload)
    end

    def cancel
      @cancel_payload = Params.cancel_params(@platform, @task_id)
      sign = Sign.generate @platform, CANCEL_URL, @cancel_payload
      post_youmeng(CANCEL_URL, sign, @cancel_payload)
    end

    def upload
      @upload_payload = Params.upload_params(@platform, @content)
      sign = Sign.generate @platform, CANCEL_URL, @upload_payload
      post_youmeng(UPLOAD_URL, sign, @upload_payload)
    end

    private
    def post_youmeng(url, sign, body)
      begin
        parse_res RestClient.post("#{url}?sign=#{sign}", body.to_json, content_type: :json, accept: :json)
      rescue => e
        error_result e.message
      end
    end

    def parse_res response
      result            = JSON.parse(response)
      {result: result['ret'], error_code: result['data']['error_code'], data: result['data']}
    end

    def error_result(error_message)
      {result: error_message, error_code: '999', data: {}}
    end

  end
end
