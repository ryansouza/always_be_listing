require "minitest_helper"

describe ListsController do

  before do
    @list = lists(:one)
  end

  it "must get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lists)
  end

  it "must get new" do
    get :new
    assert_response :success
  end

  it "must create list" do
    assert_difference('List.count') do
      post :create, list: {  }
    end

    assert_redirected_to list_path(assigns(:list))
  end

  it "must show list" do
    get :show, id: @list
    assert_response :success
  end

  it "must get edit" do
    get :edit, id: @list
    assert_response :success
  end

  it "must update list" do
    put :update, id: @list, list: {  }
    assert_redirected_to list_path(assigns(:list))
  end

  it "must destroy list" do
    assert_difference('List.count', -1) do
      delete :destroy, id: @list
    end

    assert_redirected_to lists_path
  end

end
