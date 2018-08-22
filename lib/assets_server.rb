require 'sinatra/base'
require 'sinatra/cross_origin'

module Prolog
  module Board
    class Engine < ::Rails::Engine
    end if defined? ::Rails::Engine

    ASSETS_PATH=File.join(__dir__, '..', '..', 'app', 'assets')

    def self.assets_path_for(asset)
      File.join ASSETS_PATH, asset
    end
  end
end

class Mumukit::Server::App < Sinatra::Base
  register Sinatra::CrossOrigin

  configure do
    enable :cross_origin
    set :allow_origin, '*'
  end

  def self.get_asset(route, absolute_path, type)
    get "/assets/#{route}" do
      send_file absolute_path, type: type
    end
  end

  def self.get_board_asset(route, path, type)
    get_asset route, Prolog::Board.assets_path_for(path), type
  end

  def self.get_editor_asset(route, path, type)
    get_asset route, Prolog::Blockly.assets_path_for(path), type
  end

  def self.get_local_asset(route, path, type)
    get_asset route, File.join(__dir__, '..', path), type
  end


  get_editor_asset 'polymer.html', 'htmls/vendor/polymer.html', 'text/html'
  get_editor_asset 'polymer-mini.html', 'htmls/vendor/polymer-mini.html', 'text/html'
  get_editor_asset 'polymer-micro.html', 'htmls/vendor/polymer-micro.html', 'text/html'

  get_editor_asset 'editor/pl-element-blockly.html', 'htmls/pl-element-blockly.html', 'text/html'
  
  get_local_asset 'editor/editor.js', 'lib/render/editor/editor.js', 'application/javascript'
  get_local_asset 'editor/editor.css', 'lib/render/editor/editor.css', 'text/css'
  get_local_asset 'editor/editor.html', 'lib/render/editor/editor.html', 'text/html'
end