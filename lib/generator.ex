defmodule Elixilorem.GetSum.Generator do
  use Application

  @ipsum_path "/priv/ipsums/"
  @paragraph_join "\n"
  @sentence_join "."
  @word_join " "

  @def_flavor Application.get_env(:elixilorem, :flavor)
  @def_format Application.get_env(:elixilorem, :format)

  def get_block_sequence(type, count, %{flavor: flavor, format: format} = params) do
    case type do
      :paragraphs -> splitter = @paragraph_join
      :sentences -> splitter = @sentence_join
      :words -> splitter = @word_join
    end

    list = get_sum_file(flavor) |> String.split(splitter, trim: true)
    length = length(list)

    gen_sequence({list, count, splitter}, :random.uniform(length), length, [])
  end

  #
  # Private parts
  #

  defp get_sum_file(nil), do: get_sum_file(@def_flavor)
  defp get_sum_file(name) do
    try do
      build_sum_filepath(name) |> File.read! |> String.strip
    rescue error ->
      {:error, error}
    end
  end

  defp build_sum_filepath(name), do: File.cwd!() <> @ipsum_path <> name <> ".txt"

  #
  # "Why all this noise? Just return random paragraphs," my hypercritical inner voice says.
  # "No, inner voice. With short input texts, the probability is high that paragraphs will
  # repeat, and that's gross. Besides, YOU AREN'T MY REAL DAD." - Me
  #

  defp gen_sequence({list, count, joiner}, idx, max, out) do
    # IO.puts "args: #{count} = #{joiner} - #{idx} -  #{max} -  #{out}"
    if idx > max, do: idx = 1

    if length(out) < count do
      gen_sequence({list, count, joiner}, idx + 1, max, out ++ [:lists.nth(idx, list)])
    else
      gen_sequence({:ok, out, joiner})
    end
  end

  defp gen_sequence({:ok, list, joiner}), do: Enum.join(list, joiner)

end


# alias Elixilorem.GetSum.Generator, as: G
# G.get_block_sequence :paragraphs, 3, %{flavor: "test", format: nil}