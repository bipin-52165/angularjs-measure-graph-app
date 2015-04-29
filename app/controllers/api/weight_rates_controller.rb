class Api::WeightRatesController < ApplicationController
  before_filter :get_weight_rate, except: [:show, :update, :destroy]

  def index
    weight_rate = WeightRate.select('MAX(rate) as rate, MAX(updated_at) as updated_at').group("date(updated_at)").last(7)
    return render :json => {:data => weight_rate.collect(&:rate), :dates => weight_rate.collect{ |d| d.updated_at.strftime("%Y-%m-%d") }}
  end

  def create
    @weight_rate = WeightRate.new(weight_rate_params)
    if @weight_rate.save
      return render :json => @weight_rate, :status => 200
    else
      return render :json => { :error => @weight_rate.errors }, :status => :unprocessable_entity
    end
  end

  def update
    respond_with :api, WeightRate.update(@weight_rate.id, weight_rate_params)
  end

  private

  def get_weight_rate
    @weight_rate = WeightRate.find_by params[:id]
  end

  def weight_rate_params
    params.require(:weight_rate).permit :rate
  end
end
