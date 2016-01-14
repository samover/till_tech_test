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
end
