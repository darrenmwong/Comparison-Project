class ComparisonController < ApplicationController

	require 'open-uri'
	require 'nokogiri'
	require 'json'

	api_key = 'mwq34bwv75gb4x486dffhtyd'


	def index
	end


	def show
		search = params[:search]
		newsearch = search.gsub(/ /,'+')
		nord_url = "http://shop.nordstrom.com/sr?keyword=#{newsearch}&origin=keywordsearch&contextualcategoryid=0"
		macy_url = "http://www1.macys.com/shop/search?keyword=#{newsearch}"
		bloom_url = "http://www1.bloomingdales.com/shop/search?keyword=#{newsearch}"
		bloom_doc = Nokogiri::HTML(open(bloom_url))
		macy_doc = Nokogiri::HTML(open(macy_url))
		nord_doc = Nokogiri::HTML(open(nord_url))
		@bloom = bloom_doc.css(".productThumbnail.showQuickView")
		@macy = macy_doc.css(".productThumbnail")
		@nord = nord_doc.css(".fashion-results")


	end

end
