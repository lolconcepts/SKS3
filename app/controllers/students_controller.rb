class StudentsController < ApplicationController
  before_action :authenticate_user!
def index
    @students = Student.order("last_name").order("first_name")
    @missed = 0 #Counter of Students Who Are Missed, > 0 Appears on the View
    @students.each do |student|
      if(student.is_missed)
	      @missed += 1 #increment the @missed counter if a student is missed. Function is defined in Student.rb Model
      end
    end
    @dojo = Dojo.find 1
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @students }
      format.mobile
    end
  end

 
  def show
    @student = Student.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @student }
      format.mobile
    end
  end

 
  def new
    @student = Student.new
	@dojo = Dojo.find 1

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @student }
      format.mobile
    end
  end

  def missme
    # Mailer to Send to Missed Students; Initiated from the Students#Index Page
     student = Student.find(params[:id])
     StudentMailer.we_miss_you(student).deliver
     respond_to do |format|
       format.html { render :text => "Message has been sent" }
     end
  end
  
  def happyBirthday
    # Mailer to Send to Birthday Students; Initiated from the Students#Index Page
     student = Student.find(params[:id])
     StudentMailer.happy_birthday(student).deliver
     respond_to do |format|
       format.html { render :text => "Message has been sent" }
     end
  end

  def addme
    @student = Student.new
    @dojo = Dojo.find 1

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @student }
      format.mobile 
   end
  end

  def edit
    @student = Student.find(params[:id])
    @dojo = Dojo.first
  end

  def create
    @student = Student.new(student_params)

    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, :notice => 'Student was successfully created.' }
        format.json { render :json => @student, :status => :created, :location => @student }
        format.mobile {redirect_to @student, :notice => 'You have been successfully added'}
      else
        format.html { render :action => "new" }
        format.json { render :json => @student.errors, :status => :unprocessable_entity }
        format.mobile { render :action => "new" }
      end
    end
  end


  def update
    @student = Student.find(params[:id])

    respond_to do |format|
      if @student.update_attributes(student_params)
        format.html { redirect_to @student, :notice => 'Student was successfully updated.' }
        format.json { head :no_content }
        format.mobile { redirect_to @student, :notice => 'Student was successfully updated.' }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @student.errors, :status => :unprocessable_entity }
        format.mobile { render :action => "edit" }
      end
    end
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy

    respond_to do |format|
      format.html { redirect_to students_url }
      format.json { head :no_content }
      format.mobile { redirect_to students_url }
    end
  end
  
  def remove_pic
	@student = Student.find(params[:id])
	@student.pic = nil
		respond_to do |format|
      			if @student.save
        			format.html { redirect_to students_url, :notice => 'Photo was successfully deleted.' }
        			format.json { head :no_content }
				format.mobile { redirect_to students_url, :notice => 'Photo was successfully deleted.' }
      			else
        			format.html { render :action => "edit" }
        			format.json { render :json => @student.errors, :status => :unprocessable_entity }
				format.mobile { render :action => "edit" }
      			end
    		end

  end
  def get_id
        @student = Student.find(params[:id])
        @dojo = Dojo.find(1)
                respond_to do |format|
                        if @dojo.save
                                format.html { redirect_to students_url, :notice => 'Photo was successfully deleted.' }
                                format.json { head :no_content }
                                format.mobile { redirect_to students_url, :notice => 'Photo was successfully deleted.' }
                        else
                                format.html { render :action => "edit" }
                                format.json { render :json => @student.errors, :status => :unprocessable_entity }
                                format.mobile { render :action => "edit" }
                        end
                end

  end
  
  def identity
   @student = Student.find(params[:id])
   @dojo = Dojo.find(1)
     if @dojo.count.to_i < @dojo.max.to_i # Ensure that there are enough licenses to print an ID
   	    @dojo.count = @dojo.count + 1 #Remove a license
   	    @dojo.save
     else
	     redirect_to "http://www.t0urnament.net/nolicense.html"
     end
  end

  def createNewUser
    @student = Student.find(params[:id])
    @user = User.create(:student_id => @student.id,
                        :email => @student.email
                          )
  end

  def list
   	@students = Student.order("last_name").order("first_name")
   	@dojo = Dojo.find(1)
  end

  def student_params
    # we construct a strong parameters whitelist below
    # require(:post) means that the `params` hash MUST contain a :post key
    # permit(:title, :body, ...) = here we enumerate the attributes which we will accept from the form parameters; it acts as a whitelist
    params.require(:student).permit(:tuition,:pic,:first_name,:photo,:last_name,:address,:city,:state,:zip,:email,:telephone,:dob,:rank_id,:startdate,:instructors,:classes_attended_each_week,:school,:favorite_martial_artist,:favorite_movie,:favorite_class_activity,:short_term_goal,:long_term_goal,:blackbelt_club,:swat,:storm,:demo_team,:tournament_team,:cardiokick,:mastersclub,:instructor,:tnet_member,:tnetid) 
  end

end



