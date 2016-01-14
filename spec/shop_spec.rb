describe Shop do
  let(:shop) { described_class.new(shop_data: 'spec/test_data/hipstercoffee') }

  describe "#initialize" do
    it "hase a name" do
      expect(shop.name).to eq "The Coffee Connection"
    end
    it "has an address" do
      expect(shop.address).to eq "123 Lakeside Way"
    end
    it "has a phone number" do
      expect(shop.phone).to eq "16503600708"
    end
    it "has a price list" do
      expect(shop.prices["Americano"]).to eq 3.75
    end
  end

  describe "#order_item" do
    it "adds an order item and quantity to the basket" do
      shop.order_item "Americano", 3 
      expect(shop.basket).to include "Americano" => 3
    end

    it "raises an error when order quantity is 0" do
      expect{shop.order_item "Americano", 0}.to raise_error "Please specify a meaningful quantity"
    end

    it "raises an error when no qty is given" do
      expect{shop.order_item "Americano"}.to raise_error "Please specify a meaningful quantity"
    end 

    it "raises an error when order quantity is not a natural number" do
      expect{shop.order_item "Americano", 1.4}.to raise_error "Please specify a meaningful quantity"
    end

    it "subtracts from the order" do
      shop.order_item "Americano", 3 
      shop.order_item "Americano", -1
      expect(shop.basket).to include "Americano" => 2
    end

    it "considers a negative order to be an order of 0" do
      shop.order_item "Americano", 3 
      shop.order_item "Americano", -4
      expect(shop.basket["Americano"]).to eq 0
    end
  end
end
