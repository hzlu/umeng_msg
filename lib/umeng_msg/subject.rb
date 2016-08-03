# coding: utf-8
require 'httpi'

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
    end

    def push
      post_youmeng(PUSH_URL, Params.push_params(@platform, @options))
    end

    def check
      post_youmeng(CHECK_URL, Params.check_params(@platform, @options['task_id']))
    end

    def cancel
      post_youmeng(CANCEL_URL, Params.cancel_params(@platform, @options['task_id']))
    end

    def upload
      post_youmeng(UPLOAD_URL, Params.upload_params(@platform, @options['content']))
    end

    private
    def post_youmeng(url, payload)
      sign = Sign.generate @platform, url, payload
      begin
        request = HTTPI::Request.new
        request.url = "#{url}?sign=#{sign}"
        request.open_timeout = 3
        request.read_timeout = 3
        request.body = payload.to_json
        response = HTTPI.post(request)
        parse_res(ActiveSupport::JSON.decode(response.body))
      rescue => e
        error_result e.message
      end
    end

    def parse_res result
      {result: result['ret'], error_code: result['data']['error_code'], data: result['data']}
    end

    def error_result(error_message)
      {result: error_message, error_code: '999', data: {}}
    end

  end
end
