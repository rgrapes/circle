# frozen_string_literal: true

class Book < ApplicationRecord
  belongs_to :author, optional: true

  has_one_attached :cover_art

  default_scope { order(name: :asc) } # Orders books alphabetically
end
