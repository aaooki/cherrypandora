#\ -p 7788

$LOAD_PATH.push File.expand_path("../lib", __FILE__)

require 'cherry_pandora'

run CherryPandora::App
