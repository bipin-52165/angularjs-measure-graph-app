class Api::BloodGlucosesController < ApplicationController
  before_filter :get_blood_glucose, except: [:show, :update, :destroy]

  def index
    blood_glucose = BloodGlucose.select('MAX(glucose) as glucose, MAX(updated_at) as updated_at').group("date(updated_at)").last(7)
    return render :json => {:data => blood_glucose.collect(&:glucose), :dates => blood_glucose.collect{ |d| d.updated_at.strftime("%Y-%m-%d") }}
  end

  def create
    @blood_glucose = BloodGlucose.new(blood_glucose_params)
    if @blood_glucose.save
      return render :json => @blood_glucose, :status => 200
    else
      return render :json => { :error => @blood_glucose.errors }, :status => :unprocessable_entity
    end
  end

  def update
    respond_with :api, BloodGlucose.update(@blood_glucose.id, blood_glucose_params)
  end

  private

  def get_blood_glucose
    @blood_gluclose = BloodGlucose.find_by params[:id]
  end

  def blood_glucose_params
    params.require(:blood_glucose).permit :glucose
  end
end
