require 'rails_helper'

RSpec.describe Information, type: :model do
  before do
    @information = FactoryBot.build(:information)
  end

  describe '情報投稿' do
    context '投稿できるとき' do
      it 'title、text、category、text、statusが存在すれば投稿できる' do
        expect(@information).to be_valid
      end
    end

    context '投稿できないとき' do
      # ログイン状態が必須であること。
      it 'userが紐づいていなければ投稿できない' do
        @information.user = nil
        @information.valid?
        expect(@information.errors.full_messages).to include("User must exist")
      end

      # 情報名が必須であること。
      it 'titleが空では投稿できない' do
        @information.title = ''
        @information.valid?
        expect(@information.errors.full_messages).to include("Title can't be blank")
      end

      # カテゴリーの情報が必須であること。
      it 'categoryが空では投稿できない' do
        @information.category = ''
        @information.valid?
        expect(@information.errors.full_messages).to include("Category can't be blank")
      end

      # 情報の内容が必須であること。
      it 'textが空では投稿できない' do
        @information.text = ''
        @information.valid?
        expect(@information.errors.full_messages).to include("Text can't be blank")
      end

      # 友達状態かのステータスが必須であること。
      it 'statusが空では投稿できない' do
        @information.status = ''
        @information.valid?
        expect(@information.errors.full_messages).to include("Status can't be blank")
      end
    end
  end
end
