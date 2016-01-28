require 'rails_helper'

RSpec.describe Api::V1::DoctorsController, type: :controller do
  describe 'GET search' do
    let(:bd_api) { BetterDoctorApi.new }

    context 'with valid attributes' do
      it 'returns OK' do
        allow(bd_api).to receive(:doctors_search).and_return({})
        get :search, name: 'bob'
        expect(response.status).to eq 200
        expect(response.header['Content-Type']).to include 'json'
      end
    end

    context 'with invalid parameters' do
      it 'returns bad request' do
        get :search
        expect(response.status).to eq 400
        expect(response.header['Content-Type']).to include 'json'
      end

      it 'will filter invalid parameters' do
        get :search, hack: 'do something crazy'
        expect(response.status).to eq 400
      end
    end
  end
end
