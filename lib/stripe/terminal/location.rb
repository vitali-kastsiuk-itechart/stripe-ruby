# frozen_string_literal: true

module Stripe
  module Terminal
    class Location < Stripe::APIResource
      extend Stripe::APIOperations::Create
      extend Stripe::APIOperations::List
      include Stripe::APIOperations::Save

      OBJECT_NAME = "terminal.location".freeze

      def self.resource_url
        "/v1/#{self::OBJECT_NAME.downcase.tr('.', '/')}s"
      end
    end
  end
end
