module ApplicationHelper
  def now_year
    DateTime.now.year
  end

  def github_url(author, repo)
    "https://github.com/#{author}/#{repo}"
  end
end
