module Schedule
  class ShiftsController < Schedule::ApplicationController
    # GET /shifts
    # GET /shifts.json
    def index
      @shifts = @shifts.where(:event_id => @event.id) if @event
      @shifts = @shifts.order :start_time
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
      if @event
        @shift.event = @event
        @shift.end_time = @shift.start_time = @event.start_date.to_datetime
      end
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

    # POST /shifts/1/copy
    def copy
      startday = Date.parse(params['start'])
      endday = Date.parse(params['end'])
      delta_t = @shift.end_time - @shift.start_time
      results = []
      failed = false
      respond_to do |format|
        @shift.transaction do
          (startday..endday).each do |day|
            if day != @shift.start_time.to_date
              c = Shift.new @shift.attributes
              @shift.slots.each do |slot|
                c.start_time = date_and_time(day, @shift.start_time)
                c.end_time = c.start_time + delta_t
                c.slots.build slot.attributes
              end # slots.each
              unless c.save
                failed = true
                format.html { redirect_to @shift, :alert => "Copy shift failed: #{c.errors.full_messages.to_sentence}" }
                format.json { render :json => c.errors, :status => :unprocessable_entity }
                raise ActiveRecord::Rollback
              end # unless c.save
              results << c
            end # if day
          end # days.each
        end # shift.transaction
        unless failed
          format.html { redirect_to event_shifts_path(@shift.event), :notice => "Shift was copied #{results.count} times" }
          format.json { render :json => results, :status => :created }
        end # unless failed
      end # respond_to
    end # copy

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

    private
    def date_and_time(date, time)
      DateTime.new(date.year, date.month, date.day, time.hour, time.min, time.sec, time.zone)
    end
  end
end
