class ApplicationController < ActionController::Base

  # noindexを貼りたいページで実行する。"before_action :set_noindex"
  def set_noindex
    @noindex = true
  end

  # 500エラーのときにSlackに通知する（productionのみ）
  if Rails.env.production?
    # rescue_from Exception, with: :rescue_500
  end

  def rescue_500(exception)
    Slack500.post(request, exception)
    render 'error/500', status: :internal_server_error, layout: 'application'
  end

end
