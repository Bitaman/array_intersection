# Returns a new array to that contains elements in the intersection of the two input arrays
# Time complexity: o(n log m)
# Space complexity: o(n) n is the number of elements of the smallest array
# def intersection(array1, array2)
#   return [] if array1 == [] || array2 == []
#   return [] if array1 == nil || array2 == nil
#   intersection = []
#   array1.each do |i|
#     array2.each do |j|
#       if i == j
#         intersection.push(i)
#       end
#     end
#   end
#   return intersection
# end
def intersection(array1, array2)
  if array1 == nil || array2 == nil
    return []
  else
    intersection = []
    if array1.length >= array2.length
      i = 0
      array = array1.sort
      array2.length.times do
        if binary_search(array, array2[i])
          intersection.push(array2[i])
        end
        i += 1
      end
      return intersection
    else
      array = array2.sort
      array1.length.times do
        if binary_search(array, array1[i])
          intersection.push(array1[i])
        end
        i += 1
      end
      return intersection
    end
  end
end

def binary_search(array, value_to_find)
  mid = array.length / 2
  i = 0
  j = array.length - 1
  while i < j
    if array[mid] == value_to_find
      return true
    elsif array[mid] < value_to_find
      i = mid + 1
      j = array.length - 1
      mid = (i + j) / 2
    else
      j = mid - 1
      mid = (i + j) / 2
    end
  end
  return false
end
