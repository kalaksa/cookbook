require 'test_helper'

class RecipesControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "should get index" do
    get recipes_path
    assert_response :success
  end

  test "should get show" do
    get recipe_path
    assert_response :success
  end

   test "should get new" do
     get new_recipe_path
     assert_response :success
   end

   test "should get create" do
     post recipes_path
     assert_response :success
   end

   test "should get destroy" do
     delete recipe_path
     assert_response :success
   end

   test "should get edit" do
     get edit_recipe_path
     assert_response :success
   end

   test "should get update" do
     patch recipe_path
     assert_response :success
   end
end
