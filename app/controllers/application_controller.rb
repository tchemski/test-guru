class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    if resource.admin?
      admin_tests_path
    else
      tests_path
    end
  end
end
