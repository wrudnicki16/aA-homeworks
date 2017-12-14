def sluggish_fish(arr)
  longest_fish = nil
  arr.each do |el1|
    arr.each do |el2|
      if el1.length > el2.length
        if longest_fish.nil? || longest_fish.length < el1.length
          longest_fish = el1
        end
      elsif el2.length > el1.length
        if longest_fish.nil? || longest_fish.length < el2.length
          longest_fish = el2
        end
      end
    end
  end
  longest_fish
end

def dominant_fish(array)
  sorted = false
  until sorted
    sorted = true
    array.each_with_index do |_, i|
      next if i == array.length - 1
      if array[i].length < array[i + 1].length
        array[i], array[i + 1] = array[i + 1], array[i]
        sorted = false
      end
    end
  end
  array.first
end
