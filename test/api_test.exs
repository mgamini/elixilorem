defmodule ApiTests do
  use ExUnit.Case
  use Elixilorem

  test "GetSum: returns one long string of unformatted Lorem Ipsum" do
    # assert is_binary(GetSum)
    # assert String.length(GetSum) > 10
  end

  test "GetSum/1: returns x paragraphs of unformatted Lorem Ipsum" do
    #assert GetSum(3) has two line breaks
  end

  test "GetSum can get x paragraphs of text in a specified format" do
    # assert GetSum(3, {format: "html"})
  end

  test "GetSum can get x paragraphs of text from a specified flavor" do
    # assert GetSum(3, {flavor: "cat"})
  end

end