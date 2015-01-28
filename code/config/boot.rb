# Set up gems listed in the Gemfile.
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)
ENV["PATH"] = "/usr/bin:#{ENV['PATH']}"
ENV["EXECJS_RUNTIME"] = 'Node'

require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])
