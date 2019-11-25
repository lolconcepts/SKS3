class WelcomesController < ApplicationController
protect_from_forgery
before_action :authenticate_user!#:require_http_basic_auth if Rails.env == "development"

def require_http_basic_auth 
	authenticate_or_request_with_http_basic do | login, password|
	 	if login == "sidekick" && password == "sandbox"
			return true
		else
			return false
		end
	end
end

  def index
	if Dojo.all.count == 0 #DB has been reset
		@dojo = Dojo.create
		@dojo.name = "Initial Configuration"
		@dojo.motto = "..."
		@dojo.telephone = "(401)461-1346"
		@dojo.email = "blackbelt@t0urnament.net"
		@dojo.twitter = "t0urnamentNET"
		@dojo.facebook = "https://www.facebook.com/t0urnamentNET"
		@dojo.youtube = "t0urnamentNET"
  		@dojo.website = "http://www.t0urnament.net"
  		@dojo.max = 100 # Configure Default Max Print Licences
  		@dojo.count = 0 # Starts as ZERO
		@dojo.save
	end
	if Rank.all.count == 0 #DB has been reset
		Rank.create(:color => 'White Belt',:base=> 'white')
    	Rank.create(:color => 'Adv.White Belt',:base=> 'white')
    	Rank.create(:color => 'Yellow Belt',:base=> 'yellow')
    	Rank.create(:color => 'Adv.Yellow Belt',:base=> 'yellow')
    	Rank.create(:color => 'Orange Belt',:base=> 'orange')
    	Rank.create(:color => 'Adv.Orange Belt',:base=> 'orange')
    	Rank.create(:color => 'Purple Belt',:base=> 'purple')
    	Rank.create(:color => 'Blue Belt',:base=> 'blue')
    	Rank.create(:color => 'Green Belt',:base=> 'green')
    	Rank.create(:color => 'Brown Belt',:base=> 'brown')
    	Rank.create(:color => '3rd Degree Brown Belt',:base=> 'brown')
    	Rank.create(:color => '2nd Degree Brown Belt',:base=> 'brown')
    	Rank.create(:color => '1st Degree Brown Belt',:base=> 'brown')
    	Rank.create(:color => 'Junior Black Belt',:base=> 'black')
    	Rank.create(:color => '1st Degree Black Belt',:base=> 'black')
    	Rank.create(:color => '2nd Degree Black Belt',:base=> 'black')
    	Rank.create(:color => '3rd Degree Black Belt',:base=> 'black')
    	Rank.create(:color => '4th Degree Black Belt',:base=> 'black')
    	Rank.create(:color => '5th Degree Black Belt',:base=> 'black')
    	Rank.create(:color => '6th Degree Black Belt',:base=> 'black')
    	Rank.create(:color => '7th Degree Black Belt',:base=> 'black')
    	Rank.create(:color => '8th Degree Black Belt',:base=> 'black')
    	Rank.create(:color => '9th Degree Black Belt',:base=> 'black')
    	Rank.create(:color => '10th Degree Black Belt',:base=> 'black')
	end
	
    @students = Student.all
    @sidekick_ip = "Not Available"
    Socket.ip_address_list.each do |ip_addr|
    	if ip_addr.ip_address != "127.0.0.1"
		@sidekick_ip = ip_addr.ip_address
   	end 
    end

respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @welcomes }
    end
  end

  def reset_sandbox
    if Rank.all.count == 0
	Rank.create(:color => 'White Belt',:base=> 'white')
    Rank.create(:color => 'Adv.White Belt',:base=> 'white')
    Rank.create(:color => 'Yellow Belt',:base=> 'yellow')
    Rank.create(:color => 'Adv.Yellow Belt',:base=> 'yellow')
    Rank.create(:color => 'Orange Belt',:base=> 'orange')
    Rank.create(:color => 'Adv.Orange Belt',:base=> 'orange')
    Rank.create(:color => 'Purple Belt',:base=> 'purple')
    Rank.create(:color => 'Blue Belt',:base=> 'blue')
    Rank.create(:color => 'Green Belt',:base=> 'green')
    Rank.create(:color => 'Brown Belt',:base=> 'brown')
    Rank.create(:color => '3rd Degree Brown Belt',:base=> 'brown')
    Rank.create(:color => '2nd Degree Brown Belt',:base=> 'brown')
    Rank.create(:color => '1st Degree Brown Belt',:base=> 'brown')
    Rank.create(:color => 'Junior Black Belt',:base=> 'black')
    Rank.create(:color => '1st Degree Black Belt',:base=> 'black')
    Rank.create(:color => '2nd Degree Black Belt',:base=> 'black')
    Rank.create(:color => '3rd Degree Black Belt',:base=> 'black')
    Rank.create(:color => '4th Degree Black Belt',:base=> 'black')
    Rank.create(:color => '5th Degree Black Belt',:base=> 'black')
    Rank.create(:color => '6th Degree Black Belt',:base=> 'black')
    Rank.create(:color => '7th Degree Black Belt',:base=> 'black')
    Rank.create(:color => '8th Degree Black Belt',:base=> 'black')
    Rank.create(:color => '9th Degree Black Belt',:base=> 'black')
    Rank.create(:color => '10th Degree Black Belt',:base=> 'black')
	end
    if Dojo.all.count == 0 #Was The Database Reset?
      @dojo = Dojo.create
    else
	    @dojo = Dojo.find(1)
    end
	@dojo.name = "Test Karate School"
	@dojo.motto = "motto"
	@dojo.telephone = "(401)461-1346"
	@dojo.email = "blackbelt@t0urnament.net"
	@dojo.twitter = ""
	@dojo.facebook = ""
	@dojo.youtube = ""
  @dojo.website = ""
  @dojo.max = 100 # Configure Default Max Print Licences
  @dojo.count = 0 # Starts as ZERO
  @dojo.photo_file_name = nil
  @dojo.photo_content_type = nil
  @dojo.photo_file_size = nil
	respond_to do |format|
      		if @dojo.save && Student.delete_all && Attendance.delete_all
        		format.html { redirect_to @dojo, :notice => 'SideKick Config Was Successfully Reset' }
        		format.json { render :json => @dojo, :status => :created, :location => @dojo }
      		else
        		format.html { render :action => "new" }
        		format.json { render :json => @dojo.errors, :status => :unprocessable_entity }
      		end
    	end

end

   def do_demo
  	@first_names = ["Adam","Andrew","Bobby","James","Tony","Alex","Mike","Tim","Kevin","Angela","Jenn","Kathy","Kelley","Melissa","Gina","Sarah"]
    @last_names = ["Smith","Jones","Stonestreet","Taylor","Brown","Clinker","Carini","Spaulding","Seidel","Evers","Dever","Coffey"]
  	@badges = [true,false]
  	@ranks = Rank.all
  	@instructors = ["Mr. Dave","Miss Claire","Mr. Roy"]
  	@martial_artist = ["Chuck Norris","Bruce Lee","Don Wilson","Jett Li","Jackie Chan","Jeff Speakman"]
  	@class_activity = ["Techniques","Sparring","Bag Work","Mat Work","Weapons","Forms"]
  	@short_term = ["Next Belt","1st Place in Forms","Grand-Champion","A Split"]
  	@long_term = ["Black Belt","Be in a movie","Meet my hero","Be Successful"]
  	@movie = ["Karate Kid","I am Legend","Last Dragon","The Crow","Power Rangers","TMNT","Bloodsport","Oceans of the Deep"]
  	@years_in = rand(0..5)
    @street_no = rand(1..1500)
    @street_type = ["St","Rd","Ave","Dr"]
    @street_names = ["Main","Rocky","Washington","Orchard","Massachusetts","Auburn","Old Coach","Pleasant","Kingman","Holly","Elmwood","Poenix"]
    @city = ["Cranston","Warwick","Providence","Coventry","Woonsocket","Cumberland","Harmony","Foster","Pawtucket"]
    @state = ["RI"]
  	@school = Dojo.find(1).name
    @bdays = ["12/1/2008","04/18/1979","12/5/1973","01/16/2011","2/25/2012","7/25/2000","7/25/1952","3/23/1997","7/11/1948","9/12/1978"]

  	5.times do
      # @ranMon = rand(1..12)
      # @ranDay = rand(1..27)
      # @ranYear = rand(5..50).years.ago.year
      # @bday = "#{@ranMon}/#{@ranDay}/#{@ranYear}"
			Student.create(
                :first_name => @first_names.sample,
			       	  :last_name => @last_names.sample,
			       	  :age => rand(5..50),
			       	  :dob => @bdays.sample,
				        :rank_id => @ranks.sample.id,
			       	  :years_in_martial_arts => @years_in,
			       	  :startdate => @years_in.years.ago,
				        :instructors => @instructors.sample,
				        :school => @school,
			       	  :classes_attended_each_week => rand(1..7),
			       	  :blackbelt_club => @badges.sample,
			       	  :swat => @badges.sample,
			       	  :storm => @badges.sample,
			       	  :demo_team => @badges.sample,
			       	  :tournament_team => @badges.sample,
			       	  :favorite_martial_artist => @martial_artist.sample,
			       	  :favorite_movie => @movie.sample,
			       	  :favorite_class_activity => @class_activity.sample,
			       	  :short_term_goal => @short_term.sample,
			       	  :long_term_goal => @long_term.sample,
			       	  :tnetid => rand(10000..15000),
                	  :stripe => rand(1..3),
			       	  :tnet_member => true,
                	  :address => "#{@street_no} #{@street_names.sample} #{@street_type.sample}",
				      :city => @city.sample,
				      :state => @state.sample,
				      :zip => "02910",
				      :email => "blackbelt@t0urnament.net",
				      :telephone => "4015551234",
			       	  :cardiokick => @badges.sample)
	    	end
	    @s = Student.all
	    @s.each do |st|
		rand(30..50).times do 
			@a = Attendance.create
	                @a.created_at = rand(1..60).days.ago
                        @a.student = st
			@a.save
		end
	     end

       #fix blank dob
       @s.each do |student|
        if student.dob == nil
          student.destroy
        end
       end
			respond_to do |format|
                		if Student.count >= 5
                        		format.html { redirect_to students_path, :notice => 'SideKick PWS Demo Load Complete!' }
              
                		else
                        		format.html { redirect_to dojos_path }
                     
                		end
        		end

   end
end

