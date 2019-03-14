class SpeakersController < ApplicationController
  def index
    @speakers = Speaker.all

    render("speaker_templates/index.html.erb")
  end

  def show
    @speaker = Speaker.find(params.fetch("id_to_display"))

    render("speaker_templates/show.html.erb")
  end

  def new_form
    @speaker = Speaker.new

    render("speaker_templates/new_form.html.erb")
  end

  def create_row
    @speaker = Speaker.new

    @speaker.rank = params.fetch("rank")
    @speaker.guest_id = params.fetch("guest_id")
    @speaker.position = params.fetch("position")
    @speaker.description = params.fetch("description")

    if @speaker.valid?
      @speaker.save

      redirect_back(:fallback_location => "/speakers", :notice => "Speaker created successfully.")
    else
      render("speaker_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @speaker = Speaker.find(params.fetch("prefill_with_id"))

    render("speaker_templates/edit_form.html.erb")
  end

  def update_row
    @speaker = Speaker.find(params.fetch("id_to_modify"))

    @speaker.rank = params.fetch("rank")
    @speaker.guest_id = params.fetch("guest_id")
    @speaker.position = params.fetch("position")
    @speaker.description = params.fetch("description")

    if @speaker.valid?
      @speaker.save

      redirect_to("/speakers/#{@speaker.id}", :notice => "Speaker updated successfully.")
    else
      render("speaker_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_guest
    @speaker = Speaker.find(params.fetch("id_to_remove"))

    @speaker.destroy

    redirect_to("/guests/#{@speaker.guest_id}", notice: "Speaker deleted successfully.")
  end

  def destroy_row
    @speaker = Speaker.find(params.fetch("id_to_remove"))

    @speaker.destroy

    redirect_to("/speakers", :notice => "Speaker deleted successfully.")
  end
end
