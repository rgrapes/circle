# frozen_string_literal: true

class Author < ApplicationRecord
  has_many :books, dependent: :destroy

  default_scope { order(name: :asc) } # Orders authors alphabetically
end
