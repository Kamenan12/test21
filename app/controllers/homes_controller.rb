class HomesController < ApplicationController
  before_action :authenticate_user!
  def index
    @themes = Theme.all
    @gbangbans = Gbangban.all.includes(:commentaires)
  end

  def show
  end
end
