# UmengMsg

此gem是对友盟推送的api封装，支持推送 查询 删除 以及上传文件
推送部分功能待实施 再todo中

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'umeng_msg'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install umeng_msg

## Usage
1. rails generate umeng_msg:install
2. UmengMsg::Subject.new('ios', options).push  #or upload check cancel
3. options 示例： {'task_id': 'xxxxx'}
4. 推送相关options参数请参看官方文档， check 与 cancel 只需要 task_id参数, upload 只需要content 参数
5. 返回结果以error_code 为nil 表示发送成功, error_code 为999 时为网络等错误与友盟无关
6. 拓展或自定义功能请自行拓展
7. 默认请求超时是3秒

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/umeng_msg/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
