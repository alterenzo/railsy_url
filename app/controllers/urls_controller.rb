class UrlsController < ApplicationController
  def new
  end

  def show
    url = Url.find(params[:id])
    redirect_to url.original_url
  rescue ActiveRecord::RecordNotFound
    redirect_to new_url_path
  end

  def create
    Url.create(original_url: params[:url])
    redirect_to new_url_path
  end
end
