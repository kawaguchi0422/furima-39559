require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: @user.id, item_id: @item.id)
  end

  describe '購入者情報の保存' do
    context '購入できる場合' do
      it 'すべての値が正しく入力されていれば購入できる' do
        expect(@order_address).to be_valid
      end
      it 'building_nameは空でも購入できる' do
        @order_address.building = ''
        expect(@order_address).to be_valid
      end
    end

    context '購入できない場合' do
      it 'postal_codeが空だと購入できない' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'postal_codeは「3桁ハイフン4桁」の半角文字列のみ保存可能なこと' do
        @order_address.postal_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code is invalid")
      end
      it 'prefecture_idが空だと購入できない' do
        @order_address.prefecture_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("prefecture_id can't be blank")
      end
      it 'blockが空だと購入できない' do
        @order_address.block = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Block can't be blank")
      end
      it 'phone_numberが空だと購入できない' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("phone_number can't be blank")
      end
      it 'phone_numberは9桁以下だと購入できない' do
        @order_address.phone_number = '123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("phone_number is invalid")
      end
      it 'phone_numberは12桁以上だと購入できない' do
        @order_address.phone_number = '123456789123'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("phone_number is invalid")
      end
      it 'phone_numberは半角数字以外が含まれている場合だと購入できない' do
        @order_address.phone_number = '090-1234'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("phone_number is invalid")
      end
      it 'cityに「1」が選択されている場合は出品できない' do
        @order_address.city = '1'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it 'tokenが空だと購入できない' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'userが紐付いていなければ購入できない' do
        @order_address.user = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('User must exist')
      end
      it 'itemが紐付いていなければ購入できない' do
        @order_address.item = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Item must exist')
      end
    end
  endend
