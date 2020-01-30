require "application_system_test_case"

class TrRfqSubmissionDtlsTest < ApplicationSystemTestCase
  setup do
    @tr_rfq_submission_dtl = tr_rfq_submission_dtls(:one)
  end

  test "visiting the index" do
    visit tr_rfq_submission_dtls_url
    assert_selector "h1", text: "Tr Rfq Submission Dtls"
  end

  test "creating a Tr rfq submission dtl" do
    visit tr_rfq_submission_dtls_url
    click_on "New Tr Rfq Submission Dtl"

    fill_in "Offered qty", with: @tr_rfq_submission_dtl.offered_qty
    fill_in "Price", with: @tr_rfq_submission_dtl.price
    fill_in "Tr rfq submission", with: @tr_rfq_submission_dtl.tr_rfq_submission_id
    click_on "Create Tr rfq submission dtl"

    assert_text "Tr rfq submission dtl was successfully created"
    click_on "Back"
  end

  test "updating a Tr rfq submission dtl" do
    visit tr_rfq_submission_dtls_url
    click_on "Edit", match: :first

    fill_in "Offered qty", with: @tr_rfq_submission_dtl.offered_qty
    fill_in "Price", with: @tr_rfq_submission_dtl.price
    fill_in "Tr rfq submission", with: @tr_rfq_submission_dtl.tr_rfq_submission_id
    click_on "Update Tr rfq submission dtl"

    assert_text "Tr rfq submission dtl was successfully updated"
    click_on "Back"
  end

  test "destroying a Tr rfq submission dtl" do
    visit tr_rfq_submission_dtls_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tr rfq submission dtl was successfully destroyed"
  end
end
