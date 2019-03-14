class ConnectionsController < ApplicationController
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

  def edit_form
    @connection = Connection.find(params.fetch("prefill_with_id"))

    render("connection_templates/edit_form.html.erb")
  end

  def update_row
    @connection = Connection.find(params.fetch("id_to_modify"))

    @connection.why = params.fetch("why")
    @connection.afriend_id = params.fetch("afriend_id")
    @connection.bfriend_id = params.fetch("bfriend_id")
    @connection.user_id = params.fetch("user_id")

    if @connection.valid?
      @connection.save

      redirect_to("/connections/#{@connection.id}", :notice => "Connection updated successfully.")
    else
      render("connection_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @connection = Connection.find(params.fetch("id_to_remove"))

    @connection.destroy

    redirect_to("/connections", :notice => "Connection deleted successfully.")
  end
end
