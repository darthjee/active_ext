# frozen_string_literal: true

require 'active_record'

module ActiveRecord
  # Extends +ActiveRecord::Relation+ with additional instance methods.
  #
  # These methods are available on all ActiveRecord relations.
  class Relation
    # Returns the fraction of records in the current relation that match the
    # given filter(s), as a decimal between +0.0+ and +1.0+.
    #
    # @overload percentage(**conditions)
    #   @param conditions [Hash] a hash of column names and values to match.
    # @overload percentage(sql_condition)
    #   @param sql_condition [String] a raw SQL condition to evaluate.
    # @overload percentage(*scopes)
    #   @param scopes [Array<Symbol>] one or more named scopes to chain.
    #
    # @return [Float] fraction of matching records (0.0–1.0), or +0.0+
    #   when the relation is empty (to avoid division by zero).
    #
    # @note Do *not* mix Symbol scope names with Hash or String conditions in a
    #   single call.  Use Symbols together, or a single Hash/String — never both
    #   forms at once.
    #
    # @example Using a named scope
    #   Document.percentage(:with_error) #=> 0.75
    #
    # @example Using a hash condition
    #   Document.percentage(status: :error) #=> 0.75
    #
    # @example Using a raw SQL string
    #   Document.percentage("status = 'error'") #=> 0.75
    #
    # @example Chaining multiple named scopes
    #   Document.percentage(:active, :with_error) #=> 0.25
    #
    # @example Within a nested scope
    #   Document.active.percentage(:with_error) #=> 0.5
    #
    # @example Empty relation returns 0.0, not a Float
    #   Document.where(id: nil).percentage(:with_error) #=> 0.0
    def percentage(*filters)
      return 0.0 if count.zero?
      return where(*filters).count * 1.0 / count unless filters.first.is_a?(Symbol)

      filters.inject(self) do |relation, scope|
        relation.public_send(scope)
      end.count * 1.0 / count
    end

    # Returns an array of hashes for the selected columns, one hash per record.
    # This is similar to +pluck+, but each row is represented as a Hash keyed
    # by column name (as a Symbol) rather than a plain Array.
    #
    # When called with no arguments, returns the full +as_json+ representation
    # of every record in the relation.
    #
    # @overload pluck_as_json(*keys)
    #  @param keys [Array<Symbol>] column names to include in each hash.
    # @overload pluck_as_json()
    #
    # @return [Array<Hash>] array of hashes mapping column name to value.
    #
    # @example Selecting specific columns
    #   Document.pluck_as_json(:id, :status)
    #   #=> [{ id: 1, status: "error" }, { id: 2, status: "success" }]
    #
    # @example No arguments returns all columns
    #   Document.pluck_as_json
    #   #=> [{ id: 1, status: "error", active: false, ... }, ...]
    #
    # @example Works with scope chains
    #   Document.active.pluck_as_json(:id, :status)
    #   #=> [{ id: 2, status: "success" }]
    def pluck_as_json(*keys)
      keys.empty? ? map(&:as_json) : pluck(*keys).map { |i| i.as_hash(keys) }
    end
  end
end
