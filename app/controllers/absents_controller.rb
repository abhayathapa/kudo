class AbsentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @absents = Absent.all.order('created_at DESC')
  end
end
