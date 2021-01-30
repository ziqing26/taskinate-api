class Api::V2::TagsController < ApplicationController
  before_action :verify_loggin
  before_action :verify_user, except: [:index, :create]
  before_action :set_tag, only: [:show, :update, :destroy]

  # GET /tags
  def index
    #@tags = Tag.all
    @tags = current_user.tags.order("created_at ASC")
    render json: @tags, include: ['tasks']
  end

  # GET /tags/1
  def show
    if @tag.user == current_user
      render json: @tag, include:['tasks']
    end
  end

  # POST /tags
  def create
    @tag = Tag.create(tag_params)
    @tag.user = current_user
    # render json: @tag

    # if @tag.save
    #   render json: @tag, status: :created, location: @tag
    # else
    #   render json: @tag.errors, status: :unprocessable_entity
    # end
    if @tag.save
      render json: @task   
    else
      render json:  @task.errors.full_messages
    end
  end

  # PATCH/PUT /tags/1
  def update
    if @tag.update(tag_params)
      render json: @tag
    else
      render json: @tag.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tags/1
  def destroy
    @tag.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag
      @tag = Tag.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def tag_params
      params.require(:tag).permit(:name, tag_task_id: [])
    end

    def verify_loggin
      unless logged_in?
        redirect_to root_path
      end
    end

    def verify_user
      if logged_in?
        if set_tag
          if @tag.user != current_user
            redirect_to root_path
          end
        end
      end
    end
end
