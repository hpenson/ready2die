class FriendsController < ApplicationController
  before_action :current_user_must_be_friend_user, :only => [:show, :edit_form, :update_row, :destroy_row]

  def current_user_must_be_friend_user
    friend = Friend.find(params["id_to_display"] || params["prefill_with_id"] || params["id_to_modify"] || params["id_to_remove"])

    unless current_user == friend.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = current_user.friends.ransack(params[:q])
    @friends = @q.result(:distinct => true).includes(:user, :connections, :made_connections).page(params[:page]).per(10)
    @location_hash = Gmaps4rails.build_markers(@friends.where.not(:address_latitude => nil)) do |friend, marker|
      marker.lat friend.address_latitude
      marker.lng friend.address_longitude
      marker.infowindow "<h5><a href='/friends/#{friend.id}'>#{friend.first_name}</a></h5><small>#{friend.address_formatted_address}</small>"
    end

    render("friend_templates/index.html.erb")
  end

  def show
    @connection = Connection.new
    @friend = Friend.find(params.fetch("id_to_display"))

    render("friend_templates/show.html.erb")
  end

  def new_form
    @friend = Friend.new

    render("friend_templates/new_form.html.erb")
  end

  def create_row
    @friend = Friend.new

    @friend.first_name = params.fetch("first_name")
    @friend.last_name = params.fetch("last_name")
    @friend.address = params.fetch("address")
    @friend.email = params.fetch("email")
    @friend.phone = params.fetch("phone")
    @friend.image = params.fetch("image") if params.key?("image")
    @friend.user_id = params.fetch("user_id")

    if @friend.valid?
      @friend.save

      redirect_back(:fallback_location => "/friends", :notice => "Friend created successfully.")
    else
      render("friend_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @friend = Friend.find(params.fetch("prefill_with_id"))

    render("friend_templates/edit_form.html.erb")
  end

  def update_row
    @friend = Friend.find(params.fetch("id_to_modify"))

    @friend.first_name = params.fetch("first_name")
    @friend.last_name = params.fetch("last_name")
    @friend.address = params.fetch("address")
    @friend.email = params.fetch("email")
    @friend.phone = params.fetch("phone")
    @friend.image = params.fetch("image") if params.key?("image")
    

    if @friend.valid?
      @friend.save

      redirect_to("/friends/#{@friend.id}", :notice => "Friend updated successfully.")
    else
      render("friend_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_user
    @friend = Friend.find(params.fetch("id_to_remove"))

    @friend.destroy

    redirect_to("/users/#{@friend.user_id}", notice: "Friend deleted successfully.")
  end

  def destroy_row
    @friend = Friend.find(params.fetch("id_to_remove"))

    @friend.destroy

    redirect_to("/friends", :notice => "Friend deleted successfully.")
  end
end
