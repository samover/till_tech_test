describe Order do

  let(:order) { described_class.new(prices) }
  
  describe "#initialize" do
    it "has the name of the shop" do
      expect(order.shop_name).to eq "The Coffee Connection"
    end
  end
end
