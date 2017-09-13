class SummariesController < ApplicationController
  GITHUB_API_URL="https://api.github.com"

  def search
    redirect_to summary_path(params[:q])
  end

  def show
    LoadingPageJob.perform_later(@summary)
    @summary = Summary.find_or_create_by(username: params[:username])
    if @summary.user_response == nil
      @summary.get_user
      @summary.get_repos
      @summary.save
    end
    if @summary.repos_response == nil
      @sumamry.get_repos
      @summary.save
    end
    @username = @summary.username
    @user = @summary.user
    @repos = @summary.repos
    @languages = @summary.languages
  end
end
