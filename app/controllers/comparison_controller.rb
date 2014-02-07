	require 'typhoeus'
	require 'nokogiri'
	require 'json'

class ComparisonController < ApplicationController





	def index
	end

	def modal
	end

	def moreInfo
		@price = params[:price]
		@description = params[:description]
		@img = params[:img]
		@store_id = params[:store_id]
		temp =@description.gsub(" ", '+')
		temp1 = temp.delete(",")
		temp2 = temp1.delete("'")
		temp3 = temp2.delete("-")
		newsearch = temp3
		if @store_id =='1'
			macy_url = "http://www1.macys.com/shop/search?keyword=#{newsearch}"
			macy_doc = Nokogiri::HTML(Typhoeus.get(macy_url).body)
			@macy = macy_doc.css(".productThumbnail")
			nord_url = "http://shop.nordstrom.com/sr?keyword=#{newsearch}&origin=keywordsearch&contextualcategoryid=0"
			nord_doc = Nokogiri::HTML(Typhoeus.get(nord_url).body)
			@nord = nord_doc.css(".fashion-item")
			barn_url = "http://www.barneys.com/on/demandware.store/Sites-BNY-Site/default/Search-Show?q=#{newsearch}"
			barn_doc = Nokogiri::HTML(Typhoeus.get(barn_url).body)
			@barn = barn_doc.css('.product.producttile')
		elsif @store_id == '2'
			bloom_url = "http://www1.bloomingdales.com/shop/search?keyword=#{newsearch}"
			bloom_doc = Nokogiri::HTML(Typhoeus.get(bloom_url).body)
			@bloom = bloom_doc.css(".productThumbnail.showQuickView")
			nord_url = "http://shop.nordstrom.com/sr?keyword=#{newsearch}&origin=keywordsearch&contextualcategoryid=0"
			nord_doc = Nokogiri::HTML(Typhoeus.get(nord_url).body)
			@nord = nord_doc.css(".fashion-item")
			barn_url = "http://www.barneys.com/on/demandware.store/Sites-BNY-Site/default/Search-Show?q=#{newsearch}"
			barn_doc = Nokogiri::HTML(Typhoeus.get(barn_url).body)
			@barn = barn_doc.css('.product.producttile')
		elsif @store_id == '3'
			bloom_url = "http://www1.bloomingdales.com/shop/search?keyword=#{newsearch}"
			bloom_doc = Nokogiri::HTML(Typhoeus.get(bloom_url).body)
			@bloom = bloom_doc.css(".productThumbnail.showQuickView")
			macy_url = "http://www1.macys.com/shop/search?keyword=#{newsearch}"
			macy_doc = Nokogiri::HTML(Typhoeus.get(macy_url).body)
			@macy = macy_doc.css(".productThumbnail")
			barn_url = "http://www.barneys.com/on/demandware.store/Sites-BNY-Site/default/Search-Show?q=#{newsearch}"
			barn_doc = Nokogiri::HTML(Typhoeus.get(barn_url).body)
			@barn = barn_doc.css('.standardprice')
		elsif @store_id == '4'
			bloom_url = "http://www1.bloomingdales.com/shop/search?keyword=#{newsearch}"
			bloom_doc = Nokogiri::HTML(Typhoeus.get(bloom_url).body)
			@bloom = bloom_doc.css(".productThumbnail.showQuickView")
			macy_url = "http://www1.macys.com/shop/search?keyword=#{newsearch}"
			macy_doc = Nokogiri::HTML(Typhoeus.get(macy_url).body)
			@macy = macy_doc.css(".productThumbnail")
			nord_url = "http://shop.nordstrom.com/sr?keyword=#{newsearch}&origin=keywordsearch&contextualcategoryid=0"
			nord_doc = Nokogiri::HTML(Typhoeus.get(nord_url).body)
			@nord = nord_doc.css(".fashion-item")
	end
	render :showResult
	end


	def show
		@store_id = params[:store_id]
		search = params[:search].to_s
		newsearch = search.gsub(/ /,'+')
		if @store_id == '1'
			bloom_url = "http://www1.bloomingdales.com/shop/search?keyword=#{newsearch}"
			bloom_doc = Nokogiri::HTML(Typhoeus.get(bloom_url).body)
			@bloom = bloom_doc.css(".productThumbnail.showQuickView")
		elsif @store_id == '2'
			macy_url = "http://www1.macys.com/shop/search?keyword=#{newsearch}"
			macy_doc = Nokogiri::HTML(Typhoeus.get(macy_url).body)
			@macy = macy_doc.css(".productThumbnail")
		elsif @store_id == '3'
			nord_url = "http://shop.nordstrom.com/sr?keyword=#{newsearch}&origin=keywordsearch&contextualcategoryid=0"
			nord_doc = Nokogiri::HTML(Typhoeus.get(nord_url).body)
			@nord = nord_doc.css(".fashion-item")
		elsif @store_id == '4'
			barn_url = "http://www.barneys.com/on/demandware.store/Sites-BNY-Site/default/Search-Show?q=#{newsearch}"
			barn_doc = Nokogiri::HTML(Typhoeus.get(barn_url).body)
			@barn = barn_doc.css('.product.producttile')
		elsif @store_id == '5'
			sak_url = "http://www.saksfifthavenue.com/search/EndecaSearch.jsp?bmForm=endeca_search_form_one&bmFormID=kf_Qd57&bmUID=kf_Qd58&bmIsForm=true&bmPrevTemplate=%2Fsearch%2FEndecaSearch.jsp&bmText=SearchString&SearchString=#{newsearch}&submit-search=&bmSingle=N_Dim&N_Dim=0&bmHidden=Ntk&Ntk=Entire+Site&bmHidden=Ntx&Ntx=mode%2Bmatchpartialmax&bmHidden=prp8&prp8=t15&bmHidden=prp13&prp13=&bmHidden=sid&sid=143FDD7A465A"
			# begin
			# 	timeout(10) do 

			sak_doc = Nokogiri::HTML(Typhoeus.get(sak_url).body)
			@sak = sak_doc
			binding.pry
			
			# binding.pry
			# 	end
			# rescue Timeout::Error
			# end
			
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

		end

			render :show
	end

end
