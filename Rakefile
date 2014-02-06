# -*- coding: utf-8 -*-
$LOAD_PATH.unshift('/Library/RubyMotion/lib')
require 'motion/project/template/osx'

begin
  require 'bundler'
  Bundler.require
end

class MotionHeader
  attr_reader :prefix
  alias_method :include_path, :prefix
end

Motion::Project::App.setup do |app|
  app.name = 'asv'
  app.info_plist['LSUIElement'] = true
  app.vendor_project('vendor/pa_wrappers', :xcode)
  app.libs << '/usr/local/Cellar/pulseaudio/4.0/lib/libpulse.dylib'
  app.include 'pa_client_info_wrapper.h',
    prefix: '/Users/ryanjafari/Documents/repos/asv/vendor/pa_wrappers'
  app.include 'pa_sink_info_wrapper.h',
    prefix: '/Users/ryanjafari/Documents/repos/asv/vendor/pa_wrappers'
  app.include 'pa_source_info_wrapper.h',
    prefix: '/Users/ryanjafari/Documents/repos/asv/vendor/pa_wrappers'
  app.include 'pa_sink_input_info_wrapper.h',
    prefix: '/Users/ryanjafari/Documents/repos/asv/vendor/pa_wrappers'

  Dir['/usr/local/include/pulse/**/*.h'].each do |f|
    app.include File.basename(f), prefix: File.dirname(f)
  end
end

# Track and specify files and their mutual dependencies within the :motion
# Bundler group
MotionBundler.setup
