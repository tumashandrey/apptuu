class WagonsController < ApplicationController

    before_action :set_wagon, only: [:show, :edit, :update, :destroy]

    def index
      @wagons = Wagon.all
    end

    def show
    end

    def new
      @wagon = Wagon.new
    end

    def create
      @wagon = set_class_name.new(wagon_params)
      if @wagon.save
        redirect_to @wagon
      else
        render :new
      end
    end

    def edit
    end

    def update
      if @wagon.update(wagon_params)
        redirect_to @wagon
      else
        render :edit
      end
    end

    def destroy
      @wagon.destroy
      redirect_to wagons_path
    end

    private

    def set_wagon
      @wagon =  Wagon.find(params[:id])
    end

    def wagon_params
      if params.has_key?(:economy_wagon)
        params[:wagon] = params.delete(:economy_wagon)
      elsif params.has_key?(:luxury_wagon)
        params[:wagon] = params.delete(:luxury_wagon)
      elsif params.has_key?(:coupe_wagon)
        params[:wagon] = params.delete(:coupe_wagon)
      elsif params.has_key?(:seating_wagon)
        params[:wagon] = params.delete(:seating_wagon)
      end

      params.require(:wagon).permit(:train_id, :top_seats, :lower_seats, :wagon_type, :side_top_seats,
        :side_bottom_seats, :seating, :type)
    end

    def set_class_name
      Object.const_get(params[:wagon][:type])
    end

end