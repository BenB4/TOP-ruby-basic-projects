def stock_picker(price_arr)
  local_min_max = []
  local_min = 0
  local_max = 0
  min_set = false
  max_set = false
  price_arr.each_with_index do |price, day|
    if day == 0
      local_min = day
      min_set = true
    elsif day + 1 == price_arr.length && price > price_arr[day - 1]
      local_max = day
      if min_set == true
        local_min_max.push([local_min, local_max])
      end
    elsif day + 1 < price_arr.length && price > price_arr[day - 1] && price > price_arr[day + 1]
      local_max = day
      max_set = true
      if min_set == true
        local_min_max.push([local_min, local_max])
        min_set = false
        max_set = false
      end
    elsif day + 1 < price_arr.length && price < price_arr[day - 1] && price < price_arr[day + 1]
      local_min = day
      min_set = true
      if max_set == true
        local_min_max.push([local_min, local_max])
        min_set = false
        max_set = false
      end
    end
  end
  min_seen = nil
  best_pair = [0, 0] #profit is 0 when buy/sell is same day
  local_min_max.each do |pair|
    if min_seen == nil || price_arr[pair[0]] < price_arr[min_seen]
      min_seen = pair[0]
    end
    if price_arr[pair[1]] - price_arr[min_seen] > price_arr[best_pair[1]] - price_arr[best_pair[0]]
      best_pair = pair
    end
  end
  best_pair
end
p stock_picker([17,3,6,9,15,8,6,1,10,2,16])
#[1,4]  # for a profit of $15 - $3 == $12


#3 15, 1 10, 2 16
#
#min 3, p 12
#min 1, p 9, pm 9
#min 1, p 14, pm 15