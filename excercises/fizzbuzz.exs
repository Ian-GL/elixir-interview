defmodule FizzBuzz do

  def do_fizz(n) do
    fizzbuzz(rem(n, 3), rem(n, 5), n)
  end

  def fizzbuzz(0, 0, _), do: IO.puts "FizzBuzz"
  def fizzbuzz(0, _, _), do: IO.puts "Fizz"
  def fizzbuzz(_, 0, _), do: IO.puts "Buzz"
  def fizzbuzz(_, _, n), do: IO.puts n

end

Enum.map(1..15, &(FizzBuzz.do_fizz(&1)))
