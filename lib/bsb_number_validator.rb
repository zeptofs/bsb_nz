# frozen_string_literal: true

require "bsb_nz"
require "active_model"

# Validator of BSB lookup for active_model
class BsbNumberValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if BsbNz.lookup(value)

    record.errors.add(attribute, :invalid)
  end
end
