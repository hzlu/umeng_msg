# coding: utf-8
module UmengMsg
  module Params
    extend self

    def push_params(platform, options)
      Rails.logger.error "传递参数为#{options}\n"
      params = {
        'appkey'          => UmengMsg.appkey(platform),
        'timestamp'       => Time.now.to_i.to_s,
        'type'            => options['type'],
        'device_tokens'   => options['device_tokens'],
        'alias_type'      => options['alias_type'],
        'alias'           => options['alias'],
        'file_id'         => options['file_id'],
        'policy'          => {
                               'start_time'   => options['start_time'],
                               'expire_time'  => options['expire_time'],
                               'max_send_num' => options['max_send_num'],
                             },
        'production_mode' => UmengMsg.production_mode,
        'description'     => options['description'],
        'thirdparty_id'   => options['thirdparty_id']
      }

      # 平台参数
      ios_payload = {
        'payload' => {
          'aps' => {
            'alert'             => options['alert'],
            'badge'             => options['badge'],
            'sound'             => options['sound'],
            'content-available' => options['content-available'],
            'category'          => options['category']
          },
          'title' => options['title'],
          'extra' => options['extra'] || {}
        }
      }
      android_payload = {
        'payload' => {
          'display_type' => options['display_type'],
          'body' => {
            'ticker'       => options['ticker'],
            'title'        => options['title'],
            'text'         => options['text'],
            'icon'         => options['icon'],
            'largeIcon'    => options['largeIcon'],
            'img'          => options['img'],
            'sound'        => options['sound'],
            'builder_id'   => (options['builder_id'] || 0),
            'play_vibrate' => (options['play_vibrate'] || 'true'),
            'play_lights'  => (options['play_lights'] || 'true'),
            'play_sound'   => (options['play_sound'] || 'true'),
            'after_open'   => (options['after_open'] || 'go_app'),
            'url'          => options['url'],
            'activity'     => options['activity'],
            'custom'       => options['custom']
          },
          'extra' => options['extra'] || {}
        }

      }

      # TODO 组播过滤
      # if type == "groupcast"
      #   tag_list = targets.split(",")
      #   tag_list.map! { |tag| {tag: tag} }
      #   params = {
      #     filter: {
      #       where: {
      #         "and" => [{ "or" => tag_list }]
      #       }
      #     }
      #   }.merge(params)
      # end

      platform.downcase == 'ios' ? params.merge(ios_payload) : params.merge(android_payload)
    end

    def check_params(platform, task_id)
      {
        'appkey'    => UmengMsg.appkey(platform),
        'timestamp' => Time.now.to_i.to_s,
        'task_id'   => task_id
      }
    end
    def cancel_params(platform, task_id)
      {
        'appkey'    => UmengMsg.appkey(platform),
        'timestamp' => Time.now.to_i.to_s,
        'task_id'   => task_id
      }
    end

    def upload_params(platform, content)
      {
        'appkey'    => UmengMsg.appkey(platform),
        'timestamp' => Time.now.to_i.to_s,
        'content'   => content
      }
    end
  end
end
