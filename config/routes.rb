Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "venues#index"
  # Routes for the Song resource:

  # CREATE
  get("/songs/new", { :controller => "songs", :action => "new_form" })
  post("/create_song", { :controller => "songs", :action => "create_row" })

  # READ
  get("/songs", { :controller => "songs", :action => "index" })
  get("/songs/:id_to_display", { :controller => "songs", :action => "show" })

  # UPDATE
  get("/songs/:prefill_with_id/edit", { :controller => "songs", :action => "edit_form" })
  post("/update_song/:id_to_modify", { :controller => "songs", :action => "update_row" })

  # DELETE
  get("/delete_song/:id_to_remove", { :controller => "songs", :action => "destroy_row" })
  get("/delete_song_from_user/:id_to_remove", { :controller => "songs", :action => "destroy_row_from_user" })

  #------------------------------

  # Routes for the Service resource:

  # CREATE
  get("/services/new", { :controller => "services", :action => "new_form" })
  post("/create_service", { :controller => "services", :action => "create_row" })

  # READ
  get("/services", { :controller => "services", :action => "index" })
  get("/services/:id_to_display", { :controller => "services", :action => "show" })

  # UPDATE
  get("/services/:prefill_with_id/edit", { :controller => "services", :action => "edit_form" })
  post("/update_service/:id_to_modify", { :controller => "services", :action => "update_row" })

  # DELETE
  get("/delete_service/:id_to_remove", { :controller => "services", :action => "destroy_row" })
  get("/delete_service_from_theme/:id_to_remove", { :controller => "services", :action => "destroy_row_from_theme" })
  get("/delete_service_from_venue/:id_to_remove", { :controller => "services", :action => "destroy_row_from_venue" })
  get("/delete_service_from_user/:id_to_remove", { :controller => "services", :action => "destroy_row_from_user" })

  #------------------------------

  # Routes for the Appointee resource:

  # CREATE
  get("/appointees/new", { :controller => "appointees", :action => "new_form" })
  post("/create_appointee", { :controller => "appointees", :action => "create_row" })

  # READ
  get("/appointees", { :controller => "appointees", :action => "index" })
  get("/appointees/:id_to_display", { :controller => "appointees", :action => "show" })

  # UPDATE
  get("/appointees/:prefill_with_id/edit", { :controller => "appointees", :action => "edit_form" })
  post("/update_appointee/:id_to_modify", { :controller => "appointees", :action => "update_row" })

  # DELETE
  get("/delete_appointee/:id_to_remove", { :controller => "appointees", :action => "destroy_row" })

  #------------------------------

  # Routes for the Video resource:

  # CREATE
  get("/videos/new", { :controller => "videos", :action => "new_form" })
  post("/create_video", { :controller => "videos", :action => "create_row" })

  # READ
  get("/videos", { :controller => "videos", :action => "index" })
  get("/videos/:id_to_display", { :controller => "videos", :action => "show" })

  # UPDATE
  get("/videos/:prefill_with_id/edit", { :controller => "videos", :action => "edit_form" })
  post("/update_video/:id_to_modify", { :controller => "videos", :action => "update_row" })

  # DELETE
  get("/delete_video/:id_to_remove", { :controller => "videos", :action => "destroy_row" })
  get("/delete_video_from_user/:id_to_remove", { :controller => "videos", :action => "destroy_row_from_user" })

  #------------------------------

  # Routes for the Message resource:

  # CREATE
  get("/messages/new", { :controller => "messages", :action => "new_form" })
  post("/create_message", { :controller => "messages", :action => "create_row" })

  # READ
  get("/messages", { :controller => "messages", :action => "index" })
  get("/messages/:id_to_display", { :controller => "messages", :action => "show" })

  # UPDATE
  get("/messages/:prefill_with_id/edit", { :controller => "messages", :action => "edit_form" })
  post("/update_message/:id_to_modify", { :controller => "messages", :action => "update_row" })

  # DELETE
  get("/delete_message/:id_to_remove", { :controller => "messages", :action => "destroy_row" })
  get("/delete_message_from_user/:id_to_remove", { :controller => "messages", :action => "destroy_row_from_user" })

  #------------------------------

  # Routes for the Gift resource:

  # CREATE
  get("/gifts/new", { :controller => "gifts", :action => "new_form" })
  post("/create_gift", { :controller => "gifts", :action => "create_row" })

  # READ
  get("/gifts", { :controller => "gifts", :action => "index" })
  get("/gifts/:id_to_display", { :controller => "gifts", :action => "show" })

  # UPDATE
  get("/gifts/:prefill_with_id/edit", { :controller => "gifts", :action => "edit_form" })
  post("/update_gift/:id_to_modify", { :controller => "gifts", :action => "update_row" })

  # DELETE
  get("/delete_gift/:id_to_remove", { :controller => "gifts", :action => "destroy_row" })
  get("/delete_gift_from_user/:id_to_remove", { :controller => "gifts", :action => "destroy_row_from_user" })

  #------------------------------

  # Routes for the Obituary resource:

  # CREATE
  get("/obituaries/new", { :controller => "obituaries", :action => "new_form" })
  post("/create_obituary", { :controller => "obituaries", :action => "create_row" })

  # READ
  get("/obituaries", { :controller => "obituaries", :action => "index" })
  get("/obituaries/:id_to_display", { :controller => "obituaries", :action => "show" })

  # UPDATE
  get("/obituaries/:prefill_with_id/edit", { :controller => "obituaries", :action => "edit_form" })
  post("/update_obituary/:id_to_modify", { :controller => "obituaries", :action => "update_row" })

  # DELETE
  get("/delete_obituary/:id_to_remove", { :controller => "obituaries", :action => "destroy_row" })
  get("/delete_obituary_from_user/:id_to_remove", { :controller => "obituaries", :action => "destroy_row_from_user" })

  #------------------------------

  # Routes for the Discretion resource:

  # CREATE
  get("/discretions/new", { :controller => "discretions", :action => "new_form" })
  post("/create_discretion", { :controller => "discretions", :action => "create_row" })

  # READ
  get("/discretions", { :controller => "discretions", :action => "index" })
  get("/discretions/:id_to_display", { :controller => "discretions", :action => "show" })

  # UPDATE
  get("/discretions/:prefill_with_id/edit", { :controller => "discretions", :action => "edit_form" })
  post("/update_discretion/:id_to_modify", { :controller => "discretions", :action => "update_row" })

  # DELETE
  get("/delete_discretion/:id_to_remove", { :controller => "discretions", :action => "destroy_row" })
  get("/delete_discretion_from_apppointee/:id_to_remove", { :controller => "discretions", :action => "destroy_row_from_apppointee" })
  get("/delete_discretion_from_user/:id_to_remove", { :controller => "discretions", :action => "destroy_row_from_user" })

  #------------------------------

  # Routes for the Connection resource:

  # CREATE
  get("/connections/new", { :controller => "connections", :action => "new_form" })
  post("/create_connection", { :controller => "connections", :action => "create_row" })

  # READ
  get("/connections", { :controller => "connections", :action => "index" })
  get("/connections/:id_to_display", { :controller => "connections", :action => "show" })

  # UPDATE
  get("/connections/:prefill_with_id/edit", { :controller => "connections", :action => "edit_form" })
  post("/update_connection/:id_to_modify", { :controller => "connections", :action => "update_row" })

  # DELETE
  get("/delete_connection/:id_to_remove", { :controller => "connections", :action => "destroy_row" })
  get("/delete_connection_from_bfriend/:id_to_remove", { :controller => "connections", :action => "destroy_row_from_bfriend" })
  get("/delete_connection_from_afriend/:id_to_remove", { :controller => "connections", :action => "destroy_row_from_afriend" })
  get("/delete_connection_from_user/:id_to_remove", { :controller => "connections", :action => "destroy_row_from_user" })

  #------------------------------

  # Routes for the Friend resource:

  # CREATE
  get("/friends/new", { :controller => "friends", :action => "new_form" })
  post("/create_friend", { :controller => "friends", :action => "create_row" })

  # READ
  get("/friends", { :controller => "friends", :action => "index" })
  get("/friends/:id_to_display", { :controller => "friends", :action => "show" })

  # UPDATE
  get("/friends/:prefill_with_id/edit", { :controller => "friends", :action => "edit_form" })
  post("/update_friend/:id_to_modify", { :controller => "friends", :action => "update_row" })

  # DELETE
  get("/delete_friend/:id_to_remove", { :controller => "friends", :action => "destroy_row" })
  get("/delete_friend_from_user/:id_to_remove", { :controller => "friends", :action => "destroy_row_from_user" })

  #------------------------------

  # Routes for the Executioner resource:

  # CREATE
  get("/executioners/new", { :controller => "executioners", :action => "new_form" })
  post("/create_executioner", { :controller => "executioners", :action => "create_row" })

  # READ
  get("/executioners", { :controller => "executioners", :action => "index" })
  get("/executioners/:id_to_display", { :controller => "executioners", :action => "show" })

  # UPDATE
  get("/executioners/:prefill_with_id/edit", { :controller => "executioners", :action => "edit_form" })
  post("/update_executioner/:id_to_modify", { :controller => "executioners", :action => "update_row" })

  # DELETE
  get("/delete_executioner/:id_to_remove", { :controller => "executioners", :action => "destroy_row" })
  get("/delete_executioner_from_user/:id_to_remove", { :controller => "executioners", :action => "destroy_row_from_user" })

  #------------------------------

  # Routes for the Photo resource:

  # CREATE
  get("/photos/new", { :controller => "photos", :action => "new_form" })
  post("/create_photo", { :controller => "photos", :action => "create_row" })

  # READ
  get("/photos", { :controller => "photos", :action => "index" })
  get("/photos/:id_to_display", { :controller => "photos", :action => "show" })

  # UPDATE
  get("/photos/:prefill_with_id/edit", { :controller => "photos", :action => "edit_form" })
  post("/update_photo/:id_to_modify", { :controller => "photos", :action => "update_row" })

  # DELETE
  get("/delete_photo/:id_to_remove", { :controller => "photos", :action => "destroy_row" })
  get("/delete_photo_from_user/:id_to_remove", { :controller => "photos", :action => "destroy_row_from_user" })

  #------------------------------

  # Routes for the Expression resource:

  # CREATE
  get("/expressions/new", { :controller => "expressions", :action => "new_form" })
  post("/create_expression", { :controller => "expressions", :action => "create_row" })

  # READ
  get("/expressions", { :controller => "expressions", :action => "index" })
  get("/expressions/:id_to_display", { :controller => "expressions", :action => "show" })

  # UPDATE
  get("/expressions/:prefill_with_id/edit", { :controller => "expressions", :action => "edit_form" })
  post("/update_expression/:id_to_modify", { :controller => "expressions", :action => "update_row" })

  # DELETE
  get("/delete_expression/:id_to_remove", { :controller => "expressions", :action => "destroy_row" })
  get("/delete_expression_from_user/:id_to_remove", { :controller => "expressions", :action => "destroy_row_from_user" })

  #------------------------------

  # Routes for the Role resource:

  # CREATE
  get("/roles/new", { :controller => "roles", :action => "new_form" })
  post("/create_role", { :controller => "roles", :action => "create_row" })

  # READ
  get("/roles", { :controller => "roles", :action => "index" })
  get("/roles/:id_to_display", { :controller => "roles", :action => "show" })

  # UPDATE
  get("/roles/:prefill_with_id/edit", { :controller => "roles", :action => "edit_form" })
  post("/update_role/:id_to_modify", { :controller => "roles", :action => "update_row" })

  # DELETE
  get("/delete_role/:id_to_remove", { :controller => "roles", :action => "destroy_row" })
  get("/delete_role_from_guest/:id_to_remove", { :controller => "roles", :action => "destroy_row_from_guest" })

  #------------------------------

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
  get("/delete_speaker_from_guest/:id_to_remove", { :controller => "speakers", :action => "destroy_row_from_guest" })

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
  get("/delete_guest_from_user/:id_to_remove", { :controller => "guests", :action => "destroy_row_from_user" })

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
  get("/delete_remain_from_user/:id_to_remove", { :controller => "remains", :action => "destroy_row_from_user" })

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
