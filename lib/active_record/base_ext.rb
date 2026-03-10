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

      # @method pluck_as_json
      # Plucks specified columns and returns an array of hashes.
      # @overload (see ActiveRecord::Relation#pluck_as_json)
      # @see ActiveRecord::Relation#pluck_as_json
      # @param (see ActiveRecord::Relation#pluck_as_json)
      # @return (see ActiveRecord::Relation#pluck_as_json)
      # @example (see ActiveRecord::Relation#pluck_as_json)
    end
  end
end
