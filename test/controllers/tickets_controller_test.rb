require 'test_helper'

class TicketsControllerTest < ActionController::TestCase
   include Devise::TestHelpers

   setup do
     @ticket = create(:ticket, :pending, :low)
     @ticket.user = users(:user_one)
     @ticket.agent = users(:agent_one)
     sign_in @ticket.user
   end

   test "should get index" do
     get :index
     assert_response :success
     assert_not_nil assigns(:tickets)
   end

   test "should get new" do
     get :new
     assert_response :success
   end

   test "should create ticket" do
     assert_difference('Ticket.count') do
       post :create, ticket: @ticket.attributes
     end

     assert_redirected_to ticket_path(assigns(:ticket))
   end

   test "should show ticket" do
     get :show, id: @ticket.to_param
     assert_response :success
   end

   test "should get edit" do
     get :edit, id: @ticket.to_param
     assert_response :success
   end

   test "should update ticket" do
     put :update, id: @ticket.to_param, ticket: @ticket.attributes
     assert_redirected_to ticket_path(assigns(:ticket))
   end

   test "should destroy ticket" do
     assert_difference('Ticket.count', -1) do
       delete :destroy, id: @ticket.to_param
     end

     assert_redirected_to tickets_path
   end
end
