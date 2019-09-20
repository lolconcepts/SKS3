class AttendancesController < ApplicationController
 # GET /attendances
  # GET /attendances.json
  def index
    if params[:id] && Student.find(params[:id])
	@student = Student.find(params[:id])
        @student_attendances = Attendance.where(:student_id => @student.id).order('created_at DESC')
	@smon = 0
    	@stue = 0
    	@swed = 0
    	@sthu = 0
    	@sfri = 0
    	@ssat = 0
    	@ssun = 0
	@student_attendances.each do |attend|
        dow = attend.created_at.strftime("%A")
        case dow
        when "Monday"
                @smon += 1
        when "Tuesday"
                @stue += 1
        when "Wednesday"
                @swed += 1
        when "Thursday"
                @sthu += 1
        when "Friday"
                @sfri += 1
        when "Saturday"
                @ssat += 1
        else
                @ssun += 1
        end
    end

     end
    if @student != nil
    	@attendances = Attendance.where("student_id != ?",@student.id)
    else
	@attendances = Attendance.find(:all)
    end
    @mon = 0
    @tue = 0
    @wed = 0
    @thu = 0
    @fri = 0
    @sat = 0
    @sun = 0
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
    if @student != nil
	@attendances = @student_attendances
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @attendances }
    end
  end

  # GET /attendances/1
  # GET /attendances/1.json
  def show
    @attendance = Attendance.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @attendance }
    end
  end

  # GET /attendances/new
  # GET /attendances/new.json
  def new
    @attendance = Attendance.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @attendance }
    end
  end

  # GET /attendances/1/edit
  def edit
    @attendance = Attendance.find(params[:id])
  end

  # POST /attendances
  # POST /attendances.json
  def create
    @attendance = Attendance.new(params[:attendance])

    respond_to do |format|
      if @attendance.save
        format.html { render plain: "Attendance was successfully created." }
        format.json { render json: @attendance, status: :created, location: @attendance }
      else
        format.html { render action: "new" }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
  end


  def attend
    @attendance = Attendance.new
    @attendance.student = Student.find(params[:id])
    @attendance.save
    @attendance.dow = @attendance.created_at.strftime("%A")
    @attendance.save
    respond_to do |format|
      if @attendance.save
        format.html { render plain: "Attendance was successfully created." }
        format.json { render json: @attendance, status: :created, location: @attendance }
        format.mobile
      else
        format.html { render action: "new" }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
        format.mobile
      end
    end
  end
 
  # PUT /attendances/1
  # PUT /attendances/1.json
  def update
    @attendance = Attendance.find(params[:id])

    respond_to do |format|
      if @attendance.update_attributes(params[:attendance])
        format.html { redirect_to @attendance, notice: 'Attendance was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attendances/1
  # DELETE /attendances/1.json
  def destroy
    @attendance = Attendance.find(params[:id])
    @attendance.destroy

    respond_to do |format|
      format.html { redirect_to attendances_url }
      format.json { head :no_content }
    end
  end
end

