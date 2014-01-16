# -*- coding: utf-8 -*-
$LOAD_PATH.unshift('/Library/RubyMotion/lib')
require 'motion/project/template/osx'
require 'rubygems'

begin
  require 'bundler'
  Bundler.require
end

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'asv'
  app.info_plist['LSUIElement'] = true
end
