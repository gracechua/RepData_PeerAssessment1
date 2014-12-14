## sets the right working directory and reads the CSV file into R.

setwd("~/Coursera Data Science/repdata/RepData_PeerAssessment1")
activity <- read.csv("activity.csv")

## sums the number of steps by date and plots a histogram. 

StepsByDate <- tapply(activity$steps, activity$date, sum, na.rm=FALSE)
hist(StepsByDate, xlab="Total # of steps taken each day")

## Calculate and report the mean and median total number of steps taken per day
MeanSteps <- mean(StepsByDate, na.rm=TRUE)
MeanSteps
MedianSteps <- median(StepsByDate, na.rm=TRUE)
MedianSteps

## What is the average daily activity pattern?

## Make a time series plot (i.e. type = "l") of the 5-minute interval (x-axis) and the average number of steps taken, averaged across all days (y-axis)
## In other words, for each 5-minute time interval, what's the average across all days? Plot this. 

averages <- tapply(activity$steps, activity$interval, mean, na.rm=TRUE)
plot(averages, type="l", xlab = "Interval", ylab="Average steps taken")


## Which 5-minute interval, on average across all the days in the dataset, contains the maximum number of steps?

averages[which.max(averages)]

## Imputing missing values
## Note that there are a number of days/intervals where there are missing values (coded as NA). The presence of missing days may introduce bias into some calculations or summaries of the data.
## Calculate and report the total number of missing values in the dataset (i.e. the total number of rows with NAs)
## How many are missing? Return a list of true and false values for activity

missing <- is.na(activity$steps)

## count 'em

table(missing)

## Devise a strategy for filling in all of the missing values in the dataset. The strategy does not need to be sophisticated. For example, you could use the mean/median for that day, or the mean for that 5-minute interval, etc.

## let's use the mean for that interval, makes more sense than doing it by day. people have to sleep at night

