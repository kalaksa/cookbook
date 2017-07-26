require 'rails_helper'

describe RecipesController do
  let(:valid_attributes) { attributes_for(:recipe) }

  context 'user is not signed in' do
    describe 'GET index' do
      it 'exposes all recipes' do
        get :index
        expect(response).to be_success
        expect(response).to render_template(:index)
      end
    end

    describe 'GET show' do
      let(:recipe) { build(:recipe) }
      before {
        expect(Recipe).to receive(:find).with('1').and_return(recipe)
      }
      it 'exposes the requested book' do
        get :show, params: { id: 1 }
        expect(response).to be_success
        expect(response).to render_template(:show)
      end
    end

    describe 'GET new' do
      it 'redirects user to the login page' do
        get :new
        expect(response).not_to be_success
        expect(response).to redirect_to(new_user_session_path)
        expect(flash[:alert]).to eq('You need to sign in or sign up before continuing.')
      end
    end

    describe 'POST create' do
      it 'redirects user to the login page' do
        post :create, recipe: valid_attributes
        expect(response).not_to be_success
        expect(response).to redirect_to(new_user_session_path)
        expect(flash[:alert]).to eq('You need to sign in or sign up before continuing.')
      end
    end

    describe 'GET edit' do
      let(:recipe) { build(:recipe) }
      before {
        expect(Recipe).not_to receive(:find).with('1')
      }
      it 'redirects user to the login page' do
        get :edit, params: { id: 1 }
        expect(response).not_to be_success
        expect(response).to redirect_to(new_user_session_path)
        expect(flash[:alert]).to eq('You need to sign in or sign up before continuing.')
      end
    end

    describe 'PUT update' do
      let(:recipe) { build(:recipe) }
      before {
        expect(Recipe).not_to receive(:find).with('1')
      }
      it 'redirects user to the login page' do
        put :update, params: { id: 1 }, recipe: valid_attributes
        expect(response).not_to be_success
        expect(response).to redirect_to(new_user_session_path)
        expect(flash[:alert]).to eq('You need to sign in or sign up before continuing.')
      end
    end

    describe 'DELETE destroy' do
      let(:recipe) { build(:recipe) }
      before {
        expect(Recipe).not_to receive(:find).with('1')
      }
      it 'redirect user to the login page' do
        delete :destroy, params: { id: 1 }
        expect(response).not_to be_success
        expect(response).to redirect_to(new_user_session_path)
        expect(flash[:alert]).to eq('You need to sign in or sign up before continuing.')
      end
    end
  end

  context 'user is signed in' do
    login_user
    before :each do
      allow(controller).to receive(:user_signed_in?).and_return(true)
      allow(controller).to receive(:current_user).and_return(subject.current_user)
      allow(controller.current_user).to receive(:admin?).and_return(false)
      allow(controller).to receive(:authenticate_user!).and_return(subject.current_user)
    end

    context 'user is not admin' do
      describe 'GET new' do
        it 'render new template with success response' do
          get :new
          expect(response).to be_success
          expect(response).to render_template(:new)
        end
      end

      describe 'POST create' do
        it 'redirects user to the recipe page' do
          post :create, recipe: valid_attributes
          expect(response.status).to eq(302)
          expect(response).to redirect_to(recipe_path(subject.current_user.recipes.first))
          expect(flash[:notice]).to eq("Recipe '#{subject.current_user.recipes.first.title}' Created!")
        end
      end

      describe 'GET edit' do
        let(:recipe) { build(:recipe, user: subject.current_user) }
        let(:other_user) { create(:user) }
        let(:recipe_other_user) { create(:recipe, user: other_user) }

        before do |example|
          unless example.metadata[:skip_before]
            expect(Recipe).to receive(:find).with('1').and_return(recipe)
          end
        end

        it 'let user edit his recipe' do
          get :edit, params: { id: 1 }
          expect(response).to be_success
          expect(response).to render_template(:edit)
        end

        it 'prevent user from edit other user recipe', skip_before: true do
          get :edit, params: { id: recipe_other_user.id }
          expect(response).to redirect_to(root_path)
        end
      end

      describe 'PUT update' do
        it 'redirect user to the recipe page' do
          recipe = create(:recipe)
          put :update, id: recipe.to_param, recipe: valid_attributes
          expect(response).to redirect_to(recipe_path(recipe.id))
        end
      end

      describe 'DELETE destroy' do
        it 'redirect user to the recipes page' do
          recipe = create(:recipe)
          delete :destroy, id: recipe.to_param
          expect(response).to redirect_to(root_path)
        end
      end
    end

    context 'user is admin' do
      login_admin
      let(:invalid_attributes) do
        attributes = attributes_for(:recipe)
        attributes[:title] = ''
        attributes[:components] = ''
        attributes[:body] = ''
      end

      before do
        allow(controller.current_user).to receive(:admin?).and_return(true)
      end
    end
  end
end
