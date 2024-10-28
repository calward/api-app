require 'rails_helper'

RSpec.describe Rating do
  let(:user) { User.first }

  describe 'create_four_star_post' do
    context 'when user passes 4 stars' do
      it 'creates a 4 star post' do
        expect { user.ratings.create!(rater: User.second, rating: 5, rated_at: Time.current) }.to change {
                                                                                                    Post.where.not(four_starred_at: nil).count
                                                                                                  }.by(1)
      end
    end

    context 'when user gets a 4 star rating but overall rating is under 4' do
      before do
        user.ratings.create!(rater: User.second, rating: 1, rated_at: Time.current)
      end

      it 'does not create 4 star post' do
        expect { user.ratings.create!(rater: User.second, rating: 4, rated_at: Time.current) }.to change {
                                                                                                    Post.where.not(four_starred_at: nil).count
                                                                                                  }.by(0)
      end
    end
  end
end
