class HomeController < ApplicationController
  def index
  	@newest_search_terms = Keyword.last(10).reverse
  end
end
