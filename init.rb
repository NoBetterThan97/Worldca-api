# frozen_string_literal: true
folders = 'lib,config,controllers,lib,values,models,representers,queries,services,workers'
Dir.glob("./{#{folders}}/init.rb").each do |file|
  require file
end
