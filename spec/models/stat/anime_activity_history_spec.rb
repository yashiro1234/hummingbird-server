# rubocop:disable Metrics/LineLength
# == Schema Information
#
# Table name: stats
#
#  id         :integer          not null, primary key
#  stats_data :jsonb            not null
#  type       :string           not null, indexed => [user_id]
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer          not null, indexed => [type], indexed
#
# Indexes
#
#  index_stats_on_type_and_user_id  (type,user_id) UNIQUE
#  index_stats_on_user_id           (user_id)
#
# Foreign Keys
#
#  fk_rails_9e94901167  (user_id => users.id)
#
# rubocop:enable Metrics/LineLength

# require 'rails_helper'
#
# RSpec.describe Stat::AnimeActivityHistory do
#   let(:user) { create(:user) }
#   let(:anime) { create(:anime) }
#   let(:anime1) { create(:anime) }
#   let(:le) { create(:library_entry, user: user, anime: anime) }
#   let(:le1) { create(:library_entry, user: user, anime: anime1) }
#   let!(:library_event) { create(:library_event, :with_anime, user: user, library_entry: le) }
#   let!(:library_event1) { create(:library_event, :with_anime, user: user, library_entry: le1) }
#
#   before do
#     Stat::AnimeActivityHistory.increment(user, library_event)
#     Stat::AnimeActivityHistory.increment(user, library_event1)
#     user.stats.find_or_initialize_by(type: 'Stat::AnimeActivityHistory').recalculate!
#   end
#
#   describe '#recalculate!' do
#     it 'should add all library entries related to user' do
#       record = Stat.find_by(user: user, type: 'Stat::AnimeActivityHistory')
#
#       expect(record.stats_data['total']).to eq(2)
#       expect(record.stats_data['activity'].count).to eq(2)
#     end
#   end
#
#   describe '#increment' do
#     before do
#       anime2 = create(:anime)
#       le2 = create(:library_entry, user: user, anime: anime2)
#       library_event2 = create(:library_event, :with_anime, user: user, library_entry: le2)
#       Stat::AnimeActivityHistory.increment(user, library_event2)
#     end
#     it 'should update all stats_data' do
#       record = Stat.find_by(user: user, type: 'Stat::AnimeActivityHistory')
#
#       expect(record.stats_data['total']).to eq(3)
#       expect(record.stats_data['activity'].count).to eq(3)
#     end
#   end
#
#   describe '#decrement' do
#     before do
#       Stat::AnimeActivityHistory.decrement(user, le)
#     end
#     it 'should remove all library events from stats_data' do
#       record = Stat.find_by(user: user, type: 'Stat::AnimeActivityHistory')
#
#       expect(record.stats_data['total']).to eq(1)
#       expect(record.stats_data['activity'].count).to eq(1)
#     end
#   end
# end
