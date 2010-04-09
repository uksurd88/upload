# This a controller file for upload controller containing different actions or methods
class UploadController < ApplicationController
  def get
    @picture=Picture.new
  end
  def save
    @picture=Picture.new(params[:picture])
      if @picture.save
        redirect_to(:action=>'show', :id=>@picture.id)
      else
      # render : Renders the content that will be returned to the browser as the response body. 
        render(:action=>'get')
      end
  end
   def show
    @picture = Picture.find(params[:id])
  end
  ## It is calling methods from model
  def picture
    @picture = Picture.find(params[:id])
    send_data(@picture.data,
              :filename => @picture.name,
              :type => @picture.content_type,
              :disposition => "inline")
  end
end
