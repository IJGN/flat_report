json.array!(@projects) do |project|
  json.extract! post, :id, :client_name, :project_name, :status, :description, :scheduled_time, :actual_time, :created_at, :updated_at
  json.url team_projects_url(project, format: :json)
end
