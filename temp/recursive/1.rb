def bottle_count(n)
  if n == 0
    print "0 bottles of beer on the wall"
  else 
    print "#{n} bottle of beer on the wall\n"
    bottle_count(n-1)
  end
end

bottle_count(10)