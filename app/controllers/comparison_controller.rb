class ComparisonController < ApplicationController

	require 'open-uri'
	require 'nokogiri'

	def index
	end


	def show
		search = params[:search]
		newsearch = search.gsub(/ /,'+')
		url = "http://www1.bloomingdales.com/shop/search?keyword=#{newsearch}"
		doc = Nokogiri::HTML(open(url))
		@testing = doc.css(".productThumbnail.showQuickView")
	end

end
