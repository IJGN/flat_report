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
  has_many :users

  validates :name, presence: true, uniqueness: true
  validates :access_token, uniqueness: true
end
