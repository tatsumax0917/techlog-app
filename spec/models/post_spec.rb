require 'rails_helper'

RSpec.describe Post, type: :model do
  before { @user = create(:user) }
  
  let(:title)   { 'テストタイトル' }
  let(:contnet) { 'テスト本文'　}
  let(:user_id) { @user.id }
  
  describe 'バリデーションの検証' do
    
    let(:post) { Post.new(title: title, content: content, user_id: user_id) }
    
    context '正常系' do
      it '有効である' do
        expect(post.valid?).to be true
      end
    end
    
    context '異常系' do
    end
    
    context '' do
    end
    
    context '' do
    end
    
    context '' do
    end
    
    context '' do
    end
    
    context '' do
    end
    
  end
end
