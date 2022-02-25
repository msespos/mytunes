# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength

require 'rails_helper'

RSpec.describe User, type: :model do
  #def request_friendship_with(friendship_params)
  #  @friendship = Friendship.new(friendship_params)
  #  @friendship.confirmed = false
  #  @friendship.requesting_user_id = id
  #  @friendship.save
  #end
  describe '#request_friendship_with' do
    context 'when a user requests a friendship' do
      it 'creates the friendship with confirmed set to false' do
        friendship = request_friendship_with([{ requested_user_id: 1 }, {requesting_user_id: 2}])
        expect(friendship.confirmed).to eq(false)
      end
    end
  end
end

# rubocop:enable Metrics/BlockLength
