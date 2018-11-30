class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :edit, :update, :destroy]



  # GET /todos
  # GET /todos.json
  def index
    @todos = Todo.all
  end

  def list
    @todos = Todo.all
  end

  # GET /todos/1
  # GET /todos/1.json
  def show
    @todo = Todo.find(params[:id])
  end

  # GET /todos/new
  def new
    @todo = Todo.new
#validates :description presence :true

  end

  # GET /todos/1/edit
  def edit
    @todo = Todo.find(params[:id])
  end

  # POST /todos
  # POST /todos.json



  # def create
  #   @todo = Todo.new(todo_params[:todo])
  #   @todo.save


  #   respond_to do |format|
  #     if @todo.save
  #       format.html { redirect_to root_url, notice: 'Todo was successfully created.' }
  #       format.json { render :show, status: :created, location: @todo }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @todo.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  def create
    @todo = Todo.new(todo_params)

    if @todo.save
        redirect_to root_path
    else
        redirect_to todos_new_path
    end

  end



  # PATCH/PUT /todos/1
  # PATCH/PUT /todos/1.json
  def update
    @todo = Todo.find(params[:id])
    respond_to do |format|
      if @todo.update(todo_params)
        format.html { redirect_to root_url, notice: 'Todo was successfully updated.' }
        format.json { render :show, status: :ok, location: @todo }
      else
        format.html { render :edit }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /todos/1
  # DELETE /todos/1.json
  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy

    respond_to do |format|
      format.html { redirect_to root_url, notice: 'Todo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def completed
    @todo = Todo.find(params[:id])
    if completed = true
      @todo.save
       redirect_to root_path

    end

  end

  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo
      @todo = Todo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def todo_params
      params.require(:todo).permit(:description, :completed)
    end
end
