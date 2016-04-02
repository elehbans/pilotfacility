class DatapointController < ApplicationController
  
  def results
    @run_data = Datapoint.where(Run_ID: params[:run_id_val])
  end
  
  def update_data
    @dp_target = Datapoint.find(params[:dp_id_val])
  end
  
  def confirm_data_update
     @dp_new_target = Datapoint.find(params[:datapoint][:id])
     @dp_new_target.update(:Submitter => params[:datapoint][:Submitter],
                      :Run_ID => params[:datapoint][:Run_ID],
                      :Time_Taken => params[:datapoint][:Time_Taken],
                      :Hrs_Post_Start => params[:datapoint][:Hrs_Post_Start],
                      :Var_Name => params[:datapoint][:Var_Name],
                      :Var_Metric => params[:datapoint][:Var_Metric],
                      :Var_Value => params[:datapoint][:Var_Value],
                      :Notes => params[:datapoint][:Notes]
                      )
  end
  
  def add_data
    @datapoint = Datapoint.new()
  end
  
  def confirm_data_add
    @datapoint = Datapoint.new()
    
    @datapoint.Run_ID = params[:datapoint][:Run_ID]
    @datapoint.Submitter = params[:datapoint][:Submitter]
    @datapoint.Time_Taken = params[:datapoint][:Time_Taken]
    @datapoint.Hrs_Post_Start = params[:datapoint][:Hrs_Post_Start]
    @datapoint.Var_Name = params[:datapoint][:Var_Name]
    @datapoint.Var_Metric = params[:datapoint][:Var_Metric]
    @datapoint.Var_Value = params[:datapoint][:Var_Value]
    @datapoint.Notes = params[:datapoint][:Notes]
    
    @datapoint.save!
    
    @dp_record = Datapoint.last
  end

  def add_sample_set
    @sample_set = Datapoint.new()
  end

  def confirm_sample_set
    
    var_Name_Arr = ["Optical Density","Dry Weight","pH Probe","pH Meter","BG11 Plate","LB Plate"]
    var_Metric_Arr = ["A750","Milligram","pH","pH","Pos/Neg","Pos/Neg"]
    var_Value_Arr = [params[:OD], params[:Dry_Weight], params[:pH_Probe], params[:pH_Meter], params[:BG], params[:LB]] 

    @dp_id_list = Array.new()
    for i in 0..5 
      sample_set = Datapoint.new()

      sample_set.Run_ID = params[:Run_ID]
      sample_set.Submitter = params[:Submitter]
      sample_set.Time_Taken = params[:Time_Taken]
      sample_set.Hrs_Post_Start = params[:Hrs_Post_Start]
      sample_set.Var_Name = var_Name_Arr[i]
      sample_set.Var_Metric = var_Metric_Arr[i]
      sample_set.Var_Value = var_Value_Arr[i]

      sample_set.save!
      
      dp_id = Datapoint.last.id
      @dp_id_list.push(dp_id)
    end

    rescue ActiveRecord::RecordInvalid => @invalid

    @dp_added = Datapoint.where(id: @dp_id_list)
  end
  
end
