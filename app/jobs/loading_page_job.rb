class LoadingPageJob < ApplicationJob
  queue_as :default

  def perform(summary)
    summary.get_user
    summary.get_repos
    summary.save
    @username = summary.username
    @user = summary.user
    @repos = summary.repos
    @languages = summary.languages
    # Do something later
  end
end
