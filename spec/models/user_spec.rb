# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength

require 'rails_helper'

RSpec.describe User, type: :model do
  before(:all) do
    @mike = User.create(name: "m:ke", email: "mike@example.com", password: "123456", id: 1)
    @katie = User.create(name: "katie", email: "katie@example.com", password: "123456", id: 2)
  end
  describe '#request_friendship_with' do
    context 'when a user requests a friendship with another user' do
      it 'creates the friendship' do
        saved = @mike.request_friendship_with({ requested_user_id: @katie.id })
        expect(saved).to eq(true)
      end
    end
  end
  describe '#request_friendship_with' do
    context 'when a user requests a friendship with another user' do
      it 'creates the friendship with confirmed set to false' do
        @mike.request_friendship_with({ requested_user_id: @katie.id })
        friendship = Friendship.where(requesting_user_id: @mike.id).first
        expect(friendship.confirmed).to eq(false)
      end
    end
  end
  describe '#request_friendship_with' do
    context 'when a user requests a friendship with another user' do
      it "creates the friendship using the other user's id" do
        @mike.request_friendship_with({ requested_user_id: @katie.id })
        friendship = Friendship.where(requesting_user_id: @mike.id).first
        other_users_id = @katie.id
        expect(friendship.requested_user_id).to eq(other_users_id)
      end
    end
  end
  describe '#request_friendship_with' do
    context 'when a user requests a friendship with themselves' do
      it 'does not create the friendship' do
        saved = @mike.request_friendship_with({ requested_user_id: @mike.id })
        expect(saved).not_to eq(true)
      end
    end
  end
end

# rubocop:enable Metrics/BlockLength
