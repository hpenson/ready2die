class AppointeesController < ApplicationController
  def index
    @appointees = Appointee.all

    render("appointee_templates/index.html.erb")
  end

  def show
    @discretion = Discretion.new
    @appointee = Appointee.find(params.fetch("id_to_display"))

    render("appointee_templates/show.html.erb")
  end

  def new_form
    @appointee = Appointee.new

    render("appointee_templates/new_form.html.erb")
  end

  def create_row
    @appointee = Appointee.new

    @appointee.last_name = params.fetch("last_name")
    @appointee.first_name = params.fetch("first_name")
    @appointee.email = params.fetch("email")
    @appointee.address = params.fetch("address")
    @appointee.phone = params.fetch("phone")
    @appointee.discretion_id = params.fetch("discretion_id")

    if @appointee.valid?
      @appointee.save

      redirect_back(:fallback_location => "/appointees", :notice => "Appointee created successfully.")
    else
      render("appointee_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @appointee = Appointee.find(params.fetch("prefill_with_id"))

    render("appointee_templates/edit_form.html.erb")
  end

  def update_row
    @appointee = Appointee.find(params.fetch("id_to_modify"))

    @appointee.last_name = params.fetch("last_name")
    @appointee.first_name = params.fetch("first_name")
    @appointee.email = params.fetch("email")
    @appointee.address = params.fetch("address")
    @appointee.phone = params.fetch("phone")
    @appointee.discretion_id = params.fetch("discretion_id")

    if @appointee.valid?
      @appointee.save

      redirect_to("/appointees/#{@appointee.id}", :notice => "Appointee updated successfully.")
    else
      render("appointee_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @appointee = Appointee.find(params.fetch("id_to_remove"))

    @appointee.destroy

    redirect_to("/appointees", :notice => "Appointee deleted successfully.")
  end
end
