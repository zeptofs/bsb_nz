# frozen_string_literal: true

require "json"
require "rest-client"

module BsbNz
  # Generator for bank branch files from paymentsnz.co.nz
  class BranchListGenerator
    DEFAULT_URL = "https://www.paymentsnz.co.nz/resources/industry-registers/bank-branch-register/data"
    DEFAULT_DATA_PATH = "lib/data/bsb_branch_list.json"

    attr_reader :data

    def initialize(data)
      @data = data
    end

    def generate_data_file
      File.open(DEFAULT_DATA_PATH, "w") { |file| file.write(json) }
    end

    private

    def json
      JSON.pretty_generate(data)
    end

    class << self
      def run
        data = fetch_branch_data
        new(data)
          .tap do |generator|
            generator.generate_data_file

            puts "Branch data file #{DEFAULT_DATA_PATH} generated with #{generator.data.keys.length} records"
          end
      end

      private

      def fetch_branch_data
        content = RestClient.get(DEFAULT_URL).body
        raw_json = JSON.parse(content)
        raw_json["rows"]
          .sort_by { |_uuid, item| item["national_clearing_code"] }
          .each_with_object({}) do |item, acc|
            _bank_id, branch = item
            acc[branch["national_clearing_code"]] = branch
            acc
          end
      end
    end
  end
end
