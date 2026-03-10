# frozen_string_literal: true

require 'spec_helper'

describe ActiveRecord::Relation do
  subject { Document }

  describe '.percentage' do
    it_behaves_like 'a method that returns the percentage of objects found'
  end

  describe '.pluck_as_json' do
    it_behaves_like 'a method that works as pluck but returning the keys'
  end
end
