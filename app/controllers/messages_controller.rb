class MessagesController < ApplicationController
  def index
    @messages = Message.all

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
    @message.photo = params.fetch("photo")

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
    @message.user_id = params.fetch("user_id")
    @message.photo = params.fetch("photo")

    if @message.valid?
      @message.save

      redirect_to("/messages/#{@message.id}", :notice => "Message updated successfully.")
    else
      render("message_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @message = Message.find(params.fetch("id_to_remove"))

    @message.destroy

    redirect_to("/messages", :notice => "Message deleted successfully.")
  end
end
