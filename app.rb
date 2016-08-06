# encoding: UTF-8
require 'pp'
require 'sinatra'
require 'json'
require 'data_mapper'
require 'haml'
require './resources.rb'

# タイムゾーンに日本時間を指定
ENV['TZ'] = 'Asia/Tokyo'

get '/' do
    haml :index
end
