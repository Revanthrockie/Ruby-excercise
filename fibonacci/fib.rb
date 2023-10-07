# def fibs(num)
#    arr = [0 , 1]
#    sum = 1
#    i = 1
#     (num - 2).times do
#        sum  = arr[i] + arr[i - 1]
#        arr << sum if sum != 0
#        i += 1
#     end
#     return p arr
# end

# fibs(8)

# sum = 1 , i = 1 ; arr[1] = 1 ; arr [0] = 0 after sum = 1 , i = 2
# sum = 1 , i = 2 ; arr[2] = 1 ; arr [1] = 1 

arr = [0 , 1]
def fibs_rec(num , arr , i)
    if num == 2
        return p arr
    else
    sum = arr[i] + arr[i - 1] 
    i += 1
    arr << sum
    fibs_rec(num - 1 , arr , i)
    end
end

fibs_rec(8 , arr , 1)