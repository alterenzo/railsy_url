class UrlsController < ApplicationController
  def new
    @url = Url.new
  end

  def show
    url = Url.find(params[:id])
    redirect_to url.original_url
  rescue ActiveRecord::RecordNotFound
    redirect_to new_url_path
  end

  def create
    url = Url.new(original_url: params[:url][:original_url])
    url.save ? flash.notice = "Short url created: #{url_path(url)}" : flash.alert = "Invalid url"
    redirect_to new_url_path
  end
end
