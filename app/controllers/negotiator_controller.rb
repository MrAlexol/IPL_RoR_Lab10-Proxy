require 'http'
require 'nokogiri'

# Класс контроллера-посредника
class NegotiatorController < ApplicationController
  def input
  end

  def view
    make_query 'http://localhost:3000/sequence/view'
    respond_to do |format|
      format.html do
        doc = Nokogiri::XML(@responce)
        xslt = Nokogiri::XSLT(File.read(File.expand_path('../assets/stylesheets/style.xsl', __dir__)))
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
    make_query 'http://localhost:3000/sequence/view'
    render xml: @responce
  end

  def xslt
    send_data(File.read(File.expand_path('../assets/stylesheets/style.xsl', __dir__)),
              type: 'text/xml', filename: 'xslt.xsl')
  end

  private

  def make_query(server_url)
    query_str = "#{server_url}.xml"
    query_str << "?values=#{@input}" if (@input = params[:values]&.split(' ')&.join('+'))
    @responce = HTTP.get(query_str).body
    nil
  end
end
