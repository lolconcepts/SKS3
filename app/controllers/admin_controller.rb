class AdminController < ApplicationController
def index
	@dojo = Dojo.first
end
end
