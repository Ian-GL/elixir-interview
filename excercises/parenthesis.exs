defmodule Parenthesis do

  def check(string) when is_binary(string) do
    acc = String.graphemes(string)
    |> Enum.reduce_while([], &empty_if_logical(&1, &2))

    is_nil(List.first(acc))
    |> IO.inspect()
  end

  def empty_if_logical(e, acc) do
    cond do
      is_opening(e) -> {:cont, acc ++ [e]}
      is_closing(e) -> remove_corresponding_opening(e, acc)
      true -> raise("The character \"#{e}\" is not a valid parenthesis")
    end
  end

  def remove_corresponding_opening(char, acc) do
    {last_elem, new_acc} = List.pop_at(acc, -1)
    to_remove = corresponding_opening(char)

    if last_elem === to_remove do
      {:cont, new_acc}
    else
      {:halt, acc}
    end
  end

  def is_opening(char), do: char in ["(", "[", "{"]
  def is_closing(char), do: char in [")", "]", "}"]

  def corresponding_opening(char) do
    dict = %{
      ")" => "(",
      "]" => "[",
      "}" => "{"
    }
    dict[char]
  end

end

Parenthesis.check("[({})]")
