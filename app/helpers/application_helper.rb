# define here global helpers only, use decorator for specific model resources
module ApplicationHelper
  def flash_class(level)
    case level.to_sym
    when :notice
      then "alert alert-info"
    when :success
      then "alert alert-success"
    when :alert
      then "alert alert-danger"
    when :warning
      then "alert alert-warning"
    end
  end
end
