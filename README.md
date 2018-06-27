# UmengMsg

对[友盟](https://www.umeng.com/)消息推送的接口封装，支持接口：

- 消息发送
- 任务类消息状态查询
- 任务类消息取消
- 文件上传

## 安装

Gemfile添加

    gem 'umeng_msg'

然后执行

    $ bundle

## 使用

### 生成配置文件

  rails generate umeng_msg:install

### 推送、上传、查询、取消

  UmengMsg::Subject.new('ios', options).push
  UmengMsg::Subject.new('ios', options).upload
  UmengMsg::Subject.new('ios', options).check
  UmengMsg::Subject.new('ios', options).cancel

### `options` 参数

- check 与 cancel 只需要 `task_id` 参数, upload 只需要 `content` 参数
- 示例： `{'task_id': 'xxxxx'}`
- 详细 `options` 参数请查看[官方文档](https://developer.umeng.com/docs/66632/detail/68343)

### 返回结果

- 返回结果以 `error_code` 为 `nil` 表示发送成功, `error_code` 为 `999` 时为网络等错误与友盟无关
- 拓展或自定义功能请自行拓展
- 默认请求超时是3秒

## Contributing

1. Fork it ( https://github.com/hzlu/umeng_msg/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
