require "application_system_test_case"

class DetailsTest < ApplicationSystemTestCase
  setup do
    @detail = details(:one)
  end

  test "visiting the index" do
    visit details_url
    assert_selector "h1", text: "Details"
  end

  test "should create detail" do
    visit details_url
    click_on "New detail"

    fill_in "Amount", with: @detail.amount
    fill_in "Name", with: @detail.name
    fill_in "User", with: @detail.user_id
    click_on "Create Detail"

    assert_text "Detail was successfully created"
    click_on "Back"
  end

  test "should update Detail" do
    visit detail_url(@detail)
    click_on "Edit this detail", match: :first

    fill_in "Amount", with: @detail.amount
    fill_in "Name", with: @detail.name
    fill_in "User", with: @detail.user_id
    click_on "Update Detail"

    assert_text "Detail was successfully updated"
    click_on "Back"
  end

  test "should destroy Detail" do
    visit detail_url(@detail)
    click_on "Destroy this detail", match: :first

    assert_text "Detail was successfully destroyed"
  end
end
