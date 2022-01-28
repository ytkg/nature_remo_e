# frozen_string_literal: true

require_relative 'nature_remo_e/version'
require_relative 'nature_remo_e/client'
require_relative 'nature_remo_e/cli'
require_relative 'patches/thor_ext'

module NatureRemoE
  class Error < StandardError; end
  # Your code goes here...
end
