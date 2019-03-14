class GiftsController < ApplicationController
  before_action :current_user_must_be_gift_user, :only => [:show, :edit_form, :update_row, :destroy_row]

  def current_user_must_be_gift_user
    gift = Gift.find(params["id_to_display"] || params["prefill_with_id"] || params["id_to_modify"] || params["id_to_remove"])

    unless current_user == gift.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @gifts = current_user.gifts.page(params[:page]).per(10)

    render("gift_templates/index.html.erb")
  end

  def show
    @gift = Gift.find(params.fetch("id_to_display"))

    render("gift_templates/show.html.erb")
  end

  def new_form
    @gift = Gift.new

    render("gift_templates/new_form.html.erb")
  end

  def create_row
    @gift = Gift.new

    @gift.receipient = params.fetch("receipient")
    @gift.address = params.fetch("address")
    @gift.email = params.fetch("email")
    @gift.kind = params.fetch("kind")
    @gift.user_id = params.fetch("user_id")

    if @gift.valid?
      @gift.save

      redirect_back(:fallback_location => "/gifts", :notice => "Gift created successfully.")
    else
      render("gift_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @gift = Gift.find(params.fetch("prefill_with_id"))

    render("gift_templates/edit_form.html.erb")
  end

  def update_row
    @gift = Gift.find(params.fetch("id_to_modify"))

    @gift.receipient = params.fetch("receipient")
    @gift.address = params.fetch("address")
    @gift.email = params.fetch("email")
    @gift.kind = params.fetch("kind")
    

    if @gift.valid?
      @gift.save

      redirect_to("/gifts/#{@gift.id}", :notice => "Gift updated successfully.")
    else
      render("gift_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_user
    @gift = Gift.find(params.fetch("id_to_remove"))

    @gift.destroy

    redirect_to("/users/#{@gift.user_id}", notice: "Gift deleted successfully.")
  end

  def destroy_row
    @gift = Gift.find(params.fetch("id_to_remove"))

    @gift.destroy

    redirect_to("/gifts", :notice => "Gift deleted successfully.")
  end
end
