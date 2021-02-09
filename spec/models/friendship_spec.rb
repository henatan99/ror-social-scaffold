require './rails_helper'

describe Friendship, type: :model do

    let(:user1) { User.create(id: 1, name: 'elisha', email: 'elisha@gmail.com', encrypted_password: 'elishapassword') }
    let(:user2) { User.create(id: 2, name: 'henok', email: 'henok@gmail.com', encrypted_password: 'henokpassword') }
    
    it 'is valid with valid attributes' do
        friendship = Friendship.new
        friendship.user = user1
        friendship.friend = user2
        friendship.userid_friendid = '1-2'
        expect(friendship).to be_valid
    end

    it 'is invalid with incomplete attributes' do
        friendship = Friendship.new
        friendship.user = user1 
        friendship.friend = user2
        expect(friendship).to_not be_valid
    end

    it 'validations' do
        friendship1 = Friendship.new(user_id: 1, friend_id: 2, userid_friendid: '1-2')    
        friendship2 = Friendship.new(user_id: 1, friend_id: 2, userid_friendid: '1-2')
        expect(friendship2).to_not be_valid
    end

    # context 'associations' do
    #     it { is_expected.to belong_to(:user) }
    #     it { is_expected.to belong_to(:friend) }
    # end
end
