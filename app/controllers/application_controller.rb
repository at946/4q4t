class ApplicationController < ActionController::Base

  # noindexを貼りたいページで実行する。"before_action :set_noindex"
  def set_noindex
    @noindex = true
  end

end
