# coding: utf-8
module UmengMsg
  module Params

    def self.push_params(platform, cast_type, title: "", content: "", file_id: "", msg_type: "film", open_id: "1", targets: "", expire_time: "")
      params = {
        appkey:          UmengMsg.appkey,
        timestamp:       Time.now.to_i.to_s,
        type:            cast_type,
        alias_type:      "user_id",
        file_id:         file_id,
        production_mode: UmengMsgSetting["production_mode"],
        description:     title,
        policy:          { expire_time: expire_time }
      }

      # 平台参数
      if platform == 'ios'
        params = {
          payload: {
            aps:      { alert: content },
            msg_type: msg_type,
            id:       open_id,
            title:    title
          }
        }.merge(params)
      else
        params = {
          payload: {
            display_type: "notification",
            body: {
              ticker:     title,
              title:      title,
              text:       content,
              after_open: "go_app",
            },
            extra: {
              msg_type:   msg_type,
              id:         open_id
            }
          }
        }.merge(params)
      end

      # 组播过滤
      if cast_type == "groupcast"
        tag_list = targets.split(",")
        tag_list.map! { |tag| {tag: tag} }
        params = {
          filter: {
            where: {
              "and" => [{ "or" => tag_list }]
            }
          }
        }.merge(params)
      end

      params.to_json
    end

    def self.upload_params(platform, content)
      params = {
        appkey:    UmengMsg.appkey,
        timestamp: Time.now.to_i.to_s,
        content:   content
      }.to_json
    end

    def self.check_params(platform, task_id)
      params = {
        appkey:    UmengMsg.appkey,
        timestamp: Time.now.to_i.to_s,
        task_id:   task_id
      }.to_json
    end

  end
end
