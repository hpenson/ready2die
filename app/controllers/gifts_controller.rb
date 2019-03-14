class GiftsController < ApplicationController
  def index
    @gifts = Gift.all

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
    @gift.user_id = params.fetch("user_id")

    if @gift.valid?
      @gift.save

      redirect_to("/gifts/#{@gift.id}", :notice => "Gift updated successfully.")
    else
      render("gift_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @gift = Gift.find(params.fetch("id_to_remove"))

    @gift.destroy

    redirect_to("/gifts", :notice => "Gift deleted successfully.")
  end
end
