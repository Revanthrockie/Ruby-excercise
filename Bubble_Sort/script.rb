input1 = [4,3,78,2,0,2,-9,100, -32]
input2 = ["length", "height", "a", "A", "z", "Z"]

# dont prefer this but make sure you know various methods on how to approach the same problem.
def bubbleSort_1 (arr)
        length_of_arr = arr.length
        p arr.min(length_of_arr)
end

# learn this to help gain knowledge on how to generally using sorting_method
def bubbleSort_2(arr)
        iteration = 0 
        (arr.length - 1).times do |i|
            # p "main iteration#{i}"  - you can remove the "#" to see how it workds
        (arr.length - 1 - iteration).times do |i|
            # p "sub iteration#{i}"  - you can remove the "#" to see how it workds
            arr[i], arr[i+1] = arr[i+1], arr[i] if arr[i] > arr[i+1]
        end
        iteration += 1
    end 
    p arr
end
            
      
bubbleSort_1(input1) 
bubbleSort_2(input1)

