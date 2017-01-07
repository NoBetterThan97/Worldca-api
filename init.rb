# frozen_string_literal: true
folders = 'config,controllers,lib,values,models,representers,queries,services'
Dir.glob("./{#{folders}}/init.rb").each do |file|
  require file
end
