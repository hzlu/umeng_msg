module UmengMsg
  class Subject
    attr_reader :push_params
    CAST_TYPE = %w|unicast listcast filecast broadcast groupcast customizedcast|
    PUSH_URL = "http://msg.umeng.com/api/send"
    UPLOAD_URL = "http://msg.umeng.com/upload"
    CHECK_URL = "http://msg.umeng.com/api/status"

    def initialize options
      @payload = {
      }
      @ret = 'PENDING'
      @error_code = nil
    end

    def push
      parse_res RestClient.post("#{PUSH_URL}?sign=#{do_sign}")
    end

    def check
      parse_res RestClient.post("#{PUSH_URL}?sign=#{do_sign}")
    end

    def cancel
      parse_res RestClient.post("#{PUSH_URL}?sign=#{do_sign}")
    end

    def upload
      parse_res RestClient.post("#{PUSH_URL}?sign=#{do_sign}")
    end

    private
    def parse_res response
      res_hsh = JSON.parse(response)
      @data = res_hsh['data']
      @ret  = res_hsh['ret']
    end

    def do_sign
      Sign.generate(url, @payload)
    end
  end
end
