require 'rails_helper'

describe 'get all message route', type => :request do
  let!(:messages) { FactoryBot.create_list(:messages, 20)}

  before { get '/api/v1/messages'}

  it 'returns all messages' do
    expect(JSON.parse(response.body).size).to eq(20)
  end

  it 'returns status of 200' do
    expect(response).to have_http_status(:success)
  end
end
