class ScrapperController < ApplicationController
  require 'rubygems'
  require 'nokogiri'
  require 'open-uri'

    def scrap
    page_url = params[:site_url]
    doc = Nokogiri::HTML(open(page_url))
    Store.save_data page_url
    @title = doc.at_css("title").text
    @description = doc.at_css("description")
    @images = []
    doc.css("img").each do |item|
      absolute_uri = URI.join( page_url,item[:src]  ).to_s
      @images << absolute_uri
    end
      render :json => { :images =>@images,:title =>@title,:description => @description ,:image_count=> @images.count }.to_json
  end
end
