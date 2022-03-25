# frozen_string_literal: true

require_relative "bsb_nz/version"
require "bsb_number_validator"
require "json"

# Bank branches lookup for New Zealand
module BsbNz
  class << self
    def lookup(number)
      bsb = normalize(number)
      data_hash[bsb]
    end

    def normalize(str)
      str.gsub(/[^\d]/, "")
    end

    private

    def data_hash
      @data_hash ||= JSON.parse(
        IO.read(File.expand_path("../lib/data/bsb_branch_list.json", __dir__)),
        symbolize_names: true
      ).stringify_keys
    end
  end
end
