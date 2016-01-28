class Api::V1::DoctorsController < ApplicationController
  def search
    options = params.permit(
      :name, :first_name, :last_name, :query, :specialty_uid, :insurance_uid,
      :location, :user_location, :gender, :sort, :fields, :skip, :limit
    )

    if options.blank?
      render json: { error: 'At least one request parameter is needed' }, status: :bad_request
    else
      render json: BetterDoctorApi.new.doctors_search(options)
    end
  end
end
