defmodule MostRepeated do

  def search_repeated(string) do
    String.graphemes(string)
    |> Enum.reduce(%{}, &(insert_char(&1, &2)))
    |> Enum.reduce({nil, 0}, &(find_greatest(&1, &2)))
    |> elem(0)
    |> IO.inspect()
  end

  def insert_char(char, acc) do
    val = acc[char]
    if is_nil(val) do
      Map.put_new(acc, char, 1)
    else
      %{acc | char => val + 1}
    end
  end

  def find_greatest({k, v}, {_, greatest}) when v > greatest, do: {k,v}
  def find_greatest({_k, v}, {char, greatest}), do: {char, greatest}

end

MostRepeated.search_repeated("aabbac")
