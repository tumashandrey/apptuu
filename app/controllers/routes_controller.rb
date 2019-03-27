class RoutesController < ApplicationController
  before_action :set_route, only: [:show, :edit, :update, :destroy, :change_station_index]

  def index
    @routes = Route.all
  end

  def show
  end

  def new
    @route = Route.new
  end

  def create
    @route = Route.new(route_params)
    if @route.save
       redirect_to @route
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @route.update(route_params)
      redirect_to @route
    else
      render :edit
    end
  end

  def destroy
    @route.destroy
    redirect_to routes_path
  end

  def change_station_index
    station = RailwayStation.find(params[:station_id])
    railway_station_route =  RailwayStationsRoute.find_by(railway_station_id: station, route_id: @route)
    railway_station_route.station_index = params[:station_index]
    railway_station_route.save
    redirect_to @route
  end

  private

  def set_route
    @route =  Route.find(params[:id])
  end

  def route_params
    params.require(:route).permit(:name, :station_id, :station_index, railway_station_ids: [])
  end
end
