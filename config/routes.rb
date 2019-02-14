Rails.application.routes.draw do
  
  get("/", {:controller => "pictures", :action => "index"})
  
  get("/photos", {:controller => "pictures", :action => "index"})

  get("/photos/new", {:controller => "pictures", :action => "new_form"})

  get("/create_photo", {:controller => "pictures", :action => "create_row"})

  get("/photos/:the_id", {:controller => "pictures", :action => "show_detail"})

  get("/photos/:an_id/edit", {:controller => "pictures", :action => "edit_form"})

  get("/update_photo/:some_id", {:controller => "pictures", :action => "update_row"})

  get("/delete_photo/:toast_id", {:controller => "pictures", :action => "destroy_row"})
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
