class ClassSlipsController < ApplicationController
 # GET /class_slips
  # GET /class_slips.json
  def index
    @class_slips = ClassSlip.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @class_slips }
    end
  end

  # GET /class_slips/1
  # GET /class_slips/1.json
  def show
    @class_slip = ClassSlip.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @class_slip }
    end
  end

  # GET /class_slips/new
  # GET /class_slips/new.json
  def new
    @class_slip = ClassSlip.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @class_slip }
    end
  end

  # GET /class_slips/1/edit
  def edit
    @class_slip = ClassSlip.find(params[:id])
  end

  # POST /class_slips
  # POST /class_slips.json
  def create
    @class_slip = ClassSlip.new(params[:class_slip])

    respond_to do |format|
      if @class_slip.save
        format.html { redirect_to @class_slip, notice: 'Class slip was successfully created.' }
        format.json { render json: @class_slip, status: :created, location: @class_slip }
      else
        format.html { render action: "new" }
        format.json { render json: @class_slip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /class_slips/1
  # PUT /class_slips/1.json
  def update
    @class_slip = ClassSlip.find(params[:id])

    respond_to do |format|
      if @class_slip.update_attributes(params[:class_slip])
        format.html { redirect_to @class_slip, notice: 'Class slip was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @class_slip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /class_slips/1
  # DELETE /class_slips/1.json
  def destroy
    @class_slip = ClassSlip.find(params[:id])
    @class_slip.destroy

    respond_to do |format|
      format.html { redirect_to class_slips_url }
      format.json { head :no_content }
    end
  end
end

