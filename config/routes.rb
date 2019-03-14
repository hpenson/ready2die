Rails.application.routes.draw do
  # Routes for the Guest resource:

  # CREATE
  get("/guests/new", { :controller => "guests", :action => "new_form" })
  post("/create_guest", { :controller => "guests", :action => "create_row" })

  # READ
  get("/guests", { :controller => "guests", :action => "index" })
  get("/guests/:id_to_display", { :controller => "guests", :action => "show" })

  # UPDATE
  get("/guests/:prefill_with_id/edit", { :controller => "guests", :action => "edit_form" })
  post("/update_guest/:id_to_modify", { :controller => "guests", :action => "update_row" })

  # DELETE
  get("/delete_guest/:id_to_remove", { :controller => "guests", :action => "destroy_row" })

  #------------------------------

  # Routes for the Theme resource:

  # CREATE
  get("/themes/new", { :controller => "themes", :action => "new_form" })
  post("/create_theme", { :controller => "themes", :action => "create_row" })

  # READ
  get("/themes", { :controller => "themes", :action => "index" })
  get("/themes/:id_to_display", { :controller => "themes", :action => "show" })

  # UPDATE
  get("/themes/:prefill_with_id/edit", { :controller => "themes", :action => "edit_form" })
  post("/update_theme/:id_to_modify", { :controller => "themes", :action => "update_row" })

  # DELETE
  get("/delete_theme/:id_to_remove", { :controller => "themes", :action => "destroy_row" })

  #------------------------------

  # Routes for the Remain resource:

  # CREATE
  get("/remains/new", { :controller => "remains", :action => "new_form" })
  post("/create_remain", { :controller => "remains", :action => "create_row" })

  # READ
  get("/remains", { :controller => "remains", :action => "index" })
  get("/remains/:id_to_display", { :controller => "remains", :action => "show" })

  # UPDATE
  get("/remains/:prefill_with_id/edit", { :controller => "remains", :action => "edit_form" })
  post("/update_remain/:id_to_modify", { :controller => "remains", :action => "update_row" })

  # DELETE
  get("/delete_remain/:id_to_remove", { :controller => "remains", :action => "destroy_row" })

  #------------------------------

  # Routes for the Venue resource:

  # CREATE
  get("/venues/new", { :controller => "venues", :action => "new_form" })
  post("/create_venue", { :controller => "venues", :action => "create_row" })

  # READ
  get("/venues", { :controller => "venues", :action => "index" })
  get("/venues/:id_to_display", { :controller => "venues", :action => "show" })

  # UPDATE
  get("/venues/:prefill_with_id/edit", { :controller => "venues", :action => "edit_form" })
  post("/update_venue/:id_to_modify", { :controller => "venues", :action => "update_row" })

  # DELETE
  get("/delete_venue/:id_to_remove", { :controller => "venues", :action => "destroy_row" })

  #------------------------------

  devise_for :users
  # Routes for the User resource:

  # READ
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:id_to_display", { :controller => "users", :action => "show" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
