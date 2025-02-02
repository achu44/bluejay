module ApplicationHelper

  def set_title(dynamic_title)
    content_for(:title) { dynamic_title } 
  end

  def resource_name
  	:user
  end

  def resource
  	@resource ||= User.new
  end

  def devise_mapping
  	@devise_mapping ||= Devise.mappings[:user]
  end

end
