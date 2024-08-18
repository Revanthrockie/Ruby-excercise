def fib_location(n)
  if n == 0
    return 0
  elsif n == 1
    return 1
  else
    fib_location(n-1) + fib_location(n-2)
  end
end