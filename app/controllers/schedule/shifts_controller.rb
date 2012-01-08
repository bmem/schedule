module Schedule
  class ShiftsController < ApplicationController
    # GET /shifts
    # GET /shifts.json
    def index
      respond_to do |format|
        format.html # index.html.erb
        format.json { render :json => @shifts }
      end
    end

    # GET /shifts/1
    # GET /shifts/1.json
    def show
      respond_to do |format|
        format.html # show.html.erb
        format.json { render :json => @shift }
      end
    end

    # GET /shifts/new
    # GET /shifts/new.json
    def new
      respond_to do |format|
        format.html # new.html.erb
        format.json { render :json => @shift }
      end
    end

    # GET /shifts/1/edit
    def edit
    end

    # POST /shifts
    # POST /shifts.json
    def create
      respond_to do |format|
        if @shift.save
          format.html { redirect_to @shift, :notice => 'Shift was successfully created.' }
          format.json { render :json => @shift, :status => :created, :location => @shift }
        else
          format.html { render :action => "new" }
          format.json { render :json => @shift.errors, :status => :unprocessable_entity }
        end
      end
    end

    # PUT /shifts/1
    # PUT /shifts/1.json
    def update
      respond_to do |format|
        if @shift.update_attributes(params[:shift])
          format.html { redirect_to @shift, :notice => 'Shift was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render :action => "edit" }
          format.json { render :json => @shift.errors, :status => :unprocessable_entity }
        end
      end
    end

    # DELETE /shifts/1
    # DELETE /shifts/1.json
    def destroy
      @shift.destroy

      respond_to do |format|
        format.html { redirect_to shifts_url }
        format.json { head :no_content }
      end
    end

    def subject_record
      @shift
    end
  end
end
