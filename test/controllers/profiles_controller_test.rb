require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  setup do
    @profile = profiles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:profiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create profile" do
    assert_difference('Profile.count') do
      post :create, profile: { cover_letter: @profile.cover_letter, email: @profile.email, full_name: @profile.full_name, phone_number: @profile.phone_number, position: @profile.position, reference: @profile.reference, resume: @profile.resume, years_of_experiance: @profile.years_of_experiance }
    end

    assert_redirected_to profile_path(assigns(:profile))
  end

  test "should show profile" do
    get :show, id: @profile
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @profile
    assert_response :success
  end

  test "should update profile" do
    patch :update, id: @profile, profile: { cover_letter: @profile.cover_letter, email: @profile.email, full_name: @profile.full_name, phone_number: @profile.phone_number, position: @profile.position, reference: @profile.reference, resume: @profile.resume, years_of_experiance: @profile.years_of_experiance }
    assert_redirected_to profile_path(assigns(:profile))
  end

  test "should destroy profile" do
    assert_difference('Profile.count', -1) do
      delete :destroy, id: @profile
    end

    assert_redirected_to profiles_path
  end
end
