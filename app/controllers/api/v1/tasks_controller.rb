class Api::V1::TasksController < ApplicationController
  before_action :set_task, only: [:show, :update, :destroy]

  def index
    @tasks = Task.order("created_at DESC")
    render json: @tasks, include: ['tags']
  end

  def show
    render json: @task, include: ['tags']
  end
  #   render json: {
  #     task: @task,
  #     tags: @task.tags
  #   }
  # end

  def create
    @task = Task.create(task_param)
    render json: @task   
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
end
