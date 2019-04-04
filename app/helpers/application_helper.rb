module ApplicationHelper
  def current_year
    DateTime.current.year
  end

  def github_link(author, repo)
    link_to("#{author}/#{repo}", "https://github.com/#{author}/#{repo}", target: '_blank')
  end

  def flash_alert
    tag.p(class: 'flash alert') { flash[:alert] } if flash[:alert]
  end
end
