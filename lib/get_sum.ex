defmodule Elixilorem.GetSum do
  alias Elixilorem.GetSum.Generator, as: Gen

  def paragraph(), do: _block
  def paragraphs(count \\ 1), do: _block(:paragraphs, count)
  def paragraphs(count, %{flavor: flavor}), do: _block(:paragraphs, count, %{flavor: flavor, format: nil})

  def sentence(), do: _block(:sentence)
  def sentences(count \\ 1), do: _block(:sentences, count)
  def sentences(count, %{flavor: flavor}), do: _block(:sentences, count, %{flavor: flavor, format: nil})

  def word(), do: _block(:word)
  def words(count \\ 1), do: _block(:words, count)
  def words(count, %{flavor: flavor}), do: _block(:words, count, %{flavor: flavor, format: nil})

  defp _block(type \\ :paragraphs, count \\ 1, params \\ %{flavor: nil, format: nil}), do:
    Gen.get_block_sequence(type, count, params)


  # def stuff() do
  #   get_sum_file("cat") |> String.split("\n", trim: true) |> get_random_listitem
  # end
end