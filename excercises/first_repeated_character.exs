defmodule FirstRepeatedChar do

  def find(string) do
    acc =
      String.graphemes(string)
      |> Enum.reduce_while(%{}, &(store_and_compare(&1, &2)))
    if is_map(acc), do: nil, else: acc
  end

  def store_and_compare(char, acc) do
    if is_nil(acc[char]) do
      {:cont, Map.put_new(acc, char, 1)}
    else
      {:halt, char}
    end
  end

end

FirstRepeatedChar.find("abcdefg") |> IO.puts()
