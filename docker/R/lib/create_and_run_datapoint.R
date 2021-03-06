# create_and_run_datapoint(x) such that x is vector of variable values,
#           create a datapoint from the vector of variable values x and run
#           the new datapoint
# x: vector of variable values
#
# Several of the variables are in the sessions. The list below should abstracted out:
#   rails_host
#   rails_analysis_id
#   ruby_command
#   r_scripts_path
create_and_run_datapoint <- function(x){
  options(warn=-1)
  if (check_run_flag(r_scripts_path, rails_host, rails_analysis_id, debug_messages)==FALSE){
    options(warn=0)
    stop(options("show.error.messages"=FALSE),"run flag set to FALSE")
  }

  # convert the vector to comma separated values
  force(x)
  w <- paste(x, collapse=",") 
  y <- paste(r_scripts_path,'/api_create_datapoint.rb -h ',rails_host,' -a ',rails_analysis_id,' -v ',w,' --submit',sep='')
  if(debug_messages == 1){
    print(paste('run command: ruby ', y))
  }
  counter <- 1
  repeat{
    # Call the system command to submit the simulation to the API / queue
    z <- system2("ruby",y, stdout = TRUE, stderr = TRUE)
    z <- z[length(z)]
    if(debug_messages == 1){
      print(paste("Create and Run Datapoint ",counter," z:",z))
    }
    #check if return status is not NULL (means errors and z is not a json)
    if(!is.null(attr(z, "status"))) {
      counter = counter + 1
      next
    }
    #z is a json so check status
    json <- try(fromJSON(z), silent=TRUE)
    if(debug_messages == 1){
      print(paste('json:',json))
    }
    #if json$status is false, then try again
    if(!json$status){
      counter = counter + 1
      next
    }
    #if gotten this far then json is good
    if(debug_messages == 1){
      print(paste("Success ",counter))
    }
    counter <- 11
    if(counter > 10){break}
  }
  
  #TODO THIS PATH DOESNT EXIST.  THIS IS RUNNING ON RSERVE_1 
  #data_point_directory <- paste(rails_sim_root_path,'/analysis_',rails_analysis_id,'/data_point_',json$id,sep='')
  data_point_directory <- paste('/mnt/openstudio/analysis_',rails_analysis_id,'/data_point_',json$id,sep='')
  #print(paste("data_point_directory:",data_point_directory))
  ## save off the variables file (can be used later if number of vars gets too long)
  if (dir.exists(data_point_directory)) {
    write.table(x, paste(data_point_directory,"/input_variables_from_r.data",sep=""),row.names = FALSE, col.names = FALSE)
  } else { 
     #print(paste("data_point_directory does not exist:",data_point_directory))
  }
  #if json$status is FALSE then datapoint status is false
  if (!json$status) {
    print(paste("json$status is false, RETURNING: ",failed_f))
    options(warn=0)
    return(failed_f)
  } else {
    if (is.null(json$results)) {
      obj <- failed_f
      print("json$results is NULL")
    } else {
      obj <- NULL
      objvalue <- NULL
      objtarget <- NULL
      sclfactor <- NULL
      for (i in 1:objDim){
        objfuntemp <- paste("objective_function_",i,sep="")
        if (json$results[objfuntemp] != "NULL"){
          objvalue[i] <- as.numeric(json$results[objfuntemp])
        } else {
          objvalue[i] <- failed_f
          cat(data_point_directory," Missing ", objfuntemp,"\n");
        }
        objfuntargtemp <- paste("objective_function_target_",i,sep="")
        if (json$results[objfuntargtemp] != "NULL"){
          objtarget[i] <- as.numeric(json$results[objfuntargtemp])
        } else {
          objtarget[i] <- 0.0
        }
        scalingfactor <- paste("scaling_factor_",i,sep="")
        sclfactor[i] <- 1.0
        if (json$results[scalingfactor] != "NULL"){
          sclfactor[i] <- as.numeric(json$results[scalingfactor])
          if (sclfactor[i] == 0.0) {
            print(paste(scalingfactor," is ZERO, overwriting\n"))
            sclfactor[i] <- 1.0
          }
        } else {
          sclfactor[i] <- 1.0
        }
      }
      options(digits=8)
      options(scipen=-2)
      if(debug_messages == 1){
        print(paste("Objective function results are:",objvalue))
        print(paste("Objective function targets are:",objtarget))
        print(paste("Objective function scaling factors are:",sclfactor))
      }
      objvalue <- objvalue / sclfactor
      objtarget <- objtarget / sclfactor
      
      obj <- force(eval(dist(rbind(objvalue,objtarget),method=normtype,p=ppower)))

      if(debug_messages == 1){
        print(paste("Objective function Norm:",obj))
      }
      # Check if exit on guideline 14 is enabled
      if (rails_exit_guideline_14){
        # read in the results from the guideline14 file
        #TODO this path will not work
        guideline_file <- paste(data_point_directory,"/run/CalibrationReportsEnhanced20/guideline.json",sep="")
        guideline_file1 <- paste(data_point_directory,"/run/CalibrationReportsEnhanced/guideline.json",sep="")
        guideline_file2 <- paste(data_point_directory,"/run/CalibrationReports/guideline.json",sep="")
        json <- NULL
        json1 <- NULL
        json2 <- NULL
        try(json <- fromJSON(file=guideline_file), silent=TRUE)
        try(json1 <- fromJSON(file=guideline_file1), silent=TRUE)
        try(json2 <- fromJSON(file=guideline_file2), silent=TRUE)
        #if json2 exists then set json = json2 and continue to test on json
        if (!is.null(json2)) {json <- json2}
        if (!is.null(json1)) {json <- json1}
        if (is.null(json)) {
          print(paste("no guideline file: ",guideline_file))
        } else {
          guideline <- json[[1]]
          for (i in 2:length(json)) guideline <- cbind(guideline,json[[i]])
          print(paste("guideline: ",guideline))
          print(paste("isTRUE(guideline): ",isTRUE(guideline)))
          print(paste("all(guideline): ",all(guideline)))
          if (length(which(guideline)) == objDim){
            #write final params to json file
            write_filename <- paste(analysis_dir,'/varnames.json',sep='')
            varnames <- scan(file=write_filename, what=character())

            answer <- paste('{',paste('"',gsub(".","|",varnames, fixed=TRUE),'"',': ',x,sep='', collapse=','),'}',sep='')
            write_filename <- paste(analysis_dir,'/best_result.json',sep='')
            write.table(answer, file=write_filename, quote=FALSE,row.names=FALSE,col.names=FALSE)

            convergenceflag <- paste('{',paste('"',"exit_on_guideline14",'"',': ',"true",sep='', collapse=','),'}',sep='')
            write_filename <- paste(analysis_dir,'/convergence_flag.json',sep='')
            write(convergenceflag, file=write_filename)
            options(warn=0)
            stop(options("show.error.messages"=FALSE),"exit_on_guideline14")
          }
        }
      }
    }
  }
  options(warn=0)
  return(as.numeric(obj))
}



