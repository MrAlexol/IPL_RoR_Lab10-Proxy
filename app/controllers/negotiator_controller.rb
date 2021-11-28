# frozen_string_literal: true

require 'http'
require 'nokogiri'

# Класс контроллера-посредника
class NegotiatorController < ApplicationController
  BASE_API_URL           = 'http://localhost:3000/sequence/view'
  XSLT_BROWSER_TRANSFORM = '/browser_transform.xslt'
  XSLT_SERVER_TRANSFORM  = "#{Rails.root}/public/server_transform.xslt"

  def input
  end

  def view
    @responce = make_query BASE_API_URL
    respond_to do |format|
      format.html do
        doc = Nokogiri::XML(@responce)
        xslt = Nokogiri::XSLT(File.read(XSLT_SERVER_TRANSFORM))
        @output = xslt.transform(doc)
        render 'view'
      end
      format.xml do
        render 'view'
      end
    end
    puts @responce.class
  end

  def rawview
    @responce = make_query BASE_API_URL
    render xml: @responce
  end

  private

  def make_query(server_url)
    query_str = "#{server_url}.xml"
    query_str << "?values=#{@input}" if (@input = params[:values]&.split(' ')&.join('+'))
    HTTP.get(query_str).body
  end
end
