# frozen_string_literal: true

require "dry/logic/predicates"

RSpec.describe Dry::Logic::Predicates do
  describe "#set?" do
    let(:predicate_name) { :set? }

    context "when value is a set" do
      let(:arguments_list) do
        [
          [Set.new],
          [Set.new([])],
          [Set.new(%w[other array])],
          [Set.new([123, "really", :blah])],
          [Set.new([nil])],
          [Set.new([false])],
          [Set.new([true])]
        ]
      end

      it_behaves_like "a passing predicate"
    end

    context "when value is not a set" do
      let(:arguments_list) do
        [
          [""],
          [[]],
          [{}],
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
