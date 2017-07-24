require 'rails_helper'

describe RecipesController do
  let(:valid_attributes) { attributes_for(:recipe) }

  context 'user is not signed in' do
    describe 'GET index' do
      it 'exposes all recipes' do
        recipe = create(:recipe)
        get :index
        expect(assigns(:recipes)).to eq([recipe])
      end
    end

    describe 'GET show' do
      it 'exposes the requested book' do
        recipe = create(:recipe)
        get :show, id: recipe.to_param
        expect(assigns(:recipe)).to eq(recipe)
      end
    end

    describe 'GET new' do
      it 'redirects user to the login page' do
        get :new
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe 'POST create' do
      it 'redirects user to the login page' do
        post :create, recipe: valid_attributes
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe 'GET edit' do
      it 'redirects user to the login page' do
        recipe = create(:recipe)
        get :edit, id: recipe.to_param
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe 'PUT update' do
      it 'redirects user to the login page' do
        recipe = create(:recipe)
        put :update, id: recipe.to_param, recipe: valid_attributes
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe 'DELETE destroy' do
      it 'redirect user to the login page' do
        recipe = create(:recipe)
        delete :destroy, id: recipe.to_param
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  context 'user is signed in' do

    before :each do
      user = FactoryGirl.create :user
      sign_in user
      allow(controller).to receive(:user_signed_in?).and_return(true)
      # allow(controller).to receive(:current_user).and_return(user)
      allow(controller.current_user).to receive(:admin?).and_return(false)
      # allow(controller).to receive(:authenticate_user!).and_return(user)
    end

    # before do
    #   allow(controller).to receive(:user_signed_in?).and_return(true)
      # allow(controller).to receive(:current_user).and_return(user)
      # allow(controller.current_user).to receive(:admin?).and_return(false)
      # allow(controller).to receive(:authenticate_user!).and_return(user)
    # end

    context 'user is not admin' do
      describe 'GET new' do
        # login_user
        it 'redirects user to the recipe page' do
          get :new
          expect(response).to redirect_to(new_recipe_path)
        end
      end

      describe 'POST create' do
        it 'redirects user to the recipe page' do
          post :create, recipe: valid_attributes
          expect(response).to redirect_to(recipe_path(@recipe))
          expect(flash[:alert]).to eq("Recipe 'test' Created!")
        end
      end

      describe 'GET edit' do
        it 'redirects user to the recipe page' do
          recipe = create(:recipe)
          get :edit, id: recipe.to_param
          expect(response).to redirect_to(edit_recipe_path(recipe.id))
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
