require 'test_helper'

class TrRfqsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tr_rfq = tr_rfqs(:one)
  end

  test "should get index" do
    get tr_rfqs_url
    assert_response :success
  end

  test "should get new" do
    get new_tr_rfq_url
    assert_response :success
  end

  test "should create tr_rfq" do
    assert_difference('TrRfq.count') do
      post tr_rfqs_url, params: { tr_rfq: { created_by: @tr_rfq.created_by, delivery_sie: @tr_rfq.delivery_sie, description: @tr_rfq.description, expiration_date: @tr_rfq.expiration_date, is_active: @tr_rfq.is_active, item_name: @tr_rfq.item_name, ms_vendor_type_id: @tr_rfq.ms_vendor_type_id, need_by_date: @tr_rfq.need_by_date, no_rfq: @tr_rfq.no_rfq, note: @tr_rfq.note, qty: @tr_rfq.qty, status: @tr_rfq.status, term_of_payment: @tr_rfq.term_of_payment, uom: @tr_rfq.uom, updated_by: @tr_rfq.updated_by } }
    end

    assert_redirected_to tr_rfq_url(TrRfq.last)
  end

  test "should show tr_rfq" do
    get tr_rfq_url(@tr_rfq)
    assert_response :success
  end

  test "should get edit" do
    get edit_tr_rfq_url(@tr_rfq)
    assert_response :success
  end

  test "should update tr_rfq" do
    patch tr_rfq_url(@tr_rfq), params: { tr_rfq: { created_by: @tr_rfq.created_by, delivery_sie: @tr_rfq.delivery_sie, description: @tr_rfq.description, expiration_date: @tr_rfq.expiration_date, is_active: @tr_rfq.is_active, item_name: @tr_rfq.item_name, ms_vendor_type_id: @tr_rfq.ms_vendor_type_id, need_by_date: @tr_rfq.need_by_date, no_rfq: @tr_rfq.no_rfq, note: @tr_rfq.note, qty: @tr_rfq.qty, status: @tr_rfq.status, term_of_payment: @tr_rfq.term_of_payment, uom: @tr_rfq.uom, updated_by: @tr_rfq.updated_by } }
    assert_redirected_to tr_rfq_url(@tr_rfq)
  end

  test "should destroy tr_rfq" do
    assert_difference('TrRfq.count', -1) do
      delete tr_rfq_url(@tr_rfq)
    end

    assert_redirected_to tr_rfqs_url
  end
end
