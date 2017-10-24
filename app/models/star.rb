# == Schema Information
#
# Table name: stars
#
#  id         :integer          not null, primary key
#  post_id    :integer          not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_stars_on_post_id              (post_id)
#  index_stars_on_post_id_and_user_id  (post_id,user_id) UNIQUE
#  index_stars_on_user_id              (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (post_id => posts.id)
#  fk_rails_...  (user_id => users.id)
#

class Star < ApplicationRecord
  belongs_to :post, counter_cache: true
  belongs_to :user

  validates :user, uniqueness: { scope: :post }
end
