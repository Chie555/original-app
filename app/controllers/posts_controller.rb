class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]


  def index
  end
end
