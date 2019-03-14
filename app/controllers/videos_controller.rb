class VideosController < ApplicationController
  def index
    @videos = Video.all

    render("video_templates/index.html.erb")
  end

  def show
    @video = Video.find(params.fetch("id_to_display"))

    render("video_templates/show.html.erb")
  end

  def new_form
    @video = Video.new

    render("video_templates/new_form.html.erb")
  end

  def create_row
    @video = Video.new

    @video.upload = params.fetch("upload")
    @video.description = params.fetch("description")
    @video.caption = params.fetch("caption")
    @video.rank = params.fetch("rank")
    @video.user_id = params.fetch("user_id")

    if @video.valid?
      @video.save

      redirect_back(:fallback_location => "/videos", :notice => "Video created successfully.")
    else
      render("video_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @video = Video.find(params.fetch("prefill_with_id"))

    render("video_templates/edit_form.html.erb")
  end

  def update_row
    @video = Video.find(params.fetch("id_to_modify"))

    @video.upload = params.fetch("upload")
    @video.description = params.fetch("description")
    @video.caption = params.fetch("caption")
    @video.rank = params.fetch("rank")
    @video.user_id = params.fetch("user_id")

    if @video.valid?
      @video.save

      redirect_to("/videos/#{@video.id}", :notice => "Video updated successfully.")
    else
      render("video_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @video = Video.find(params.fetch("id_to_remove"))

    @video.destroy

    redirect_to("/videos", :notice => "Video deleted successfully.")
  end
end