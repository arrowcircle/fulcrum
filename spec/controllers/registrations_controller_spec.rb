require 'spec_helper'

describe RegistrationsController do

  before { request.env['devise.mapping'] = Devise.mappings[:user] }

  describe 'disable registration' do
    before { Configuration.for('fulcrum') { disable_registration true } }

    describe '#new' do
      specify do
        get :new
        expect(response.status).to eq 404
      end
    end

    describe '#create' do
      specify do
        post :create, user: { name: 'Test User', initials: 'TU', email: 'test_user@example.com' }
        expect(response.status).to eq 404
      end
    end
  end

  describe 'enable registration' do
    before { Configuration.for('fulcrum') { disable_registration false } }

    describe '#new' do
      specify do
        get :new
        expect(response).to be_success
      end
    end

    describe '#create' do
      specify do
        post :create, user: { name: 'Test User', initials: 'TU', email: 'test_user@example.com' }
        expect(response).to redirect_to new_user_session_path
      end

      specify do
        post :create, user: { name: 'Test User', initials: 'TU', email: 'test_user@example.com' }
        expect(flash[:notice]).to eq 'You have signed up successfully. A confirmation was sent to your e-mail. Please follow the contained instructions to activate your account.'
      end
    end
  end
end
