class AdminController < ApplicationController
before_action :authenticate_user!
def index
	@dojo = Dojo.first
end
end
