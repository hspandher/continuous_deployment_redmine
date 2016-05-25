require_dependency 'issue'
require_dependency 'issue_status'

module IssueStatusPatch

  def resolved?
    name == 'Resolved'
  end

end

module IssuePatch

  def being_resolved?
    status.present? && status.resolved? && !status_was.resolved?
  end

  def post_update
    if project.name == 'candidate' and being_resolved?
      uri = URI("http://localhost:8001/redmine_response/")

      request = Net::HTTP::Get.new(uri)

      response = Net::HTTP.start(uri.hostname, uri.port) {|http| http.request(request)}
    end
  end
end


class IssueStatus

  include IssueStatusPatch

end

class Issue

  include IssuePatch

  after_save :post_update

end
