# == Schema Information
#
# Table name: post_details
#
#  id         :integer          not null, primary key
#  post_id    :integer          not null
#  project_id :integer          not null
#  spent_time :integer          not null
#  content    :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_post_details_on_post_id     (post_id)
#  index_post_details_on_project_id  (project_id)
#
# Foreign Keys
#
#  fk_rails_...  (post_id => posts.id)
#  fk_rails_...  (project_id => projects.id)
#

class PostDetail < ApplicationRecord
  belongs_to :post, inverse_of: :post_details
  belongs_to :project

  validates :spent_time, presence: true
  validates :content, presence: true
end
