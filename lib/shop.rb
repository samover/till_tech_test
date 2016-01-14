require 'json'

class Shop
  attr_reader :name, :address, :phone, :prices

  def initialize(shop_data: "hipstercoffee")
    @data = parse(File.read("#{shop_data}.json"))[0]
    @name = @data['shopName']
    @address = @data['address']
    @phone = @data['phone']
    @prices = @data['prices'][0]
  end

  private
  def parse data
    JSON.parse data
  end

end
