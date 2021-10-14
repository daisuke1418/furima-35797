require 'rails_helper'

RSpec.describe OrderDestination, type: :model do
  describe '商品購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_destination = FactoryBot.build(:order_destination, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context '商品購入情報が保存できる場合' do
      it '全ての値が正しく入力されて尚且つtokenがあれば保存できる' do
        expect(@order_destination).to be_valid
      end

      it 'building_nameは空でも保存できる' do
        @order_destination.building_name = ''
        expect(@order_destination).to be_valid
      end
    end

    context '商品購入情報が保存できない場合' do
      it 'postal_codeが空だと保存できない' do
        @order_destination.postal_code = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_destination.postal_code = '1234567'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end

      it 'prefectureを選択していないと保存できない' do
        @order_destination.prefecture_id = 0
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'municipalitiesが空だと保存できない' do
        @order_destination.municipalities = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Municipalities can't be blank")
      end

      it 'house_numberが空だと保存できない' do
        @order_destination.house_number = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("House number can't be blank")
      end

      it 'telephone_numberが空だと保存できない' do
        @order_destination.telephone_number = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Telephone number can't be blank")
      end

      it 'telephone_numberが10桁未満では保存できない' do
        @order_destination.telephone_number = 123456789
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include('Telephone number is invalid. Input only number')
      end

      it 'telephone_numberが11桁を超過すると保存できない' do
        @order_destination.telephone_number = 123456789101
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include('Telephone number is invalid. Input only number')
      end

      it 'telephone_numberが全角では保存できない' do
        @order_destination.telephone_number = '１２３４５６７８９１０'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include('Telephone number is invalid. Input only number')
      end

      it 'userが紐づいていないと保存できないこと' do
        @order_destination.user_id = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("User can't be blank")
      end

      it 'itemが紐付いていないと保存できない' do
        @order_destination.item_id = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Item can't be blank")
      end

      it "tokenが空では登録できないこと" do
        @order_destination.token = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
