module UmengMsg
  module Generators
    class InstallGenerator < Rails::Generators::Base
      desc "This generator creates a umeng_msg configuratio file at config/initializers"
      source_root File.expand_path("../templates", __FILE__)
      def copy_initializer
        template '../templates/umeng_msg.rb', 'config/initializers/umeng_msg.rb'
      end
    end
  end
end
