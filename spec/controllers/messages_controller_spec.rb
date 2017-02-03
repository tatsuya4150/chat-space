require 'rails_helper'

describe MessagesController do
  let!(:create_params){{
    body: "サンプル"
  }}

  let(:chat_group) { create(:chat_group) }
  let(:user) { create(:user) }

  describe 'GET #index' do
    it "returns http success" do
      get :index, chat_group_id: chat_group.id
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #create' do
    before do
      login_user(user)
    end

    it 'returns http success' do
      post :create, params: { chat_group_id: chat_group.id,  message: { body: 'サンプル' } }
      expect(response).to have_http_status(:found)
      expect(response).to redirect_to(chat_group_messages_path(chat_group))
    end
  end
end
