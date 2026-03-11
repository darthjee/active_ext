# frozen_string_literal: true

require 'active_record'

module ActiveRecord
  # Extends +ActiveRecord::Base+ with additional class methods.

  # These methods are delegated to the `all` scope of the model,
  # allowing you to call them directly on the model class.
  class Base
    class << self
      delegate :percentage, :pluck_as_json, :scopped, to: :all

      # @method percentage
      # @api public
      #
      # Calculates the percentage of records that match a given condition
      # @overload (see ActiveRecord::Relation#percentage)
      #
      # @see ActiveRecord::Relation#percentage
      # @param (see ActiveRecord::Relation#percentage)
      # @return (see ActiveRecord::Relation#percentage)
      # @example (see ActiveRecord::Relation#percentage)

      # @method scopped
      # @api public
      #
      # Applies the given filters to the relation, returning a new relation
      # @overload (see ActiveRecord::Relation#scopped)
      # @see ActiveRecord::Relation#scopped
      # @param (see ActiveRecord::Relation#scopped)
      # @return (see ActiveRecord::Relation#scopped)
      # @example (see ActiveRecord::Relation#scopped)

      # @method pluck_as_json
      # @api public
      #
      # Plucks specified columns and returns an array of hashes
      #
      # @overload (see ActiveRecord::Relation#pluck_as_json)
      # @see ActiveRecord::Relation#pluck_as_json
      # @param (see ActiveRecord::Relation#pluck_as_json)
      # @return (see ActiveRecord::Relation#pluck_as_json)
      # @example (see ActiveRecord::Relation#pluck_as_json)
    end
  end
end
