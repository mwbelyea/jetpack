# frozen_string_literal: true
require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  it { is_expected.to respond_to :home }
  describe 'GET #home' do
    it 'returns http success' do
      get :home
      expect(response).to have_http_status(:success)
    end
  end
end
