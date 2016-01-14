require 'json'

class Shop
  attr_reader :name, :address, :phone, :prices, :basket

  def initialize(shop_data: "hipstercoffee")
    @data = parse shop_data
    @name = @data['shopName']
    @address = @data['address']
    @phone = @data['phone']
    @prices = @data['prices'][0]
    @basket = Hash.new(0)
  end

  def order_item(name, qty=0)
    fail "Please specify a meaningful quantity" if invalid?(qty)
    if basket[name] + qty < 0
      basket[name] = 0 
    else
      basket[name] += qty
    end
  end

  private
  def parse(shop_data)
    file = File.read("#{shop_data}.json")
    JSON.parse(file)[0]
  end

  def invalid?(qty)
    qty == 0 ||
    !qty.kind_of?(Integer)
  end

end
