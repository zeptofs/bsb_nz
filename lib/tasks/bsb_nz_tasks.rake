# frozen_string_literal: true

namespace :bsb_nz do
  desc "Generate JSON-formatted bank branch data file from paymentsnz.co.nz"
  task :generate_branch_list do
    require "bsb_nz/branch_list_generator"

    warn "Loading NewZealand bank branch list ... (This may take a while)"
    BsbNz::BranchListGenerator.run
  end
end
