# == Schema Information
#
# Table name: teams
#
#  id           :integer          not null, primary key
#  name         :string           not null
#  access_token :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_teams_on_access_token  (access_token) UNIQUE
#  index_teams_on_name          (name) UNIQUE
#

class Team < ApplicationRecord
  has_many :projects
  has_many :users

  validates :name, presence: true, uniqueness: true
  validates :access_token, uniqueness: true

  def posts
    Post.includes(:user).where(user_id: users.ids)
  end

  def post_activities_rate
    max = users.size * number_of_days_created
    (posts.size.to_f / max * 100).round(1)
  end

  def most_starred_post
    max = posts.maximum(:stars_count)
    posts.find_by('stars_count >= ?', max)
  end

  private

  def number_of_days_created
    (Date.current - created_at.to_date).to_i
  end
end
