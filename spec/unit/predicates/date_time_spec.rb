# frozen_string_literal: true

require "dry/logic/predicates"

RSpec.describe Dry::Logic::Predicates do
  describe "#date_time?" do
    let(:predicate_name) { :date_time? }

    context "when value is a datetime" do
      let(:arguments_list) do
        [[DateTime.now]]
      end

      it_behaves_like "a passing predicate"
    end

    context "with value is not a datetime" do
      let(:arguments_list) do
        [
          [""],
          [[]],
          [{}],
          [Set.new],
          [nil],
          [:symbol],
          [String],
          [1]
        ]
      end

      it_behaves_like "a failing predicate"
    end
  end
end
