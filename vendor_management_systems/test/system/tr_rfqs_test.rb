require "application_system_test_case"

class TrRfqsTest < ApplicationSystemTestCase
  setup do
    @tr_rfq = tr_rfqs(:one)
  end

  test "visiting the index" do
    visit tr_rfqs_url
    assert_selector "h1", text: "Tr Rfqs"
  end

  test "creating a Tr rfq" do
    visit tr_rfqs_url
    click_on "New Tr Rfq"

    fill_in "Created by", with: @tr_rfq.created_by
    fill_in "Delivery site", with: @tr_rfq.delivery_site
    fill_in "Description", with: @tr_rfq.description
    check "Is active" if @tr_rfq.is_active
    fill_in "Item name", with: @tr_rfq.item_name
    fill_in "Ms vendor type", with: @tr_rfq.ms_vendor_type_id
    fill_in "Need by date", with: @tr_rfq.need_by_date
    fill_in "Note", with: @tr_rfq.note
    fill_in "Status", with: @tr_rfq.status
    fill_in "Term of payment", with: @tr_rfq.term_of_payment
    fill_in "Updated by", with: @tr_rfq.updated_by
    click_on "Create Tr rfq"

    assert_text "Tr rfq was successfully created"
    click_on "Back"
  end

  test "updating a Tr rfq" do
    visit tr_rfqs_url
    click_on "Edit", match: :first

    fill_in "Created by", with: @tr_rfq.created_by
    fill_in "Delivery site", with: @tr_rfq.delivery_site
    fill_in "Description", with: @tr_rfq.description
    check "Is active" if @tr_rfq.is_active
    fill_in "Item name", with: @tr_rfq.item_name
    fill_in "Ms vendor type", with: @tr_rfq.ms_vendor_type_id
    fill_in "Need by date", with: @tr_rfq.need_by_date
    fill_in "Note", with: @tr_rfq.note
    fill_in "Status", with: @tr_rfq.status
    fill_in "Term of payment", with: @tr_rfq.term_of_payment
    fill_in "Updated by", with: @tr_rfq.updated_by
    click_on "Update Tr rfq"

    assert_text "Tr rfq was successfully updated"
    click_on "Back"
  end

  test "destroying a Tr rfq" do
    visit tr_rfqs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tr rfq was successfully destroyed"
  end
end
