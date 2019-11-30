class CommonController < ApplicationController
  before_action :set_noindex, only: [:tos, :pp]

  layout 'application'

  def index
  end

  def tos
  end

  def pp
  end

end
