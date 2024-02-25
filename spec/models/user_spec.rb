require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      user = User.new(nickname: '', email: 'test@example', password: '123abc', password_confirmation: '123abc',)
    end
    it 'emailが空では登録できない' do

    end
  end
  pending "add some examples to (or delete) #{__FILE__}"
end
