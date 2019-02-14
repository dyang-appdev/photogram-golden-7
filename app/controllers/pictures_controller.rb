class PicturesController < ApplicationController
  def index
    @photo_list = Photo.all.order({ :created_at => :desc })
    
    render("pic_templates/all_photos.html.erb")
  end
  
  def new_form
    render("pic_templates/blank_form.html.erb")
  end
  
  def create_row
    p = Photo.new
    p.source = params.fetch("the_source")
    p.caption = params.fetch("the_caption")
    
    p.save
    # render("pic_templates/create_row.html.erb")
    redirect_to("/photos")
  end
  
  def show_detail
    the_id = params.fetch("the_id")

    @the_photo = Photo.find(the_id)

    # the_photo = Photo.find(the_id)
    # @photo_source = the_photo.source
    # @photo_caption = the_photo.caption
    
    render("pic_templates/details.html.erb")
  end
  
  def edit_form
    the_id = params.fetch("an_id")
    @picture = Photo.find(the_id)
    
    render("pic_templates/edit_form.html.erb")
  end
  
  def update_row
    the_id = params.fetch("some_id")
    p = Photo.find(the_id)
    
    p.source = params.fetch("the_source")
    p.caption = params.fetch("the_caption")
    
    p.save
    
    redirect_to("/photos/" + the_id)
  end
  
  def destroy_row
    the_id = params.fetch("toast_id")
    the_photo = Photo.find(the_id)
    
    the_photo.destroy
    
    redirect_to("/photos")
  end
end