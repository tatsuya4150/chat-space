require 'rails_helper'

describe MessagesController do
  let(:chat_group) { create(:chat_group) }
  describe 'GET #index' do
    it "returns http success" do
      get :index, chat_group_id: chat_group.id
      expect(response).to have_http_status(:success)
    end
  end
end
