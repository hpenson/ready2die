Rails.application.routes.draw do
  # Routes for the Mc resource:

  # CREATE
  get("/mcs/new", { :controller => "mcs", :action => "new_form" })
  post("/create_mc", { :controller => "mcs", :action => "create_row" })

  # READ
  get("/mcs", { :controller => "mcs", :action => "index" })
  get("/mcs/:id_to_display", { :controller => "mcs", :action => "show" })

  # UPDATE
  get("/mcs/:prefill_with_id/edit", { :controller => "mcs", :action => "edit_form" })
  post("/update_mc/:id_to_modify", { :controller => "mcs", :action => "update_row" })

  # DELETE
  get("/delete_mc/:id_to_remove", { :controller => "mcs", :action => "destroy_row" })

  #------------------------------

  # Routes for the Speaker resource:

  # CREATE
  get("/speakers/new", { :controller => "speakers", :action => "new_form" })
  post("/create_speaker", { :controller => "speakers", :action => "create_row" })

  # READ
  get("/speakers", { :controller => "speakers", :action => "index" })
  get("/speakers/:id_to_display", { :controller => "speakers", :action => "show" })

  # UPDATE
  get("/speakers/:prefill_with_id/edit", { :controller => "speakers", :action => "edit_form" })
  post("/update_speaker/:id_to_modify", { :controller => "speakers", :action => "update_row" })

  # DELETE
  get("/delete_speaker/:id_to_remove", { :controller => "speakers", :action => "destroy_row" })

  #------------------------------

  # Routes for the Pall bearer resource:

  # CREATE
  get("/pall_bearers/new", { :controller => "pall_bearers", :action => "new_form" })
  post("/create_pall_bearer", { :controller => "pall_bearers", :action => "create_row" })

  # READ
  get("/pall_bearers", { :controller => "pall_bearers", :action => "index" })
  get("/pall_bearers/:id_to_display", { :controller => "pall_bearers", :action => "show" })

  # UPDATE
  get("/pall_bearers/:prefill_with_id/edit", { :controller => "pall_bearers", :action => "edit_form" })
  post("/update_pall_bearer/:id_to_modify", { :controller => "pall_bearers", :action => "update_row" })

  # DELETE
  get("/delete_pall_bearer/:id_to_remove", { :controller => "pall_bearers", :action => "destroy_row" })

  #------------------------------

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
