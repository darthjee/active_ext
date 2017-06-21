require 'spec_helper'

describe ActiveRecord::Relation do
  describe '#percentage' do
    it_behaves_like 'a method that returns the percentage of objects found' do
      let(:subject) { Document.all }
    end
  end

  describe '#pluck_as_json' do
    let(:json) { Document.all.pluck_as_json(:id, :status) }
    let(:expected) do
      [ { id: 1, status: 'error' }, { id: 2, status: 'success' } ]
    end

    before do
      Document.delete_all
      Document.create(id: 1, status: :error)
      Document.create(id: 2, status: :success)
    end

    it 'returns an array of hashes' do
      expect(json).to eq(expected)
    end

    context 'when no arguments are given' do
      let(:keys) do
        Document.all.pluck_as_json.first.keys
      end
      let(:expected) {%w(id status updated_at created_at active)}

      it 'returns all keys' do
        expect(keys).to match_array(expected)
      end
    end
  end
end
