class HistoriesController < ApplicationController

  before_action :set_history, only: [:show, :edit, :update, :destroy]

  def index
    @histories = History.all
  end

  def show
  end

  def new
    @history = History.new
  end

  def create
    @history = History.create(history_params)
    if @history.save
      flash[:success] = 'История создана!'
      redirect_to @history
    else
      flash.now[:error] = 'История не создана'
      render 'new'
    end
  end


  def edit
  end

  def update
    @history.update_attributes(history_params)
    if @history.save
      flash[:success] = 'История отредактирована!'
      redirect_to @history
    else
      flash.now[:error] = 'Ошибка!'
      render 'edit'
    end
  end


  def destroy
    @history.destroy
    flash[:success] = 'Статья удалена!'
    redirect_to histories_path
  end




  private

  def history_params
    params.require(:history).permit(:title, :body, :source, :image)
  end


  def set_history
    @history = History.find(params[:id])
  end

end
