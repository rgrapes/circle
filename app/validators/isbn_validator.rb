# frozen_string_literal: true

class IsbnValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value.blank? # Allow blank ISBNs

    begin
      return if Utils::Isbn13.valid?(value)
    rescue StandardError => e
      record.errors.add(attribute, e.message)
      return
    end

    record.errors.add(attribute, 'must be a valid 13-digit ISBN with a correct check digit')
  end
end
