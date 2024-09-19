# frozen_string_literal: true

require "dry/logic/predicates"

RSpec.describe Dry::Logic::Predicates do
  describe "#filled?" do
    let(:predicate_name) { :filled? }

    context "when value is filled" do
      let(:arguments_list) do
        [
          ["Jill"],
          [[1, 2, 3]],
          [{name: "John"}],
          [Set.new([1, 2, 3])],
          [true],
          [false],
          ["1"],
          ["0"],
          [:symbol],
          [String]
        ]
      end

      it_behaves_like "a passing predicate"
    end

    context "with value is not filled" do
      let(:arguments_list) do
        [
          [""],
          [[]],
          [{}],
          [Set.new],
          [nil]
        ]
      end

      it_behaves_like "a failing predicate"
    end
  end
end
