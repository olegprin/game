require 'test_helper'

class CategoryFilmsControllerTest < ActionController::TestCase
  setup do
    @category_film = category_films(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:category_films)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create category_film" do
    assert_difference('CategoryFilm.count') do
      post :create, category_film: { category: @category_film.category, film_id: @category_film.film_id, integer: @category_film.integer }
    end

    assert_redirected_to category_film_path(assigns(:category_film))
  end

  test "should show category_film" do
    get :show, id: @category_film
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @category_film
    assert_response :success
  end

  test "should update category_film" do
    patch :update, id: @category_film, category_film: { category: @category_film.category, film_id: @category_film.film_id, integer: @category_film.integer }
    assert_redirected_to category_film_path(assigns(:category_film))
  end

  test "should destroy category_film" do
    assert_difference('CategoryFilm.count', -1) do
      delete :destroy, id: @category_film
    end

    assert_redirected_to category_films_path
  end
end
