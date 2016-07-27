# coding: utf-8
require "umeng_msg/version"
require "umeng_msg/configuration"
require 'umeng_msg/params'
require 'umeng_msg/sign'
require "umeng_msg/subject"

module UmengMsg

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.reset
    @Configuration = Configuration.new
  end

  def self.configure
    yield configuration
  end

  def self.appkey platform
    platform.downcase == 'ios' ? configuration.ios_appkey : configuration.android_appkey
  end

  def self.app_master_secret platform
    platform.downcase == 'ios' ? configuration.ios_app_master_secret : configuration.android_app_master_secret
  end

  def self.production_mode
    configuration.production_mode
  end

end
