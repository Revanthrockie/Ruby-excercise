#Implement a method #stock_picker that takes in an array of stock prices, one for each hypothetical day. It should return a pair of days representing the best day to buy and the best day to sell. Days start at 0.


input_array = [17,3,6,9,15,8,6,1,10]

def stock_picker(arr)
    result = arr.each_with_index.to_a.combination(2).max_by {|a , b| b[0]- a[0]}.map 
    {|v , idx|  "day-#{idx} with price:#{v}"}.to_a
    p "best day to buy is at #{result[0]} and best bet to sell is on day #{result[1]}"
end

stock_picker(input_array)

