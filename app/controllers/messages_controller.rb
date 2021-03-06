class MessagesController < ApplicationController
  before_action :current_user_must_be_message_user, :only => [:show, :edit_form, :update_row, :destroy_row]

  def current_user_must_be_message_user
    message = Message.find(params["id_to_display"] || params["prefill_with_id"] || params["id_to_modify"] || params["id_to_remove"])

    unless current_user == message.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = current_user.messages.ransack(params[:q])
    @messages = @q.result(:distinct => true).includes(:user).page(params[:page]).per(10)
    @location_hash = Gmaps4rails.build_markers(@messages.where.not(:address_latitude => nil)) do |message, marker|
      marker.lat message.address_latitude
      marker.lng message.address_longitude
      marker.infowindow "<h5><a href='/messages/#{message.id}'>#{message.description}</a></h5><small>#{message.address_formatted_address}</small>"
    end

    render("message_templates/index.html.erb")
  end

  def show
    @message = Message.find(params.fetch("id_to_display"))

    render("message_templates/show.html.erb")
  end

  def new_form
    @message = Message.new

    render("message_templates/new_form.html.erb")
  end

  def create_row
    @message = Message.new

    @message.description = params.fetch("description")
    @message.receipient = params.fetch("receipient")
    @message.address = params.fetch("address")
    @message.email = params.fetch("email")
    @message.phone = params.fetch("phone")
    @message.content = params.fetch("content")
    @message.audio = params.fetch("audio")
    @message.video = params.fetch("video")
    @message.user_id = params.fetch("user_id")
    @message.photo = params.fetch("photo") if params.key?("photo")

    if @message.valid?
      @message.save

      redirect_back(:fallback_location => "/messages", :notice => "Message created successfully.")
    else
      render("message_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @message = Message.find(params.fetch("prefill_with_id"))

    render("message_templates/edit_form.html.erb")
  end

  def update_row
    @message = Message.find(params.fetch("id_to_modify"))

    @message.description = params.fetch("description")
    @message.receipient = params.fetch("receipient")
    @message.address = params.fetch("address")
    @message.email = params.fetch("email")
    @message.phone = params.fetch("phone")
    @message.content = params.fetch("content")
    @message.audio = params.fetch("audio")
    @message.video = params.fetch("video")
    
    @message.photo = params.fetch("photo") if params.key?("photo")

    if @message.valid?
      @message.save

      redirect_to("/messages/#{@message.id}", :notice => "Message updated successfully.")
    else
      render("message_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_user
    @message = Message.find(params.fetch("id_to_remove"))

    @message.destroy

    redirect_to("/users/#{@message.user_id}", notice: "Message deleted successfully.")
  end

  def destroy_row
    @message = Message.find(params.fetch("id_to_remove"))

    @message.destroy

    redirect_to("/messages", :notice => "Message deleted successfully.")
  end
end
