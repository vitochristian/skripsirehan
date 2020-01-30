require 'test_helper'

class TrRfqSubmissionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tr_rfq_submission = tr_rfq_submissions(:one)
  end

  test "should get index" do
    get tr_rfq_submissions_url
    assert_response :success
  end

  test "should get new" do
    get new_tr_rfq_submission_url
    assert_response :success
  end

  test "should create tr_rfq_submission" do
    assert_difference('TrRfqSubmission.count') do
      post tr_rfq_submissions_url, params: { tr_rfq_submission: { bidding_types: @tr_rfq_submission.bidding_types, created_by: @tr_rfq_submission.created_by, description: @tr_rfq_submission.description, incoterms: @tr_rfq_submission.incoterms, is_active: @tr_rfq_submission.is_active, need_by_date: @tr_rfq_submission.need_by_date, no_quotation: @tr_rfq_submission.no_quotation, note: @tr_rfq_submission.note, status: @tr_rfq_submission.status, term_of_payment: @tr_rfq_submission.term_of_payment, updated_by: @tr_rfq_submission.updated_by } }
    end

    assert_redirected_to tr_rfq_submission_url(TrRfqSubmission.last)
  end

  test "should show tr_rfq_submission" do
    get tr_rfq_submission_url(@tr_rfq_submission)
    assert_response :success
  end

  test "should get edit" do
    get edit_tr_rfq_submission_url(@tr_rfq_submission)
    assert_response :success
  end

  test "should update tr_rfq_submission" do
    patch tr_rfq_submission_url(@tr_rfq_submission), params: { tr_rfq_submission: { bidding_types: @tr_rfq_submission.bidding_types, created_by: @tr_rfq_submission.created_by, description: @tr_rfq_submission.description, incoterms: @tr_rfq_submission.incoterms, is_active: @tr_rfq_submission.is_active, need_by_date: @tr_rfq_submission.need_by_date, no_quotation: @tr_rfq_submission.no_quotation, note: @tr_rfq_submission.note, status: @tr_rfq_submission.status, term_of_payment: @tr_rfq_submission.term_of_payment, updated_by: @tr_rfq_submission.updated_by } }
    assert_redirected_to tr_rfq_submission_url(@tr_rfq_submission)
  end

  test "should destroy tr_rfq_submission" do
    assert_difference('TrRfqSubmission.count', -1) do
      delete tr_rfq_submission_url(@tr_rfq_submission)
    end

    assert_redirected_to tr_rfq_submissions_url
  end
end
