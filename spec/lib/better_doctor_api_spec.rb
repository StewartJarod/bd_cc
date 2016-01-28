require 'rails_helper'
# require 'BetterDoctorApi'

RSpec.describe BetterDoctorApi do
  let(:bd_api) { BetterDoctorApi.new }

  it 'includes the doctors_search instance method' do
    expect(bd_api.methods).to include :doctors_search
  end
end
