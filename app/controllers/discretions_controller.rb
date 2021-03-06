class DiscretionsController < ApplicationController
  before_action :current_user_must_be_discretion_user, :only => [:show, :edit_form, :update_row, :destroy_row]

  def current_user_must_be_discretion_user
    discretion = Discretion.find(params["id_to_display"] || params["prefill_with_id"] || params["id_to_modify"] || params["id_to_remove"])

    unless current_user == discretion.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = current_user.discretions.ransack(params[:q])
    @discretions = @q.result(:distinct => true).includes(:user, :apppointee).page(params[:page]).per(10)

    render("discretion_templates/index.html.erb")
  end

  def show
    @discretion = Discretion.find(params.fetch("id_to_display"))

    render("discretion_templates/show.html.erb")
  end

  def new_form
    @discretion = Discretion.new

    render("discretion_templates/new_form.html.erb")
  end

  def create_row
    @discretion = Discretion.new

    @discretion.title = params.fetch("title")
    @discretion.description = params.fetch("description")
    @discretion.instruction = params.fetch("instruction")
    @discretion.user_id = params.fetch("user_id")
    @discretion.apppointee_id = params.fetch("apppointee_id")

    if @discretion.valid?
      @discretion.save

      redirect_back(:fallback_location => "/discretions", :notice => "Discretion created successfully.")
    else
      render("discretion_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_appointee
    @discretion = Discretion.new

    @discretion.title = params.fetch("title")
    @discretion.description = params.fetch("description")
    @discretion.instruction = params.fetch("instruction")
    @discretion.user_id = params.fetch("user_id")
    @discretion.apppointee_id = params.fetch("apppointee_id")

    if @discretion.valid?
      @discretion.save

      redirect_to("/appointees/#{@discretion.apppointee_id}", notice: "Discretion created successfully.")
    else
      render("discretion_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @discretion = Discretion.find(params.fetch("prefill_with_id"))

    render("discretion_templates/edit_form.html.erb")
  end

  def update_row
    @discretion = Discretion.find(params.fetch("id_to_modify"))

    @discretion.title = params.fetch("title")
    @discretion.description = params.fetch("description")
    @discretion.instruction = params.fetch("instruction")
    
    @discretion.apppointee_id = params.fetch("apppointee_id")

    if @discretion.valid?
      @discretion.save

      redirect_to("/discretions/#{@discretion.id}", :notice => "Discretion updated successfully.")
    else
      render("discretion_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_user
    @discretion = Discretion.find(params.fetch("id_to_remove"))

    @discretion.destroy

    redirect_to("/users/#{@discretion.user_id}", notice: "Discretion deleted successfully.")
  end

  def destroy_row_from_apppointee
    @discretion = Discretion.find(params.fetch("id_to_remove"))

    @discretion.destroy

    redirect_to("/appointees/#{@discretion.apppointee_id}", notice: "Discretion deleted successfully.")
  end

  def destroy_row
    @discretion = Discretion.find(params.fetch("id_to_remove"))

    @discretion.destroy

    redirect_to("/discretions", :notice => "Discretion deleted successfully.")
  end
end
