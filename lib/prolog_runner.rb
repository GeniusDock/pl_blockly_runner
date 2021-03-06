require 'mumukit'

I18n.load_translations_path File.join(__dir__, 'locales', '*.yml')

Mumukit.runner_name = 'prologBlockly'
Mumukit.configure do |config|
  config.docker_image = 'mumuki/mumuki-plunit-worker:2.0'
  config.content_type = 'markdown'
end


require_relative 'prolog'
require_relative 'assets_server'
require_relative 'version'
require_relative 'test_hook'
require_relative 'query_hook'
require_relative 'expectations_hook'
require_relative 'metadata_hook'
require_relative 'feedback_hook'
