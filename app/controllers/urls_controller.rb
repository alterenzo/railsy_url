class UrlsController < ApplicationController
  def new
  end

  def show
    url = Url.find(params[:id])
    redirect_to url.original_url
  end

  def create
  end
end
