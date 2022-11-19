class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit update destroy]

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to tasks_path, notice: "task created successfully." }
      else
        format.html { render :new, notice: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to tasks_path, notice: "task updated successfully." }
      else
        format.html { render :edit, notice: :unprocessable_entity }
      end
    end
  end

  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_path, notice: "task deleted successfuly." }
    end
  end

  private
    def task_params
      params.require(:task).permit(:content, :description, :is_complete).merge(user_id: current_user.id)
    end

    def set_task
      @task = Task.find(params[:id])
    end
end
