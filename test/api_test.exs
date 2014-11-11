defmodule ApiTests do
  use ExUnit.Case
  alias Elixilorem, as: GS

  @test_flavor "_test"
  @def_joins Application.get_env(:elixilorem, :joins)

  # Paragraphs

  test "GetSum.paragraph: returns one long string of unformatted Lorem Ipsum" do
    pg = GS.paragraph()

    assert is_binary(pg)
    assert String.length(pg) > 1
  end

  test "GetSum.paragraphs/1: returns x paragraphs of unformatted Lorem Ipsum" do
    count = :random.uniform(10)
    pg    = GS.paragraphs(count)

    assert is_binary(pg)
    assert String.split(pg, @def_joins[:paragraphs]) |> length == count
  end

  test "GetSum.paragraphs/2: returns x paragraphs of text in the specified flavor" do
    count = :random.uniform(10)
    pg    = GS.paragraphs(count, %{flavor: @test_flavor})

    assert is_binary(pg)
    assert String.split(pg, @def_joins[:paragraphs]) |> List.first |> String.match? ~r/Paragraph/
  end

  # Sentences

  test "GetSum.sentence: returns one long string of unformatted Lorem Ipsum" do
    pg = GS.sentence()

    assert is_binary(pg)
    assert String.length(pg) > 1
  end

  test "GetSum.sentences/1: returns x sentences of unformatted Lorem Ipsum" do
    count = :random.uniform(10)
    pg    = GS.sentences(count)

    assert is_binary(pg)
    assert String.split(pg, @def_joins[:sentences]) |> length == count
    assert String.match?(pg, ~r/\n/) == false
  end

  # Words

  test "GetSum.word: returns one Lorem Ipsum word" do
    pg = GS.word()

    assert is_binary(pg)
    assert String.length(pg) > 0
  end

  test "GetSum.words/1: returns x words of unformatted Lorem Ipsum" do
    count = :random.uniform(10)
    pg    = GS.words(count)

    assert is_binary(pg)
    assert String.split(pg, @def_joins[:words]) |> length == count

    assert String.match?(pg, ~r/[^0-9a-zA-Z ]/) == false
  end

end