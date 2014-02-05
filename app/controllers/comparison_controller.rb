class ComparisonController < ApplicationController

	require 'open-uri'
	require 'nokogiri'
	require 'json'



	def index
	end

	def show
		@store_id = params[:store_id]
		search = params[:search].to_s
		newsearch = search.gsub(/ /,'+')
		if @store_id == '1'
			bloom_url = "http://www1.bloomingdales.com/shop/search?keyword=#{newsearch}"
			bloom_doc = Nokogiri::HTML(open(bloom_url))
			@bloom = bloom_doc.css(".productThumbnail.showQuickView")
		elsif @store_id == '2'
			macy_url = "http://www1.macys.com/shop/search?keyword=#{newsearch}"
			macy_doc = Nokogiri::HTML(open(macy_url))
			@macy = macy_doc.css(".productThumbnail")
		elsif @store_id == '3'
			nord_url = "http://shop.nordstrom.com/sr?keyword=#{newsearch}&origin=keywordsearch&contextualcategoryid=0"
			nord_doc = Nokogiri::HTML(open(nord_url))
			@nord = nord_doc.css(".fashion-item")
		elsif @store_id == '4'
			sak_url = "http://www.saksfifthavenue.com/search/EndecaSearch.jsp?bmForm=endeca_search_form_one&bmFormID=kf_Qd57&bmUID=kf_Qd58&bmIsForm=true&bmPrevTemplate=%2Fsearch%2FEndecaSearch.jsp&bmText=SearchString&SearchString=#{newsearch}&submit-search=&bmSingle=N_Dim&N_Dim=0&bmHidden=Ntk&Ntk=Entire+Site&bmHidden=Ntx&Ntx=mode%2Bmatchpartialmax&bmHidden=prp8&prp8=t15&bmHidden=prp13&prp13=&bmHidden=sid&sid=143FDD7A465A"
			begin
				timeout(10) do 
			sak_doc = Nokogiri::HTML(open(sak_url))
			@sak = sak_doc.css("product-container")
			binding.pry
				end
			rescue Timeout::Error
			end
			
##########################################################
			# uri = URI.parse(sak_url)
			# binding.pry
			# http = Net::HTTP.new(uri.host, uri.port)
			# http.open_timeout = 10
			# http.read_timeout = 10
			# response = http.get(uri.path)
			# sak = Nokogiri.parse(response.body)
			# @sak = sak.css('product-container')
			##########################################################
			binding.pry

		end

			render :show
	end

end
