# Team
Team.destroy_all
Team.create!(
  name: 'fake_name',
  access_token: 'fake_access_token'
)

# Post
Project.destroy_all
Project.create!(
  client_name: 'fake_client',
  project_name: 'fake_project',
  status: 0,
  description: 'fake_description',
  scheduled_time: 100,
  actual_time: 150
)

# User
User.destroy_all
team = Team.first
team.users.create!(
  email: 'admin@test.com',
  password: 'password',
  password_confirmation: 'password'
)

# Post
Post.destroy_all
user = User.first
user.posts.create!(
  published_at: Date.current - 1.day,
  unknown_content: 'fake_unknown_content',
  impression_content: 'fake_impression_content',
  status: 0,
  stars_count: 0
)

user.posts.create!(
  published_at: Date.current,
  unknown_content: 'fake_unknown_content2',
  impression_content: 'fake_impression_content2',
  status: 0,
  stars_count: 0
)

# PostDetail
post = Post.first
post.post_details.create!(
  project_id: Project.first.id,
  spent_time: 1,
  content: 'fake_content'
)

post = Post.second
post.post_details.create!(
  project_id: Project.first.id,
  spent_time: 2,
  content: 'fake_content2'
)

# Star
user = User.first
user.stars.create!(
  post_id: user.posts.first.id
)
