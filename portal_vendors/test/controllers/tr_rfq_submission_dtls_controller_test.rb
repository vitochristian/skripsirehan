require 'test_helper'

class TrRfqSubmissionDtlsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tr_rfq_submission_dtl = tr_rfq_submission_dtls(:one)
  end

  test "should get index" do
    get tr_rfq_submission_dtls_url
    assert_response :success
  end

  test "should get new" do
    get new_tr_rfq_submission_dtl_url
    assert_response :success
  end

  test "should create tr_rfq_submission_dtl" do
    assert_difference('TrRfqSubmissionDtl.count') do
      post tr_rfq_submission_dtls_url, params: { tr_rfq_submission_dtl: { offered_qty: @tr_rfq_submission_dtl.offered_qty, price: @tr_rfq_submission_dtl.price, tr_rfq_submission_id: @tr_rfq_submission_dtl.tr_rfq_submission_id } }
    end

    assert_redirected_to tr_rfq_submission_dtl_url(TrRfqSubmissionDtl.last)
  end

  test "should show tr_rfq_submission_dtl" do
    get tr_rfq_submission_dtl_url(@tr_rfq_submission_dtl)
    assert_response :success
  end

  test "should get edit" do
    get edit_tr_rfq_submission_dtl_url(@tr_rfq_submission_dtl)
    assert_response :success
  end

  test "should update tr_rfq_submission_dtl" do
    patch tr_rfq_submission_dtl_url(@tr_rfq_submission_dtl), params: { tr_rfq_submission_dtl: { offered_qty: @tr_rfq_submission_dtl.offered_qty, price: @tr_rfq_submission_dtl.price, tr_rfq_submission_id: @tr_rfq_submission_dtl.tr_rfq_submission_id } }
    assert_redirected_to tr_rfq_submission_dtl_url(@tr_rfq_submission_dtl)
  end

  test "should destroy tr_rfq_submission_dtl" do
    assert_difference('TrRfqSubmissionDtl.count', -1) do
      delete tr_rfq_submission_dtl_url(@tr_rfq_submission_dtl)
    end

    assert_redirected_to tr_rfq_submission_dtls_url
  end
end
