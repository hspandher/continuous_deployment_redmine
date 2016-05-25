Redmine::Plugin.register :continuous_deployment do
  name 'Continuous Deployment plugin'
  author 'HS Pandher'
  description 'A plugin to integrate redmine with Continuous Integration Server'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'https://github.com/hspandher/'
  require_dependency 'plugins/redmine_knowledgebase/lib/issue_patch'
end
