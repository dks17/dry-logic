# frozen_string_literal: true

require "dry/logic/predicates"

RSpec.describe Dry::Logic::Predicates do
  describe "#array?" do
    let(:predicate_name) { :array? }

    context "when value is an array" do
      let(:arguments_list) do
        [
          [[]],
          [%w[other array]],
          [[123, "really", :blah]],
          [[nil]],
          [[false]],
          [[true]]
        ]
      end

      it_behaves_like "a passing predicate"
    end

    context "when value is not an array" do
      let(:arguments_list) do
        [
          [""],
          [{}],
          [Set.new],
          [nil],
          [:symbol],
          [String],
          [1],
          [1.0],
          [true]
        ]
      end

      it_behaves_like "a failing predicate"
    end
  end
end
