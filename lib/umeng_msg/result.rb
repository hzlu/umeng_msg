# coding: utf-8
module UmengMsg
  module Result
    def self.parse(response)
      response = JSON.parse(response)
      result = {}
      raise "#{response.inspect}" unless response["ret"] == "SUCCESS"
      result["ret"]          = "SUCCESS"
      result["task_id"]      = response["data"]["task_id"]
      result["file_id"]      = response["data"]["file_id"]
      result["status"]       = response["data"]["status"]
      result["total_count"]  = response["data"]["total_count"]
      result["accept_count"] = response["data"]["accept_count"]
      result["sent_count"]   = response["data"]["sent_count"]
      result["open_count"]   = response["data"]["open_count"]
      result
    end
  end
end