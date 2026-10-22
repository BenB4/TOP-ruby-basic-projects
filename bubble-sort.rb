def bubbleSort(arr)
  if arr.length <= 1
    return arr
  else
    for i in 0..arr.length - 2
      for j in 0..arr.length - 2 - i
        if arr[j] > arr[j + 1]
          arr[j], arr[j + 1] = arr[j + 1], arr[j]
        end
      end
    end
  end
  arr
end


p bubbleSort([5,4,3,2,1])