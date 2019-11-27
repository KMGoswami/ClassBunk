require "application_system_test_case"

class ClassmatesTest < ApplicationSystemTestCase
  setup do
    @classmate = classmates(:one)
  end

  test "visiting the index" do
    visit classmates_url
    assert_selector "h1", text: "Classmates"
  end

  test "creating a Classmate" do
    visit classmates_url
    click_on "New Classmate"

    check "Blocked" if @classmate.blocked
    click_on "Create Classmate"

    assert_text "Classmate was successfully created"
    click_on "Back"
  end

  test "updating a Classmate" do
    visit classmates_url
    click_on "Edit", match: :first

    check "Blocked" if @classmate.blocked
    click_on "Update Classmate"

    assert_text "Classmate was successfully updated"
    click_on "Back"
  end

  test "destroying a Classmate" do
    visit classmates_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Classmate was successfully destroyed"
  end
end
