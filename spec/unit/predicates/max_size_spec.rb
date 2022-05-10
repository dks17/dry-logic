# frozen_string_literal: true

require "dry/logic/predicates"

RSpec.describe Dry::Logic::Predicates do
  describe "#max_size?" do
    let(:predicate_name) { :max_size? }

    context "when value size is less than n" do
      let(:arguments_list) do
        [
          [3, [1, 2]],
          [5, "Jill"],
          [3, {1 => "st", 2 => "nd"}],
          [6, 1..5],
          [3, Set.new([1, 2])]
        ]
      end

      it_behaves_like "a passing predicate"
    end

    context "when value size is equal to n" do
      let(:arguments_list) do
        [
          [2, [1, 2]],
          [4, "Jill"],
          [2, {1 => "st", 2 => "nd"}],
          [5, 1..5],
          [2, Set.new([1, 2])]
        ]
      end

      it_behaves_like "a passing predicate"
    end

    context "with value size is greater than n" do
      let(:arguments_list) do
        [
          [1, [1, 2]],
          [3, "Jill"],
          [1, {1 => "st", 2 => "nd"}],
          [4, 1..5],
          [1, Set.new([1, 2])]
        ]
      end

      it_behaves_like "a failing predicate"
    end
  end
end
