require 'test_helper'

class NegotiatorControllerTest < ActionDispatch::IntegrationTest
  test 'should get input in html format by default' do
    get negotiator_input_url
    assert_response :success
    assert_equal 'text/html', @response.media_type
  end

  test 'should get view in html format by default' do
    get negotiator_view_url
    assert_response :success
    assert_equal 'text/html', @response.media_type
  end

  test 'should get view in xml format' do
    get "#{negotiator_view_url}.xml"
    assert_response :success
    assert_equal 'application/xml', @response.media_type
  end

  # Rich Site Summary — обогащённая сводка сайта
  test 'should get view in rss+xml format' do
    get "#{negotiator_view_url}.rss"
    assert_response :success
    assert_equal 'application/rss+xml', @response.media_type
  end

  test 'should get different responds for different requests' do
    get "#{negotiator_view_url}.rss?values=3+6+8+3+2+5+-5+3+2+5+7+4+121"
    response1 = @response.body.clone

    get "#{negotiator_view_url}.rss?values=45+76+12+45+56+4+-8+78+5+90"
    response2 = @response.body.clone
    
    assert_not_equal response1, response2
  end
end
