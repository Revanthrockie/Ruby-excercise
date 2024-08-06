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