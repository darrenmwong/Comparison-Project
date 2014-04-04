require "spec_helper"

describe ComparisonController do 

	describe "GET index" do

		# it "should be 200" do
		# 	get :index
		# 	expect(response).status = "200"
		# end

		it "should render :index" do
			get :index
			expect(response).to render_template("index")
		end
	end
end