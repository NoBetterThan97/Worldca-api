# frozen_string_literal: true
require 'faye'
require './init.rb'

use Faye::RackAdapter, mount: '/ws', timeout: 25

run WorldCaAPI
