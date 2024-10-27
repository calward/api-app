require 'rails_helper'

RSpec.describe User do
  let(:user) { User.first }

  describe 'rating' do
    it 'returns 0 when there are no ratings' do
      expect(user.rating).to eq(0)
    end

    context 'when user has ratings' do
      before do
        user.ratings.create!(rater: User.second, rating: 3, rated_at: Time.current)
      end

      it 'returns rating' do
        expect(user.rating).to eq(3.0)
      end
    end

    context 'when user has multiple ratings' do
      before do
        user.ratings.create!(rater: User.second, rating: 1, rated_at: Time.current)
      end

      it 'returns average rating' do
        user.ratings.create!(rater: User.second, rating: 4, rated_at: Time.current)
        expect(user.rating).to eq(2.5)
      end
    end
  end
end
