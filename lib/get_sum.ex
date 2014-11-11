defmodule Elixilorem.GetSum do

  @def_ipsum_path to_string(:code.priv_dir(:elixilorem)) <> Application.get_env(:elixilorem, :ipsum_path, "/ipsums/")
  @def_extension Application.get_env(:elixilorem, :extension, ".txt")
  @def_flavor Application.get_env(:elixilorem, :flavor, "lorem_ipsum")
  @def_format Application.get_env(:elixilorem, :format, "text")
  @def_joins Application.get_env(:elixilorem, :joins, [paragraphs: "\n", sentences: ". ", words: " "])

  def get_block_sequence(type, count, %{flavor: flavor, format: nil}) do
    case get_sum_file(flavor) do
      {:error, error} -> error
      str ->
        list = str |> strip(type) |> String.split(@def_joins[type], trim: true)
        list = get_sum_file(flavor) |> strip(type) |> String.split(@def_joins[type], trim: true)
        length = length(list)

        gen_sequence({list, count, type}, :random.uniform(length), length, [])
    end
  end

  #
  # Private parts
  #

  def get_sum_file(nil), do: get_sum_file(@def_flavor)
  def get_sum_file(name) do
    try do
      build_sum_filepath(name) |> File.read! |> String.strip
    rescue error ->
      {:error, error}
    end
  end

  def build_sum_filepath(name), do: @def_ipsum_path <> name <> @def_extension

  #
  # "Why all this noise? Just return random paragraphs," my hypercritical inner voice says.
  # "No, inner voice. With short input texts, the probability is high that paragraphs will
  # repeat, and that's gross. Besides, YOU AREN'T MY REAL DAD." - Me
  #

  defp gen_sequence({list, count, type}, idx, max, out) do
    if idx > max, do: idx = 1

    if length(out) < count do
      gen_sequence({list, count, type}, idx + 1, max, out ++ [:lists.nth(idx, list) |> String.strip])
    else
      gen_sequence({:ok, out, type})
    end
  end

  defp gen_sequence({:ok, list, :sentences}) do
    str = Enum.join(list, @def_joins[:sentences])
    str <> @def_joins[:sentences] |> String.strip
  end
  defp gen_sequence({:ok, list, joiner}), do: Enum.join(list, @def_joins[joiner]) |> String.strip |> String.capitalize

  defp strip(str, :paragraphs), do: str
  defp strip(str, :sentences), do: str |> strip_paragraphs |> make_sentence
  defp strip(str, :words), do: str |> strip_paragraphs |> strip_sentences |> make_words

  defp strip_paragraphs(str), do: str |> String.replace(@def_joins[:paragraphs], " ") |> String.replace("  ", " ")
  defp strip_sentences(str) do
    sentence_join = @def_joins[:sentences] |> String.strip
    str |> String.replace(sentence_join, " ") |> String.replace("  ", " ")
  end

  defp make_sentence(str) do
    str = String.strip(str)

    if String.ends_with?(str, ".") do
      str <> @def_joins[:words]
    else
      str <> @def_joins[:sentences]
    end
  end

  defp make_words(str), do: str |> String.replace(~r/\W/, " ") |> String.replace(~r/\s+/, " ")

end