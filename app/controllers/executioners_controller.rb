class ExecutionersController < ApplicationController
  def index
    @executioners = Executioner.all

    render("executioner_templates/index.html.erb")
  end

  def show
    @executioner = Executioner.find(params.fetch("id_to_display"))

    render("executioner_templates/show.html.erb")
  end

  def new_form
    @executioner = Executioner.new

    render("executioner_templates/new_form.html.erb")
  end

  def create_row
    @executioner = Executioner.new

    @executioner.last_name = params.fetch("last_name")
    @executioner.first_name = params.fetch("first_name")
    @executioner.address = params.fetch("address")
    @executioner.email = params.fetch("email")
    @executioner.phone = params.fetch("phone")
    @executioner.instruction = params.fetch("instruction")
    @executioner.user_id = params.fetch("user_id")

    if @executioner.valid?
      @executioner.save

      redirect_back(:fallback_location => "/executioners", :notice => "Executioner created successfully.")
    else
      render("executioner_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @executioner = Executioner.find(params.fetch("prefill_with_id"))

    render("executioner_templates/edit_form.html.erb")
  end

  def update_row
    @executioner = Executioner.find(params.fetch("id_to_modify"))

    @executioner.last_name = params.fetch("last_name")
    @executioner.first_name = params.fetch("first_name")
    @executioner.address = params.fetch("address")
    @executioner.email = params.fetch("email")
    @executioner.phone = params.fetch("phone")
    @executioner.instruction = params.fetch("instruction")
    

    if @executioner.valid?
      @executioner.save

      redirect_to("/executioners/#{@executioner.id}", :notice => "Executioner updated successfully.")
    else
      render("executioner_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_user
    @executioner = Executioner.find(params.fetch("id_to_remove"))

    @executioner.destroy

    redirect_to("/users/#{@executioner.user_id}", notice: "Executioner deleted successfully.")
  end

  def destroy_row
    @executioner = Executioner.find(params.fetch("id_to_remove"))

    @executioner.destroy

    redirect_to("/executioners", :notice => "Executioner deleted successfully.")
  end
end
