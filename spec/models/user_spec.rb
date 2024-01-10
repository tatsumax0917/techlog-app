require 'rails_helper'

describe User do
  let(:nickname) { 'テスト太郎' }
  let(:email) { 'test@example.com' }
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
    let(:password) { '12345678' }
    
    describe 'nickname属性' do
      describe '文字数制限の検証' do
        context 'nicknameが20文字以下の場合' do
          let(:nickname) { 'あいうえおかきくけこさしすせそたちつてと' } 
          
          it 'Userオブジェクトは有効である' do
            expect(user.valid?).to be(true)
          end
        end
        
        context 'nicknameが20文字以上の場合' do
          let(:nickname) { 'あいうえおかきくけこさしすせそたちつてとな' } 
          it 'Userオブジェクトは無効である' do
            user.valid?
            
            expect(user.valid?).to be(false)
            expect(user.errors[:nickname]).to include('は20文字以下に設定して下さい。')
          end
        end
      end
      
      describe 'nickname存在性の検証' do
        context 'nicknameが空欄の場合' do
          let(:nickname) { '' }
          
          it 'User オブジェクトは無効である' do
            expect(user.valid?).to be(false)
           expect(user.errors[:nickname]).to include("が入力されていません。")
          end
        end
      end
      
    end
  end
end