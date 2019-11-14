class DojosController < ApplicationController
include ApplicationHelper
 #http_basic_authenticate_with name: "tnet", password: "sidekick"
  before_action :authenticate_user!
  def index
    @dojos = Dojo.all
	  @students = Student.all
  	@attendances = Attendance.all
    
    @mon = 0
    @tue = 0
    @wed = 0
    @thu = 0
    @fri = 0
    @sat = 0
    @sun = 0
    
    if @attendances.count != 0
    @attendances.each do |attend|
    	dow = attend.created_at.strftime("%A")
    	case dow
    	when "Monday"
    		@mon += 1
    	when "Tuesday"
    		@tue += 1
    	when "Wednesday"
    		@wed += 1
    	when "Thursday"
    		@thu += 1
    	when "Friday"
    		@fri += 1
    	when "Saturday"
    		@sat += 1
    	else
    		@sun += 1
    	end
    end
	end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @dojos }
    end
  end


  def show
    @dojo = Dojo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @dojo }
    end
  end


  def new
    @dojo = Dojo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @dojo }
    end
  end

  def edit
    @dojo = Dojo.find(params[:id])
    @indicator = @dojo.indicator
  end


  def create
    @dojo = Dojo.new(params[:dojo])

    respond_to do |format|
      if @dojo.save
        format.html { redirect_to @dojo, :notice => 'Dojo was successfully created.' }
        format.json { render :json => @dojo, :status => :created, :location => @dojo }
      else
        format.html { render :action => "new" }
        format.json { render :json => @dojo.errors, :status => :unprocessable_entity }
      end
    end
  end


  def update
    @dojo = Dojo.find(params[:id])
    @code = params[:code] #Get Code For Adding More Print Licenses
    @qty = getQty(@code) #Use ApplicationHelper Function to Get License Quantity from HEX CODE
    @dojo.max += @qty.to_i #Update the MAX Attribute for the Dojo
    respond_to do |format|
      if @dojo.update_attributes(dojo_params)
        format.html { redirect_to @dojo, :notice => 'Dojo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @dojo.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @dojo = Dojo.find(params[:id])
    @dojo.destroy

    respond_to do |format|
      format.html { redirect_to dojos_url }
      format.json { head :no_content }
    end
  end

   def dojo_params
    # we construct a strong parameters whitelist below
    # require(:post) means that the `params` hash MUST contain a :post key
    # permit(:title, :body, ...) = here we enumerate the attributes which we will accept from the form parameters; it acts as a whitelist
    params.require(:dojo).permit(:birthday_message,:missme_message,:pic,:code,:photo,:name,:motto,:telephone,:website,:email,:facebook,:twitter,:youtube) 
  end

end

