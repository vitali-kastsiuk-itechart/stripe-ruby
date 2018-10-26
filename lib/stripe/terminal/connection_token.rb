# frozen_string_literal: true

module Stripe
  module Terminal
    class ConnectionToken < Stripe::APIResource
      extend Stripe::APIOperations::Create

      OBJECT_NAME = "terminal.connection_token".freeze

      def self.resource_url
        "/v1/#{self::OBJECT_NAME.downcase.tr('.', '/')}s"
      end
    end
  end
end
