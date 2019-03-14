class GuestsController < ApplicationController
  def index
    @guests = Guest.all

    render("guest_templates/index.html.erb")
  end

  def show
    @guest = Guest.find(params.fetch("id_to_display"))

    render("guest_templates/show.html.erb")
  end

  def new_form
    @guest = Guest.new

    render("guest_templates/new_form.html.erb")
  end

  def create_row
    @guest = Guest.new

    @guest.first_name = params.fetch("first_name")
    @guest.last_name = params.fetch("last_name")
    @guest.address = params.fetch("address")
    @guest.email = params.fetch("email")
    @guest.phone = params.fetch("phone")
    @guest.user_id = params.fetch("user_id")

    if @guest.valid?
      @guest.save

      redirect_back(:fallback_location => "/guests", :notice => "Guest created successfully.")
    else
      render("guest_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @guest = Guest.find(params.fetch("prefill_with_id"))

    render("guest_templates/edit_form.html.erb")
  end

  def update_row
    @guest = Guest.find(params.fetch("id_to_modify"))

    @guest.first_name = params.fetch("first_name")
    @guest.last_name = params.fetch("last_name")
    @guest.address = params.fetch("address")
    @guest.email = params.fetch("email")
    @guest.phone = params.fetch("phone")
    @guest.user_id = params.fetch("user_id")

    if @guest.valid?
      @guest.save

      redirect_to("/guests/#{@guest.id}", :notice => "Guest updated successfully.")
    else
      render("guest_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_user
    @guest = Guest.find(params.fetch("id_to_remove"))

    @guest.destroy

    redirect_to("/users/#{@guest.user_id}", notice: "Guest deleted successfully.")
  end

  def destroy_row
    @guest = Guest.find(params.fetch("id_to_remove"))

    @guest.destroy

    redirect_to("/guests", :notice => "Guest deleted successfully.")
  end
end
