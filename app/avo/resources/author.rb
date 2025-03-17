# frozen_string_literal: true

module Avo
  module Resources
    class Author < Avo::BaseResource
      # self.includes = []
      # self.attachments = []
      # self.search = {
      #   query: -> { query.ransack(id_eq: params[:q], m: "or").result(distinct: false) }
      # }

      def fields
        field :id, as: :id
        field :name, as: :text
        field :bio, as: :textarea
      end
    end
  end
end
