# == Schema Information
#
# Table name: posts
#
#  id                 :integer          not null, primary key
#  user_id            :integer          not null
#  published_at       :datetime         not null
#  unknown_content    :text
#  impression_content :text
#  status             :integer          default("draft"), not null
#  stars_count        :integer          default(0), not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
# Indexes
#
#  index_posts_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

class Post < ApplicationRecord
  has_many :post_details, inverse_of: :post, dependent: :destroy
  has_many :stars, dependent: :destroy
  accepts_nested_attributes_for :post_details, allow_destroy: true, reject_if: :all_blank

  belongs_to :user

  enum status: %i[draft closed published]

  validates :published_at, presence: true
  validates :status, presence: true
  validates :stars_count, presence: true
end
