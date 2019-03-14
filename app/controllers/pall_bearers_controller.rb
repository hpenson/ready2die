class PallBearersController < ApplicationController
  def index
    @pall_bearers = PallBearer.all

    render("pall_bearer_templates/index.html.erb")
  end

  def show
    @pall_bearer = PallBearer.find(params.fetch("id_to_display"))

    render("pall_bearer_templates/show.html.erb")
  end

  def new_form
    @pall_bearer = PallBearer.new

    render("pall_bearer_templates/new_form.html.erb")
  end

  def create_row
    @pall_bearer = PallBearer.new

    @pall_bearer.guest_id = params.fetch("guest_id")
    @pall_bearer.rank = params.fetch("rank")

    if @pall_bearer.valid?
      @pall_bearer.save

      redirect_back(:fallback_location => "/pall_bearers", :notice => "Pall bearer created successfully.")
    else
      render("pall_bearer_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @pall_bearer = PallBearer.find(params.fetch("prefill_with_id"))

    render("pall_bearer_templates/edit_form.html.erb")
  end

  def update_row
    @pall_bearer = PallBearer.find(params.fetch("id_to_modify"))

    @pall_bearer.guest_id = params.fetch("guest_id")
    @pall_bearer.rank = params.fetch("rank")

    if @pall_bearer.valid?
      @pall_bearer.save

      redirect_to("/pall_bearers/#{@pall_bearer.id}", :notice => "Pall bearer updated successfully.")
    else
      render("pall_bearer_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @pall_bearer = PallBearer.find(params.fetch("id_to_remove"))

    @pall_bearer.destroy

    redirect_to("/pall_bearers", :notice => "Pall bearer deleted successfully.")
  end
end
