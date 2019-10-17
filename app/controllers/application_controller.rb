class ApplicationController < ActionController::Base

  # noindexを貼りたいページで実行
  def set_noindex
    @noindex = true
  end

end
