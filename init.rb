Redmine::Plugin.register :continuous_deployment do
  name 'Continuous Deployment plugin'
  author 'HS Pandher'
  description 'A plugin to integrate redmine with Continuous Integration Server'
  version '0.0.1'
  url 'https://github.com/hspandher/continuous_deployment_redmine'
  author_url 'https://github.com/hspandher/'
  require_dependency 'plugins/continuous_deployment/lib/issue_patch'

  settings default: {
    target_project_names: ['candidate'],
    candidate: {
      deployment_server_url: "http://localhost:8001/redmine_response/",
      default_request_params: {
        auth_token: '343424324324'
      }
    }
  }
end
