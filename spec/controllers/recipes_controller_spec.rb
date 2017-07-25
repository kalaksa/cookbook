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
      allow(controller).to receive(:current_user).and_return(user)
      allow(controller.current_user).to receive(:admin?).and_return(false)
      allow(controller).to receive(:authenticate_user!).and_return(user)
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
        it 'assigns current user to the new recipe' do
          get :new
          new_recipe = assigns(:recipe)
          expect(response).not_to redirect_to(new_user_session_path)
          expect(new_recipe.user_id).to eq(controller.current_user.id)
        end
      end

      describe 'POST create' do
        it 'redirects user to the recipe page' do
          post :create, recipe: valid_attributes
          new_recipe = assigns(:recipe)
          expect(response).to redirect_to(recipe_path(new_recipe))
          expect(flash[:notice]).to eq("Recipe '#{new_recipe.title}' Created!")
        end
      end

      describe 'GET edit' do
        it 'let user edit his recipe' do
          recipe = create(:recipe, user: controller.current_user)
          get :edit, id: recipe.to_param
          expect(response).not_to redirect_to(new_user_session_path)
          expect(assigns(:recipe).user_id).to eq(controller.current_user.id)
        end

        it 'prevent user from edit other user recipe' do
          other_user = FactoryGirl.create :user
          recipe = create(:recipe, user: other_user)
          get :edit, id: recipe.to_param
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
