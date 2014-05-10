setwd("~/Documents/kaggle/datasciencecoursera/Exporitory_Data_Analysis/Proj_1")
household <- read.csv("household_power_consumption.txt", sep=";", quote="")

household$Date = strptime(household$Date, format="%d/%m/%y")
household$Time = strptime(household$Time, format="%H:%M:%S")
