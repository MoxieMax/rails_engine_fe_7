require 'rails_helper'

RSpec.describe RailsEngineService do
  describe "instance methods" do
    
    let(:res) {RailsEngineService.new.get_merchants}
    
    context "#fetch_path" do
      it "returns a JSON object containing all merchants" do
        expect(res).to be_a(Hash)
        expect(res[:data].first).to be_a(Hash)
      end
    end
    
    context "#get_merchants" do
      it "has data within the object" do
        expect(res[:data]).to be_an(Array)
      end
      
      it "has access to individual merchants" do
        merchant = res[:data].first
        attributes = merchant[:attributes]
        
        expect(merchant).to be_a(Hash)
        expect(merchant.keys).to eq([:id, :type, :attributes])
        expect(merchant[:attributes]).to have_key(:name)

        expect(merchant[:id]).to eq("1")
        expect(merchant[:type]).to eq("merchant")
        expect(attributes[:name]).to eq("Schroeder-Jerde")
      end
    end
    
    context "#get_merchant(id)" do
      
      let(:one) {RailsEngineService.new.get_merchant(1)}
      
      it "returns a hash with one merchant" do
        expect(one).to be_a(Hash)
        expect(one[:data]).to be_a(Hash)
        expect(one[:data].keys).to eq([:id, :type, :attributes])
        expect(one[:data][:attributes].keys).to eq([:name])
      end
      
      # xit "has access to individual merchants" do
      #   expect(one).to be_a(Hash)
      #   expect(one.keys).to eq([:id, :type, :attributes])
      #   expect(one[:attributes]).to have_key(:name)
      # 
      #   expect(one[:id]).to eq("1")
      #   expect(one[:type]).to eq("merchant")
      #   expect(attributes[:name]).to eq("Schroeder-Jerde")
      # end
    end
  end
end