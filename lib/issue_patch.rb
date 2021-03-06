require_dependency 'issue'
require_dependency 'issue_status'
require_dependency 'project'

require 'net/http'

class String

  def strip_non_alpabets
    sub(/[^\w]/, '')
  end

end

class Project

  def supports_continuous_deployment?
    Setting.plugin_continuous_deployment[:target_project_names].include?(name)
  end

end

module IssuePatch

  def status_being_changed?
    status.id != status_was.id
  end

  def post_update
    if project.supports_continuous_deployment? and status_being_changed?
      project_settings = Setting.plugin_continuous_deployment[project.name.to_sym]

      uri = URI(project_settings[:deployment_server_url])

      uri.query = URI.encode_www_form(
        attributes.merge(extra_issue_attributes).merge(assignee_params).merge(project_settings[:default_request_params])
      )

      Net::HTTP.post_form(uri, {})
    end
  end

  def assignee_params
    original_assignee = assigned_to_was || assigned_to
    {
      initial_assignee_id: (original_assignee.id if original_assignee),
      initial_assignee_email: (original_assignee.mail if original_assignee),
      final_assignee_id: (assigned_to.id if assigned_to),
      final_assignee_email: (assigned_to.mail if assigned_to)
    }
  end

  def extra_issue_attributes
    {
      issue_id: id,
      initial_status: status_was.name.strip_non_alpabets.downcase,
      final_status: status.name.strip_non_alpabets.downcase,
    }
  end
end

class Issue

  include IssuePatch

  after_update :post_update

end
