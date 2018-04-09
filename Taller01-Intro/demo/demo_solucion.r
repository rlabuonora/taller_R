## demographics and employment in the united states

##Load the dataset from CPSData.csv into a data frame called CPS, and view the dataset with the summary() and str() commands.

CPS <- read.csv("CPSData.csv")
str(CPS)

## How many interviewees are in the dataset?
nrow(CPS)
## [1] 131302

## Among the interviewees with a value reported for the Industry variable, what is the most common industry of employment? Please enter the name exactly how you see it.
v <- CPS$Industry
names(sort(summary(v[!is.na(v)]), decreasing=TRUE)[1])
## [1] "Educational and health services"

## Which state has the fewest interviewees?
names(sort(table(CPS$State), decreasing=FALSE))[1]
## [1] "New Mexico"
## Which state has the largest number of interviewees?
names(sort(table(CPS$State), decreasing=TRUE))[1]
## [1] "California"

## What proportion of interviewees are citizens of the United States?
sum(summary(CPS$Citizenship)[1:2])/nrow(CPS)
## [1] 0.9421943
table(CPS$Race, CPS$Hispanic)
                  
  ##                      0     1
  ## American Indian   1129   304
  ## Asian             6407   113
  ## Black            13292   621
  ## Multiracial       2449   448
  ## Pacific Islander   541    77
  ## White            89190 16731

## Which variables have at least one interviewee with a missing (NA) value? (Select all that apply.)
summary(CPS)

names(which(sapply(CPS, function(x) any(is.na(x)))))

## [1] "MetroAreaCode"    "Married"          "Education"        "EmploymentStatus"
## [5] "Industry"        
table(CPS$Region, is.na(CPS$Married))
table(CPS$Sex, is.na(CPS$Married))
table(CPS$Age, is.na(CPS$Married)) ## YES!


## How many states had all interviewees living in a non-metropolitan area (aka they have a missing MetroAreaCode value)? For this question, treat the District of Columbia as a state (even though it is not technically a state).

tab <- table(is.na(CPS$MetroAreaCode), CPS$State)
length(which(tab[1,]==0))
## [1] 2
length(which(tab[2,]==0))
## [1] 3

## Which region of the United States has the largest proportion of interviewees living in a non-metropolitan area?

reg_tab <- table(is.na(CPS$MetroAreaCode), CPS$Region)
props <- sort(reg_tab[2,] / (reg_tab[2,] + reg_tab[1,]))
names(sort(props, decreasing=TRUE)[1])

## Which state has a proportion of interviewees
## living in a non-metropolitan area closest to 30%?
names(sort(tapply(is.na(CPS$MetroAreaCode), CPS$State, function(x) { abs(mean(x) - 0.3) })))[1]

## [1] "Wisconsin"

## Which state has the largest proportion of
## non-metropolitan interviewees, ignoring
## states where all interviewees were non-metropolitan?
metro<- tapply(is.na(CPS$MetroAreaCode), CPS$State, function(x) { mean(x) })

names(sort(metro[which(metro != 1)], decreasing = TRUE))[1]
## [1] "Montana"
## Read these two dictionaries into data frames MetroAreaMap and CountryMap.
CountryMap <- read.csv("CountryCodes.csv")
MetroAreaMap <- read.csv("MetroAreaCodes.csv")

nrow(CountryMap)
## [1] 149
nrow(MetroAreaMap)
## [1] 271

before <- names(CPS)
CPS <- merge(CPS, MetroAreaMap, by.x="MetroAreaCode", by.y="Code", all.x=TRUE)
after <- names(CPS)

setdiff(after, before)
## [1] "MetroArea"
sum(is.na(CPS$MetroArea))
## [1] 34238

## Which of the following metropolitan areas
## has the largest number of interviewees?

metroAreas <- c("Atlanta-Sandy Springs-Marietta, GA",
                "Baltimore-Towson, MD",
                "Boston-Cambridge-Quincy, MA-NH",
                "San Francisco-Oakland-Fremont, CA")

names(sort(table(CPS$MetroArea)[metroAreas], decreasing=TRUE)[1])
## [1] "Boston-Cambridge-Quincy, MA-NH"


## Which metropolitan area has the highest proportion of
## interviewees of Hispanic ethnicity?

names(sort(tapply(CPS$Hispanic, CPS$MetroArea, mean), decreasing=TRUE))[1]
## [1] "Laredo, TX"

## determine the number of metropolitan areas in the
## United States from which at least 20% of interviewees are Asian.
v <- tapply(CPS$Race=="Asian", CPS$MetroArea, mean)
length(v[which(v > 0.2)])
## [1] 4

## which metropolitan area has the smallest proportion of interviewees who have received no high school diploma.
names(sort(tapply(CPS$Education=="No high school diploma", CPS$MetroArea, mean, na.rm=TRUE))[1])
## [1] "Iowa City, IA"

## What is the name of the variable added to the CPS data frame by this merge operation?
before <- names(CPS)
CPS <- merge(CPS, CountryMap, by.x="CountryOfBirthCode", by.y="Code", all.x=TRUE)
after <- names(CPS)
setdiff(after, before)
## [1] "Country"

## How many interviewees have a missing value
## for the new country of birth variable?
sum(is.na(CPS$Country))
## [1] 176

## Among all interviewees born outside of North America,
## which country was the most common place of birth?
sort(table(CPS$Country))["Philippines"]
## Philippines 
##         839

## What proportion of the interviewees from the
## "New York-Northern New Jersey-Long Island, NY-NJ-PA"
## metropolitan area have a country of birth that is not the United States?
## For this computation, don't include people from
## this metropolitan area who have a missing country of birth.

metro <- subset(CPS, CPS$MetroArea=="New York-Northern New Jersey-Long Island, NY-NJ-PA")
table(metro$Country=="United States")["FALSE"] /nrow(metro)
##     FALSE 
## 0.3083749

## Which metropolitan area has the largest number
## (note -- not proportion) of interviewees
## with a country of birth in India? 

names(sort(tapply(CPS$Country=="India", CPS$MetroArea, sum, na.rm=TRUE), decreasing = TRUE)[1])
## [1] "New York-Northern New Jersey-Long Island, NY-NJ-PA"

names(sort(tapply(CPS$Country=="Brazil", CPS$MetroArea, sum, na.rm=TRUE), decreasing = TRUE)[1])
## [1] "Boston-Cambridge-Quincy, MA-NH"

names(sort(tapply(CPS$Country=="Somalia", CPS$MetroArea, sum, na.rm=TRUE), decreasing = TRUE)[1])
## [1] "Minneapolis-St Paul-Bloomington, MN-WI"

