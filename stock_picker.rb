def stock_picker(prices)
  return "No profit to be made" if prices.length < 2 
  lowest_price = prices[0]
  sell_day = nil
  buy_day = 0
  potential_buy_day = 0
  potential_profit = 0
  prices.each_with_index do |price,day|
    if price >= lowest_price 
      if price - lowest_price >= potential_profit
        potential_profit = price-lowest_price
        sell_day = day
        buy_day = potential_buy_day
      end
    elsif price <= lowest_price 
      lowest_price = price
      potential_buy_day = day
    end
  end
  days = [buy_day, sell_day]
end

p stock_picker([17,3,6,9,15,8,6,1,10]) #--> [1,4]
p stock_picker([3]) #--> No profit to be made
p stock_picker([17,3,3]) #--> [0,0] or [1,1] or [1,2] or [2,2] best is to even out
p stock_picker([17,1]) #--> [0,0] or [1,1] best is to even out
p stock_picker([12,3,4,1,5,1]) #--> [3,4]
