# frozen_string_literal: true

require 'active_record'

module ActiveRecord
  # Extends ActiveRecord::Base with additional class methods.

  # These methods are delegated to the `all` scope of the model,
  # allowing you to call them directly on the model class.
  class Base
    class << self
      delegate :percentage, :pluck_as_json, to: :all

      # @method percentage
      # Calculates the percentage of records that match a given condition.
      # @overload (see ActiveRecord::Relation#percentage)
      #
      # @see ActiveRecord::Relation#percentage
      # @param (see ActiveRecord::Relation#percentage)
      # @return (see ActiveRecord::Relation#percentage)
      # @example (see ActiveRecord::Relation#percentage)
    end
  end
end
