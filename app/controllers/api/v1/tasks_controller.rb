class Api::V1::TasksController < ApplicationController
  # before_action :verify_loggin
  before_action :verify_user, except: [:index, :create]
  before_action :set_task, only: [:show, :update, :destroy]

  def index
    @tasks = current_user.Task.all.order("created_at DESC")
    render json: @tasks, include: ['tags']
  end

  def show
    if (task.user == current_user)
      render json: @task, include: ['tags']
    else
      redirect_to root_path
    end

  end
  #   render json: {
  #     task: @task,
  #     tags: @task.tags
  #   }
  # end

  def create
    @task = Task.create(task_param)
    @task.user = current_user
    if @task.save
      render json: @task   
    else
      render json:  @task.errors.full_messages
    end
  end

  def update
    if @task.update(task_param)
      # @task.tags.build(params[:tag_ids])
      render json: @task
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy
    head :no_content, status: :ok
  end


  private

    def set_task
      @task ||= Task.find(params[:id])
    end

    def task_param
      params.permit(:title, :done, :description, :due_time, tag_ids: [], tag_task_ids: [])
    end

    # def verify_loggin
    #   unless logged_in?
    #     redirect_to root_path
    #   end
    # end

    def verify_user
      if logged_in?
        if set_task
          if @task.user != current_user
            redirect_to root_path
          end
        end
      else 
        redirect_to root_path
      end
    end


end