class ObituariesController < ApplicationController
  def index
    @obituaries = Obituary.all

    render("obituary_templates/index.html.erb")
  end

  def show
    @obituary = Obituary.find(params.fetch("id_to_display"))

    render("obituary_templates/show.html.erb")
  end

  def new_form
    @obituary = Obituary.new

    render("obituary_templates/new_form.html.erb")
  end

  def create_row
    @obituary = Obituary.new

    @obituary.description = params.fetch("description")
    @obituary.outlet = params.fetch("outlet")
    @obituary.user_id = params.fetch("user_id")
    @obituary.rank = params.fetch("rank")

    if @obituary.valid?
      @obituary.save

      redirect_back(:fallback_location => "/obituaries", :notice => "Obituary created successfully.")
    else
      render("obituary_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @obituary = Obituary.find(params.fetch("prefill_with_id"))

    render("obituary_templates/edit_form.html.erb")
  end

  def update_row
    @obituary = Obituary.find(params.fetch("id_to_modify"))

    @obituary.description = params.fetch("description")
    @obituary.outlet = params.fetch("outlet")
    
    @obituary.rank = params.fetch("rank")

    if @obituary.valid?
      @obituary.save

      redirect_to("/obituaries/#{@obituary.id}", :notice => "Obituary updated successfully.")
    else
      render("obituary_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_user
    @obituary = Obituary.find(params.fetch("id_to_remove"))

    @obituary.destroy

    redirect_to("/users/#{@obituary.user_id}", notice: "Obituary deleted successfully.")
  end

  def destroy_row
    @obituary = Obituary.find(params.fetch("id_to_remove"))

    @obituary.destroy

    redirect_to("/obituaries", :notice => "Obituary deleted successfully.")
  end
end
