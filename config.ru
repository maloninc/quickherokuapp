require 'rubygems'
require 'bundler'

Bundler.require

#
# Logging
#
$stdout.sync = true

trap('TERM') {Process.kill 'INT', Process.pid}

require './app.rb'
run Sinatra::Application