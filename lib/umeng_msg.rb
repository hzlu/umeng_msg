# coding: utf-8
require "umeng_msg/version"
require "umeng_msg/configuration"
require 'umeng_msg/logger'
require 'umeng_msg/params'
require 'umeng_msg/sign'
require 'umeng_msg/service'
require 'umeng_msg/result'

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

  def self.appkey
    configuration.appkey
  end

  def self.app_master_secret
    configuration.app_master_secret
  end

end
