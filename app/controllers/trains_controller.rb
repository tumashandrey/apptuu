class TrainsController < ApplicationController
  before_action :set_train, only: [:show, :edit, :update, :destroy]

  def index
    @trains = Train.all
  end

  def show
    if @train.sort_by == 'desc'
      @wagons = @train.wagons.ordered_desc
    else
      @wagons = @train.wagons.ordered_asc
    end
  end

  def new
    @train = Train.new
  end

  def edit
  end

  def create
    @train = Train.new(train_params)

     if @train.save
        redirect_to @train
     else
        render :new
     end

  end

  def update
    respond_to do |format|
      if @train.update(train_params)
        format.html { redirect_to @train, notice: 'Train was successfully updated.' }
        format.json { render :show, status: :ok, location: @train }
      else
        format.html { render :edit }
        format.json { render json: @train.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @train.destroy
    respond_to do |format|
      format.html { redirect_to trains_url, notice: 'Train was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_train
      @train = Train.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def train_params
      params.require(:train).permit(:number, :route_id, :sort_by)
    end
end
