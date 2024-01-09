require 'rails_helper'

describe User do
  let(:nickname) { 'テスト太郎' }
  let(:email) { 'test@example.com' }
  let(:password) { '12345678' }
  let(:user) { User.new(nickname: nickname, email: email, password: password, password_confirmation: password) }

  describe '.first' do
    before do
      create(:user, nickname: nickname, email: email)
    end

    subject { described_class.first }

    it '事前に作成した通りのUserを返す' do
      expect(subject.nickname).to eq('テスト太郎')
      expect(subject.email).to eq('test@example.com')
    end
  end
  
  describe 'validation' do
    describe 'nickname属性' do
      describe '文字数制限の検証' do
        context 'if the nickname is less than 20 characters' do
          let(:nickname) { 'あいうえおかきくけこさしすせそたちつてと' } 
          it 'User Object is valid' do
            expect(user.valid?).to be(true)
          end
        end
        
        context 'if the nickname is more than 20 characters' do
          let(:nickname) { 'あいうえおかきくけこさしすせそたちつてとな' } 
          it 'User object is invalid' do
            user.valid?
            
            expect(user.valid?).to be(false)
            expect(user.errors[:nickname]).to include('is too long (maximum is 20 characters)')
          end
        end
      end
    end
  end
end