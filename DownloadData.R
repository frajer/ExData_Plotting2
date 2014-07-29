## Library for downloading and reading the data for the Course Project
## for Exploratory Data Analysis

DownloadData <- function()
{
    ## Download (if necessary) and reading the data for the assignment
    if(!file.exists("./summarySCC_PM25.rds"))
    {
        print("Data will be downloaded and unziped...")
        url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
        download.file(url, "./NEI_data.zip", method = "curl")
        unzip("./NEI_data.zip")
    }
    else
    {
        print("Data was already downloaded ...")
    }
    
    return()
}

DownloadData()