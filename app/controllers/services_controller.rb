class ServicesController < ApplicationController
  def index
    @services = Service.all

    render("service_templates/index.html.erb")
  end

  def show
    @service = Service.find(params.fetch("id_to_display"))

    render("service_templates/show.html.erb")
  end

  def new_form
    @service = Service.new

    render("service_templates/new_form.html.erb")
  end

  def create_row
    @service = Service.new

    @service.venue_id = params.fetch("venue_id")
    @service.user_id = params.fetch("user_id")
    @service.theme_id = params.fetch("theme_id")
    @service.rank = params.fetch("rank")
    @service.casket = params.fetch("casket")

    if @service.valid?
      @service.save

      redirect_back(:fallback_location => "/services", :notice => "Service created successfully.")
    else
      render("service_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_venue
    @service = Service.new

    @service.venue_id = params.fetch("venue_id")
    @service.user_id = params.fetch("user_id")
    @service.theme_id = params.fetch("theme_id")
    @service.rank = params.fetch("rank")
    @service.casket = params.fetch("casket")

    if @service.valid?
      @service.save

      redirect_to("/venues/#{@service.venue_id}", notice: "Service created successfully.")
    else
      render("service_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_theme
    @service = Service.new

    @service.venue_id = params.fetch("venue_id")
    @service.user_id = params.fetch("user_id")
    @service.theme_id = params.fetch("theme_id")
    @service.rank = params.fetch("rank")
    @service.casket = params.fetch("casket")

    if @service.valid?
      @service.save

      redirect_to("/themes/#{@service.theme_id}", notice: "Service created successfully.")
    else
      render("service_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @service = Service.find(params.fetch("prefill_with_id"))

    render("service_templates/edit_form.html.erb")
  end

  def update_row
    @service = Service.find(params.fetch("id_to_modify"))

    @service.venue_id = params.fetch("venue_id")
    @service.user_id = params.fetch("user_id")
    @service.theme_id = params.fetch("theme_id")
    @service.rank = params.fetch("rank")
    @service.casket = params.fetch("casket")

    if @service.valid?
      @service.save

      redirect_to("/services/#{@service.id}", :notice => "Service updated successfully.")
    else
      render("service_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_user
    @service = Service.find(params.fetch("id_to_remove"))

    @service.destroy

    redirect_to("/users/#{@service.user_id}", notice: "Service deleted successfully.")
  end

  def destroy_row_from_venue
    @service = Service.find(params.fetch("id_to_remove"))

    @service.destroy

    redirect_to("/venues/#{@service.venue_id}", notice: "Service deleted successfully.")
  end

  def destroy_row_from_theme
    @service = Service.find(params.fetch("id_to_remove"))

    @service.destroy

    redirect_to("/themes/#{@service.theme_id}", notice: "Service deleted successfully.")
  end

  def destroy_row
    @service = Service.find(params.fetch("id_to_remove"))

    @service.destroy

    redirect_to("/services", :notice => "Service deleted successfully.")
  end
end
