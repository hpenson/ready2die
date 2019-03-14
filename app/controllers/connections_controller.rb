class ConnectionsController < ApplicationController
  before_action :current_user_must_be_connection_user, :only => [:edit_form, :update_row, :destroy_row]

  def current_user_must_be_connection_user
    connection = Connection.find(params["id_to_display"] || params["prefill_with_id"] || params["id_to_modify"] || params["id_to_remove"])

    unless current_user == connection.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @connections = Connection.all

    render("connection_templates/index.html.erb")
  end

  def show
    @connection = Connection.find(params.fetch("id_to_display"))

    render("connection_templates/show.html.erb")
  end

  def new_form
    @connection = Connection.new

    render("connection_templates/new_form.html.erb")
  end

  def create_row
    @connection = Connection.new

    @connection.why = params.fetch("why")
    @connection.afriend_id = params.fetch("afriend_id")
    @connection.bfriend_id = params.fetch("bfriend_id")
    @connection.user_id = params.fetch("user_id")

    if @connection.valid?
      @connection.save

      redirect_back(:fallback_location => "/connections", :notice => "Connection created successfully.")
    else
      render("connection_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_friend
    @connection = Connection.new

    @connection.why = params.fetch("why")
    @connection.afriend_id = params.fetch("afriend_id")
    @connection.bfriend_id = params.fetch("bfriend_id")
    @connection.user_id = params.fetch("user_id")

    if @connection.valid?
      @connection.save

      redirect_to("/friends/#{@connection.afriend_id}", notice: "Connection created successfully.")
    else
      render("connection_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_friend
    @connection = Connection.new

    @connection.why = params.fetch("why")
    @connection.afriend_id = params.fetch("afriend_id")
    @connection.bfriend_id = params.fetch("bfriend_id")
    @connection.user_id = params.fetch("user_id")

    if @connection.valid?
      @connection.save

      redirect_to("/friends/#{@connection.bfriend_id}", notice: "Connection created successfully.")
    else
      render("connection_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @connection = Connection.find(params.fetch("prefill_with_id"))

    render("connection_templates/edit_form.html.erb")
  end

  def update_row
    @connection = Connection.find(params.fetch("id_to_modify"))

    @connection.why = params.fetch("why")
    @connection.afriend_id = params.fetch("afriend_id")
    @connection.bfriend_id = params.fetch("bfriend_id")
    

    if @connection.valid?
      @connection.save

      redirect_to("/connections/#{@connection.id}", :notice => "Connection updated successfully.")
    else
      render("connection_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_user
    @connection = Connection.find(params.fetch("id_to_remove"))

    @connection.destroy

    redirect_to("/users/#{@connection.user_id}", notice: "Connection deleted successfully.")
  end

  def destroy_row_from_afriend
    @connection = Connection.find(params.fetch("id_to_remove"))

    @connection.destroy

    redirect_to("/friends/#{@connection.afriend_id}", notice: "Connection deleted successfully.")
  end

  def destroy_row_from_bfriend
    @connection = Connection.find(params.fetch("id_to_remove"))

    @connection.destroy

    redirect_to("/friends/#{@connection.bfriend_id}", notice: "Connection deleted successfully.")
  end

  def destroy_row
    @connection = Connection.find(params.fetch("id_to_remove"))

    @connection.destroy

    redirect_to("/connections", :notice => "Connection deleted successfully.")
  end
end
