require "application_system_test_case"

class TrRfqSubmissionsTest < ApplicationSystemTestCase
  setup do
    @tr_rfq_submission = tr_rfq_submissions(:one)
  end

  test "visiting the index" do
    visit tr_rfq_submissions_url
    assert_selector "h1", text: "Tr Rfq Submissions"
  end

  test "creating a Tr rfq submission" do
    visit tr_rfq_submissions_url
    click_on "New Tr Rfq Submission"

    fill_in "Bidding types", with: @tr_rfq_submission.bidding_types
    fill_in "Created by", with: @tr_rfq_submission.created_by
    fill_in "Description", with: @tr_rfq_submission.description
    fill_in "Incoterms", with: @tr_rfq_submission.incoterms
    check "Is active" if @tr_rfq_submission.is_active
    fill_in "Need by date", with: @tr_rfq_submission.need_by_date
    fill_in "No quotation", with: @tr_rfq_submission.no_quotation
    fill_in "Note", with: @tr_rfq_submission.note
    fill_in "Status", with: @tr_rfq_submission.status
    fill_in "Term of payment", with: @tr_rfq_submission.term_of_payment
    fill_in "Updated by", with: @tr_rfq_submission.updated_by
    click_on "Create Tr rfq submission"

    assert_text "Tr rfq submission was successfully created"
    click_on "Back"
  end

  test "updating a Tr rfq submission" do
    visit tr_rfq_submissions_url
    click_on "Edit", match: :first

    fill_in "Bidding types", with: @tr_rfq_submission.bidding_types
    fill_in "Created by", with: @tr_rfq_submission.created_by
    fill_in "Description", with: @tr_rfq_submission.description
    fill_in "Incoterms", with: @tr_rfq_submission.incoterms
    check "Is active" if @tr_rfq_submission.is_active
    fill_in "Need by date", with: @tr_rfq_submission.need_by_date
    fill_in "No quotation", with: @tr_rfq_submission.no_quotation
    fill_in "Note", with: @tr_rfq_submission.note
    fill_in "Status", with: @tr_rfq_submission.status
    fill_in "Term of payment", with: @tr_rfq_submission.term_of_payment
    fill_in "Updated by", with: @tr_rfq_submission.updated_by
    click_on "Update Tr rfq submission"

    assert_text "Tr rfq submission was successfully updated"
    click_on "Back"
  end

  test "destroying a Tr rfq submission" do
    visit tr_rfq_submissions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tr rfq submission was successfully destroyed"
  end
end
