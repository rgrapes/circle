# frozen_string_literal: true

module Avo
  module Resources
    class Book < Avo::BaseResource
      # self.includes = []
      # self.attachments = []
      # self.search = {
      #   query: -> { query.ransack(id_eq: params[:q], m: "or").result(distinct: false) }
      # }

      def fields
        field :id, as: :id
        field :name, as: :text
        field :description, as: :textarea
        field :author_id, as: :number
        field :isbn, as: :text
        field :cover_art, as: :file
        field :author, as: :belongs_to
      end
    end
  end
end
