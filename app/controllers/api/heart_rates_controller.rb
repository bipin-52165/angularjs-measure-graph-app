class Api::HeartRatesController < ApplicationController
  before_filter :get_heart_rate, except: [:show, :update, :destroy]

  def index
    heart_rate = HeartRate.select('MAX(rate) as rate, MAX(updated_at) as updated_at').group("date(updated_at)").last(7)
    return render :json => {:data => heart_rate.collect(&:rate), :dates => heart_rate.collect{ |d| d.updated_at.strftime("%Y-%m-%d") }}
  end

  def create
    @heart_rate = HeartRate.new(heart_rate_params)
    if @heart_rate.save
      return render :json => @heart_rate, :status => 200
    else
      return render :json => { :error => @heart_rate.errors }, :status => :unprocessable_entity
    end
  end

  def update
    respond_with :api, HeartRate.update(@heart_rate.id, heart_rate_params)
  end

  private

  def get_heart_rate
    @heart_rate = HeartRate.find_by params[:id]
  end

  def heart_rate_params
    params.require(:heart_rate).permit :rate
  end
end
