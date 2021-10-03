require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品投稿の保存' do
    context "出品投稿が保存できる場合" do
      it "商品画像と商品名と商品の説明と商品の詳細と配送についてと販売価格があれば投稿を保存できる" do
        expect(@item).to be_valid
      end
    end

    context "出品投稿が保存できない場合" do
      it "商品画像がないと投稿は保存できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "商品名がないと投稿は保存できない" do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it "商品の説明がないと投稿は保存できない" do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it "カテゴリーが選択されていないと投稿は保存できない" do
        @item.category_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it "商品の状態が選択されていないと投稿が保存できない" do
        @item.condition_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end
      it "配送料の負担が選択されていないと投稿が保存できない" do
        @item.postage_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage must be other than 1")
      end
      it "発送元の地域を選択されていないと投稿が保存できない" do
        @item.prefecture_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it "発送までの日数が選択されていないと投稿が保存できない" do
        @item.lead_time_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Lead time must be other than 1")
      end
      it "価格がないと投稿は保存できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "価格は¥300未満では保存できない" do
        @item.price = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid')
      end
      it "価格は¥9,999,999を超過すると保存できない" do
        @item.price = 10000001
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid')
      end
      it '価格が全角数字だと保存できないこと' do
        @item.price = '２０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid')
      end
      it "ユーザーが紐付いていないと投稿は保存できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end