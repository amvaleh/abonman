require 'test_helper'

class PeopleControllerTest < ActionDispatch::IntegrationTest
  setup do
    @person = people(:one)
  end

  test "should get index" do
    get people_url
    assert_response :success
  end

  test "should get new" do
    get new_person_url
    assert_response :success
  end

  test "should create person" do
    assert_difference('Person.count') do
      post people_url, params: { person: { birthdate: @person.birthdate, city_id: @person.city_id, email: @person.email, gender_id: @person.gender_id, mobile_number: @person.mobile_number, name: @person.name, pay_amount: @person.pay_amount, pay_period: @person.pay_period, pay_start: @person.pay_start, phone_number: @person.phone_number } }
    end

    assert_redirected_to person_url(Person.last)
  end

  test "should show person" do
    get person_url(@person)
    assert_response :success
  end

  test "should get edit" do
    get edit_person_url(@person)
    assert_response :success
  end

  test "should update person" do
    patch person_url(@person), params: { person: { birthdate: @person.birthdate, city_id: @person.city_id, email: @person.email, gender_id: @person.gender_id, mobile_number: @person.mobile_number, name: @person.name, pay_amount: @person.pay_amount, pay_period: @person.pay_period, pay_start: @person.pay_start, phone_number: @person.phone_number } }
    assert_redirected_to person_url(@person)
  end

  test "should destroy person" do
    assert_difference('Person.count', -1) do
      delete person_url(@person)
    end

    assert_redirected_to people_url
  end
end
