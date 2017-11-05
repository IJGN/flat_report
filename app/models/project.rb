# == Schema Information
#
# Table name: projects
#
#  id             :integer          not null, primary key
#  team_id        :integer          not null
#  client_name    :string           not null
#  project_name   :string           not null
#  status         :integer          default(0), not null
#  description    :text
#  scheduled_time :integer
#  actual_time    :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_projects_on_team_id  (team_id)
#
# Foreign Keys
#
#  fk_rails_...  (team_id => teams.id)
#

class Project < ApplicationRecord
  belongs_to :team
  has_many :post_details

  validates :client_name, presence: true
  validates :project_name, presence: true
  validates :status, presence: true

  def name
    client_name + ' / ' + project_name
  end

  def described_users
    post_details.map{ |d| d.post.user }.uniq
  end
end
