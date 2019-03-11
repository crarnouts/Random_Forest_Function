subset_columns <- function(data,targetvariable,cols_in_rf){  #target variable is inputted as column vector

  newdata <- as.data.frame(targetvariable)  ## we intialize the new dataset that this iteration of the random forest will run on (decision tree)



  for (i in 1:cols_in_rf){

    ncols <- ncol(data)

    random_col_num <- round(runif(1, min=1, max=ncols))

    newdata[[colnames(data[random_col_num])]] <- data[,c(colnames(data[random_col_num]))] # this grabs the random column vector and assigns it to the new subsetted dataset

    data[,c(colnames(data[random_col_num]))] <- NULL #removes the chosen column so that it is not chosen again for the particular tree

  }

  return(newdata)
}
