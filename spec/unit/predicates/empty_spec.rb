# frozen_string_literal: true

require "dry/logic/predicates"

RSpec.describe Dry::Logic::Predicates do
  describe "#empty?" do
    let(:predicate_name) { :empty? }

    context "when value is empty" do
      let(:arguments_list) do
        [
          [""],
          [[]],
          [{}],
          [Set.new],
          [Set.new([])],
          [nil]
        ]
      end

      it_behaves_like "a passing predicate"
    end

    # TODO: добавить больше примеров с сет
    context "with value is not empty" do
      let(:arguments_list) do
        [
          ["Jill"],
          [[1, 2, 3]],
          [{name: "John"}],
          [Set.new([1])],
          [Set.new([nil])],
          [Set.new([{}])],
          [true],
          [false],
          ["1"],
          ["0"],
          [:symbol],
          [String]
        ]
      end

      it_behaves_like "a failing predicate"
    end
  end
end
