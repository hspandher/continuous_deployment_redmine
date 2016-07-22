Redmine::Plugin.register :continuous_deployment do
  name 'Continuous Deployment plugin'
  author 'HS Pandher'
  description 'A plugin to integrate redmine with Continuous Integration Server'
  version '0.0.1'
  url 'https://github.com/hspandher/continuous_deployment_redmine'
  author_url 'https://github.com/hspandher/'
  require_dependency 'plugins/continuous_deployment/lib/issue_patch'

  # Example Settings:- Create these in rails console for your projects
  # settings default: {
  #     target_project_names: ['candidate'],
  #     candidate: {
  #       deployment_server_url: "http://hspandher:67ce59d90c9c3e3b47cd83d9b80684a0@localhost:8080/job/quality_assurance/buildWithParameters",
  #       default_request_params: {
  #         token: 'aHNwYW5kaGVy'
  #       }
  #     }
  #   },
  #   partial: 'settings/continuous_deployment_settings'
end
