# frozen_string_literal: true

require ::File.expand_path("../../test_helper", __FILE__)

module Stripe
  class PersonTest < Test::Unit::TestCase
    setup do
      @account = Stripe::Account.retrieve("acct_123")
    end

    should "be listable" do
      persons = @account.persons.list
      assert_requested :get,
                       "#{Stripe.api_base}/v1/accounts/#{@account.id}/persons"
      assert persons.data.is_a?(Array)
      assert persons.data[0].is_a?(Stripe::Person)
    end

    should "be retrievable" do
      person = @account.persons.retrieve("person_123")
      assert_requested :get,
                       "#{Stripe.api_base}/v1/accounts/#{@account.id}/persons/person_123"
      assert person.is_a?(Stripe::Person)
    end

    should "be creatable" do
      person = @account.persons.create(
        first_name: "John"
      )
      assert_requested :post,
                       "#{Stripe.api_base}/v1/accounts/#{@account.id}/persons"
      assert person.is_a?(Stripe::Person)
    end

    should "be saveable" do
      person = @account.persons.retrieve("person_123")
      person.first_name = "John"
      person.save
      assert_requested :post,
                       "#{Stripe.api_base}/v1/accounts/#{person.account}/persons/#{person.id}"
    end
  end
end
