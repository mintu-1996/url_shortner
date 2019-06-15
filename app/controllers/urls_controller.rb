class UrlsController < ApplicationController
  before_action :find_url, only: [:show]

  def show
    redirect_to @url.sanitized_url
  end

  def create
    @url = Url.new(url_params)
    @url.sanitize
    if @url.new_url?
      if @url.save
        render :status => 200, :json => {:short_url => @url.short_url} 
      else
        render :status => 412, :json => {:message => @url.errors.message}
      end
    else
      render :status => 200, :json => {:short_url => @url.find_duplicate.short_url}
    end
  end

  private

  def find_url
    @url = Url.find_by_short_url(params[:id])
    unless @url
      render :status => 404, :json => {:message => "Url not found"}
      return
    end
  end

  def url_params
    params.require(:url).permit(:original_url)
  end
end
