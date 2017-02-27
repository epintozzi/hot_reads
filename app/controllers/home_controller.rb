class HomeController < ApplicationController

  def index
    @links = Link.where('created_at > ?', 24.hours.ago).group(:url).count.sort_by{ |k, v| v }.reverse.to_h
  end

  def create
    @link = Link.new(link_params)
    if @link.save
      flash[:success] = "yay"
    else
      flash[:alert] = "boo"
    end
  end


  private

  def link_params
    params.require(:link).permit(:id, :url, :title, :read_count)
  end

end
