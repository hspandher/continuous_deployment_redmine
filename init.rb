Redmine::Plugin.register :continuous_deployment do
  name 'Continuous Deployment plugin'
  author 'HS Pandher'
  description 'A plugin to integrate redmine with Continuous Integration Server'
  version '0.0.1'
  url 'https://github.com/hspandher/continuous_deployment_redmine'
  author_url 'https://github.com/hspandher/'
  require_dependency 'plugins/redmine_knowledgebase/lib/issue_patch'
end
