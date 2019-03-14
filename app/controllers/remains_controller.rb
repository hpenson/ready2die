class RemainsController < ApplicationController
  before_action :current_user_must_be_remain_user, :only => [:show, :edit_form, :update_row, :destroy_row]

  def current_user_must_be_remain_user
    remain = Remain.find(params["id_to_display"] || params["prefill_with_id"] || params["id_to_modify"] || params["id_to_remove"])

    unless current_user == remain.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @remains = current_user.remains.page(params[:page]).per(10)

    render("remain_templates/index.html.erb")
  end

  def show
    @remain = Remain.find(params.fetch("id_to_display"))

    render("remain_templates/show.html.erb")
  end

  def new_form
    @remain = Remain.new

    render("remain_templates/new_form.html.erb")
  end

  def create_row
    @remain = Remain.new

    @remain.portion = params.fetch("portion")
    @remain.wish = params.fetch("wish")
    @remain.user_id = params.fetch("user_id")

    if @remain.valid?
      @remain.save

      redirect_back(:fallback_location => "/remains", :notice => "Remain created successfully.")
    else
      render("remain_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @remain = Remain.find(params.fetch("prefill_with_id"))

    render("remain_templates/edit_form.html.erb")
  end

  def update_row
    @remain = Remain.find(params.fetch("id_to_modify"))

    @remain.portion = params.fetch("portion")
    @remain.wish = params.fetch("wish")
    

    if @remain.valid?
      @remain.save

      redirect_to("/remains/#{@remain.id}", :notice => "Remain updated successfully.")
    else
      render("remain_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_user
    @remain = Remain.find(params.fetch("id_to_remove"))

    @remain.destroy

    redirect_to("/users/#{@remain.user_id}", notice: "Remain deleted successfully.")
  end

  def destroy_row
    @remain = Remain.find(params.fetch("id_to_remove"))

    @remain.destroy

    redirect_to("/remains", :notice => "Remain deleted successfully.")
  end
end
