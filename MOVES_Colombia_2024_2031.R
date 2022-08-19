#### MOVES COLOMBIA 2022 
#### R code for processing vehicle emissions results from the MOVES Colombia model 
#### Unisalle - EGR 
#### 2022 


#### IMPACT OF OXYGENATED FUELS ON ATMOSPHERIC EMISSIONS IN MAJOR COLOMBIAN CITIES


#https://www.nctcog.org/nctcg/media/Transportation/DocsMaps/Quality/Air/12-13-MOVES-and-TTI-Info-and-Fact-Sheets.pdf
#See nomenclature of vehicle categories, pollutants, emission processes, among others.
#Apply conversion factors as appropriate. According to assigned units from the model output database. 
#Mass: grams, tons or other? 
#Distance: kilometers, miles?

## 1.0. PREAMBLE------------
rm(list=ls())

#Installation of packages and libraries
#install.packages("RMariaDB")
library(RMariaDB)
library(tidyverse)
library(dplyr)

#Assign working directory
setwd("C:/Users/erika/OneDrive/Documentos/MOVES_Final/Procesamiento_Salidas_R")

## 2.0. READ DB---------------------------------------------

con<-dbConnect(RMariaDB::MariaDB(), user='moves', password='moves')

##BOGOTA 2024----
BE10<-dbGetQuery(con,
                 'SELECT * FROM bog2024e10output2.movesoutput;') %>%
  mutate(Scenario = '1E10_B24') %>%
  mutate( City = "Bogota") %>%
  mutate ( Blend = "E10") 

BE03<-dbGetQuery(con,
                 'SELECT * FROM bog2024e0output.movesoutput;') %>%
  mutate(Scenario = '2E0_B24') %>%
  mutate( City = "Bogota") %>%
  mutate ( Blend = "E0") 

BE8OX6C<-dbGetQuery(con,
                    'SELECT * FROM bog2024e8ox6output2.movesoutput;') %>%
  mutate(Scenario = '3E8OX6_B24') %>%
  mutate( City = "Bogota") %>%
  mutate ( Blend = "E8OX6") 

BE6OX11<-dbGetQuery(con,
                    'SELECT * FROM bog2024e6ox11output2.movesoutput;') %>%
  mutate(Scenario = '4E6OX11_B24') %>%
  mutate( City = "Bogota") %>%
  mutate ( Blend = "E6OX11") 

BE5OX13<-dbGetQuery(con,
                    'SELECT * FROM bog2024o5ox13output2.movesoutput;') %>%
  mutate(Scenario = '5E5OX13_B24') %>%
  mutate( City = "Bogota") %>%
  mutate ( Blend = "E5OX13") 


BE3OX17<-dbGetQuery(con,
                    'SELECT * FROM bog2024o3ox17output2.movesoutput;') %>%
  mutate(Scenario = '6E3OX17_B24') %>%
  mutate( City = "Bogota") %>%
  mutate ( Blend = "E3OX17") 

BOX24<-dbGetQuery(con,
                  'SELECT * FROM bog2024ox24output.movesoutput;') %>%
  mutate(Scenario = '7OX24_B24') %>%
  mutate( City = "Bogota") %>%
  mutate ( Blend = "OX24")

##BOGOTA 2031----
BBE10<-dbGetQuery(con,
                  'SELECT * FROM bog2031e10output.movesoutput;') %>%
  mutate(Scenario = '1E10_B31')%>%
  mutate( City = "Bogota") %>%
  mutate ( Blend = "E10")

BBE0<-dbGetQuery(con,
                 'SELECT * FROM bog2031e0output.movesoutput;') %>%
  mutate(Scenario = '2E0_B31')%>%
  mutate( City = "Bogota") %>%
  mutate ( Blend = "E0")

BBE5OX13<-dbGetQuery(con,
                     'SELECT * FROM bog2031e5ox13output.movesoutput;') %>%
  mutate(Scenario = '5E5OX13_B31')%>%
  mutate( City = "Bogota") %>%
  mutate ( Blend = "E5OX13")

BBOX24<-dbGetQuery(con,
                   'SELECT * FROM bog2031ox24output.movesoutput;') %>%
  mutate(Scenario = '7OX24_B31')%>%
  mutate( City = "Bogota") %>%
  mutate ( Blend = "OX24")

##MEDELLIN 2024-----

ME10<-dbGetQuery(con,
                 'SELECT * FROM med2024e10output2.movesoutput;') %>%
  mutate(Scenario = '1E10_M24') %>%
  mutate( City = "Medellin") %>%
  mutate ( Blend = "E10") 

ME0<-dbGetQuery(con,
                'SELECT * FROM med2024e0output.movesoutput;') %>%
  mutate(Scenario = '2E0_M24') %>%
  mutate( City = "Medellin") %>%
  mutate ( Blend = "E0") 

ME8OX6<-dbGetQuery(con,
                   'SELECT * FROM med2024e8ox6output.movesoutput;') %>%
  mutate(Scenario = '3E8OX6_M24') %>%
  mutate( City = "Medellin") %>%
  mutate ( Blend = "E8OX6") 

ME5OX13<-dbGetQuery(con,
                    'SELECT * FROM med2024e5ox13output.movesoutput;') %>%
  mutate(Scenario = '5E5OX13_M24') %>%
  mutate( City = "Medellin") %>%
  mutate ( Blend = "E5OX13") 

MOX24<-dbGetQuery(con,
                  'SELECT * FROM med2024ox24output.movesoutput;') %>%
  mutate(Scenario = '7OX24_M24') %>%
  mutate( City = "Medellin") %>%
  mutate ( Blend = "OX24") 

##MEDELLIN 2031-----
MME10<-dbGetQuery(con,
                  'SELECT * FROM med2031e10output.movesoutput;') %>%
  mutate(Scenario = '1E10_M31')%>%
  mutate( City = "Medellin") %>%
  mutate ( Blend = "E10")

MME0<-dbGetQuery(con,
                 'SELECT * FROM med2031e0output.movesoutput;') %>%
  mutate(Scenario = '2E0_M31')%>%
  mutate( City = "Medellin") %>%
  mutate ( Blend = "E0")

MME5OX13<-dbGetQuery(con,
                     'SELECT * FROM med2031e5ox13output.movesoutput;') %>%
  mutate(Scenario = '5E5OX13_M31')%>%
  mutate( City = "Medellin") %>%
  mutate ( Blend = "E5OX13")

MMOX24<-dbGetQuery(con,
                   'SELECT * FROM med2031ox24output.movesoutput;') %>%
  mutate(Scenario = '7OX24_M31')%>%
  mutate( City = "Medellin") %>%
  mutate ( Blend = "OX24")

##CUCUTA 2024-----

CE10<-dbGetQuery(con,
                 'SELECT * FROM cuc2024e10output.movesoutput;') %>%
  mutate(Scenario = '1E10_C24') %>%
  mutate( City = "Cucuta") %>%
  mutate ( Blend = "E10")

CE0<-dbGetQuery(con,
                'SELECT * FROM cuc2024e0output.movesoutput;') %>%
  mutate(Scenario = '2E0_C24') %>%
  mutate( City = "Cucuta") %>%
  mutate ( Blend = "E0")

CE8OX6<-dbGetQuery(con,
                   'SELECT * FROM cuc2024e8ox6output.movesoutput;') %>%
  mutate(Scenario = '3E8OX6_C24') %>%
  mutate( City = "Cucuta") %>%
  mutate ( Blend = "E8OX6")

CE5OX13<-dbGetQuery(con,
                    'SELECT * FROM cuc2024e5ox13output.movesoutput;') %>%
  mutate(Scenario = '5E5OX13_C24') %>%
  mutate( City = "Cucuta") %>%
  mutate ( Blend = "E5OX13")

COX24<-dbGetQuery(con,
                  'SELECT * FROM cuc2024ox24output.movesoutput;') %>%
  mutate(Scenario = '7OX24_C24') %>%
  mutate( City = "Cucuta") %>%
  mutate ( Blend = "OX24")

#CUCUTA 2031----

CCE10<-dbGetQuery(con,
                  'SELECT * FROM cuc2031e10output2.movesoutput;') %>%
  mutate(Scenario = '1E10_C31') %>%
  mutate( City = "Cucuta") %>%
  mutate ( Blend = "E10")

CCE0<-dbGetQuery(con,
                 'SELECT * FROM cuc2031e0output2.movesoutput;') %>%
  mutate(Scenario = '2E0_C31') %>%
  mutate( City = "Cucuta") %>%
  mutate ( Blend = "E0")

CCE5OX13<-dbGetQuery(con,
                     'SELECT * FROM cuc2031e5ox13output3.movesoutput;') %>%
  mutate(Scenario = '5E5OX13_C31')%>%
  mutate( City = "Cucuta") %>%
  mutate ( Blend = "E5OX13")

CCOX24<-dbGetQuery(con,
                   'SELECT * FROM cuc2031ox24output.movesoutput;') %>%
  mutate(Scenario = '7OX24_C31')%>%
  mutate( City = "Cucuta") %>%
  mutate ( Blend = "OX24")

# LOAD GENERAL MOVES MODEL DATABASE: CONTAINS OUTPUT DATABASE UNITS----
# Rename the database as appropriate "cuc2031ox24output"
# Runs<- dbGetQuery(con,
#                   'SELECT * FROM cuc2031ox24output.movesrun;') # %>%

## LOAD DEFAULT MOVES MODEL DATABASE: PROCESS ------
procesos<-dbGetQuery(con,
                     'SELECT * FROM movesdb20161117.emissionprocess;') 

dbDisconnect(con)


## 3.0. DB TOTAL ----
## 3.1. DB FOR CITY (TOTAL SCENARIOS) ----
##  2024 ----
b_total_em<- bind_rows (BE10) %>%
  bind_rows(BE03) %>%
  bind_rows(BE8OX6C) %>%
  bind_rows(BE6OX11) %>%
  bind_rows(BE5OX13) %>%
  bind_rows(BE3OX17) %>%
  bind_rows(BOX24) %>%
  select(-MOVESRunID, -iterationID, -monthID, -dayID, -hourID, -stateID, -countyID, -zoneID, -linkID, -regClassID, -fuelSubTypeID, -SCC, -engTechID, -sectorID, -hpID, -emissionQuantMean, 
         -emissionQuantSigma) 

m_total_em<- bind_rows(ME0)%>%
  bind_rows(ME10) %>%
  bind_rows(ME8OX6) %>%
  bind_rows(ME5OX13) %>% 
  bind_rows(MOX24) %>%
  select(-MOVESRunID, -iterationID, -monthID, -dayID, -hourID, -stateID, -countyID, -zoneID, -linkID, -regClassID, -fuelSubTypeID, -SCC, -engTechID, -sectorID, -hpID, -emissionQuantMean, 
         -emissionQuantSigma) 

c_total_em<- bind_rows(CE0)%>%
  bind_rows(CE10) %>%
  bind_rows(CE8OX6) %>%
  bind_rows(CE5OX13) %>% 
  bind_rows(COX24) %>%
  select(-MOVESRunID, -iterationID, -monthID, -dayID, -hourID, -stateID, -countyID, -zoneID, -linkID, -regClassID, -fuelSubTypeID, -SCC, -engTechID, -sectorID, -hpID, -emissionQuantMean, 
         -emissionQuantSigma)

# ## 2031 ---- 
# To process results for the year 2031: comment "filter (Year == 2024)" and uncomment "filter (Year == 2031)" 
# DB FOR CITY (TOTAL SCENARIOS)
b_total_em<- bind_rows (BBE10) %>%
  bind_rows(BBE0) %>%
  bind_rows(BBE5OX13) %>%
  bind_rows(BBOX24) %>%
  select(-MOVESRunID, -iterationID, -monthID, -dayID, -hourID, -stateID, -countyID, -zoneID, -linkID, -regClassID, -fuelSubTypeID, -SCC, -engTechID, -sectorID, -hpID, -emissionQuantMean,
         -emissionQuantSigma)

m_total_em<- bind_rows(MME10) %>%
  bind_rows(MME0) %>%
  bind_rows(MME5OX13) %>%
  bind_rows(MMOX24) %>%
  select(-MOVESRunID, -iterationID, -monthID, -dayID, -hourID, -stateID, -countyID, -zoneID, -linkID, -regClassID, -fuelSubTypeID, -SCC, -engTechID, -sectorID, -hpID, -emissionQuantMean,
         -emissionQuantSigma)

c_total_em<- bind_rows(CCE10) %>%
  bind_rows(CCE0) %>%
  bind_rows(CCE5OX13) %>%
  bind_rows(CCOX24) %>%
  select(-MOVESRunID, -iterationID, -monthID, -dayID, -hourID, -stateID, -countyID, -zoneID, -linkID, -regClassID, -fuelSubTypeID, -SCC, -engTechID, -sectorID, -hpID, -emissionQuantMean,
         -emissionQuantSigma)

## 3.2. DB PROCESS FOR CITY (TOTAL SCENARIOS) ----
 b_final_em <-merge(b_total_em, procesos[,c(1,2)], by=c('processID')) 
 m_final_em <-merge(m_total_em, procesos[,c(1,2)], by=c('processID')) 
 c_final_em <-merge(c_total_em, procesos[,c(1,2)], by=c('processID')) 


## 4.0. CORRECTION OF VOC EMISSIONS IN THE EVAPORATION PROCESS ----

#Apply only to fuels with ETBE. Essential to have VOC and NMHC pollutant results from fuel scenario E10
#VOC_(evap process)  = NMHC_(evap process)  + [(Ethanol volume) * (E10 VOC_(evap process)  - E10 NMHC_(evap process))]

  ## BOGOTA-----
# FILTER PROCESS: Evap y Refueling
B24 <- subset(b_final_em, b_final_em$processID == 11 | b_final_em$processID == 12 | b_final_em$processID == 13 | b_final_em$processID == 18 | b_final_em$processID == 19)

# DB VOC AND NMHC
VOC_B <- subset(B24, B24$pollutantID == 87)
VOC_B <- VOC_B[,-c(2,3)]
colnames(VOC_B) <- c("processID","sourceTypeID","fuelTypeID","modelYearID","roadTypeID","VOC","Scenario","City","Blend","processName")

NMHC_B <- subset(B24, B24$pollutantID == 79)
NMHC_B <- NMHC_B[,-c(2,3)]
colnames(NMHC_B) <- c("processID","sourceTypeID","fuelTypeID","modelYearID","roadTypeID","NMHC","Scenario","City","Blend","processName")

# DB TOTAL WITH POLLUTAND PER COLUMN
TEMP_B <- full_join(VOC_B, NMHC_B)

# DB E10: VOC and NMHC
AUX_B <- subset(TEMP_B, TEMP_B$Blend == "E10")
AUX_B <- AUX_B[,-c(7,9)]
colnames(AUX_B) <- c("processID","sourceTypeID","fuelTypeID","modelYearID","roadTypeID","E10_VOC","City","processName","E10_NMHC")

# DB TOTAL E10: VOC and NMHC
TEMP_B <- full_join(TEMP_B,AUX_B)

# COLUMN NEW FOR VOC CORRECT
TEMP_B$VOC_Final <- TEMP_B$VOC*0

# STAR OF THE CYCLE TO ESTIMATE THE NEW VOC VALUES
n <- length(TEMP_B[,1])
unique(TEMP_B$Blend)

for(i in 1:n) {
  if (TEMP_B$Blend[i] == "E0") {
    TEMP_B$VOC_Final[i] <- TEMP_B$NMHC[i]
  } else if (TEMP_B$Blend[i] == "E10") {
    TEMP_B$VOC_Final[i] <- TEMP_B$VOC[i]
  } else if (TEMP_B$Blend[i] == "E8OX6") {
    TEMP_B$VOC_Final[i] <- TEMP_B$NMHC[i]+0.078*(TEMP_B$E10_VOC[i] - TEMP_B$E10_NMHC[i])
  }else if (TEMP_B$Blend[i] == "E6OX11") {
    TEMP_B$VOC_Final[i] <- TEMP_B$NMHC[i]+0.058*(TEMP_B$E10_VOC[i] - TEMP_B$E10_NMHC[i])
  }else if (TEMP_B$Blend[i] == "E5OX13") {
    TEMP_B$VOC_Final[i] <- TEMP_B$NMHC[i]+0.049*(TEMP_B$E10_VOC[i] - TEMP_B$E10_NMHC[i])
  }else if (TEMP_B$Blend[i] == "E3OX17") {
    TEMP_B$VOC_Final[i] <- TEMP_B$NMHC[i]+0.029*(TEMP_B$E10_VOC[i] - TEMP_B$E10_NMHC[i])
  }else  { ##OX24
    TEMP_B$VOC_Final[i] <- TEMP_B$NMHC[i]
  }
}

# DB FINAL WITH VOC CORRECT
TEMP_B <- TEMP_B[,-c(6,9,11,12,13)] %>%
  mutate(pollutantID = 87) %>%
  mutate (yearID = 2024)
  #mutate (yearID = 2031)
colnames(TEMP_B) <- c("processID","sourceTypeID","fuelTypeID","modelYearID","roadTypeID","Scenario","City","Blend","emissionQuant", "pollutantID", "yearID") 

## MEDELLIN-----
# FILTER PROCESS: Evap y Refueling
M24 <- subset(m_final_em, m_final_em$processID == 11 | m_final_em$processID == 12 | m_final_em$processID == 13 | m_final_em$processID == 18 | m_final_em$processID == 19)

# DB: VOC AND NMHC
VOC_M <- subset(M24, M24$pollutantID == 87)
VOC_M <- VOC_M[,-c(2,3)]
colnames(VOC_M) <- c("processID","sourceTypeID","fuelTypeID","modelYearID","roadTypeID","VOC","Scenario","City","Blend","processName")

NMHC_M <- subset(M24, M24$pollutantID == 79)
NMHC_M <- NMHC_M[,-c(2,3)]
colnames(NMHC_M) <- c("processID","sourceTypeID","fuelTypeID","modelYearID","roadTypeID","NMHC","Scenario","City","Blend","processName")

# DB TOTAL WITH POLLUTAND PER COLUMN
TEMP_M <- full_join(VOC_M, NMHC_M)

# DB E10: VOC and NMHC
AUX_M <- subset(TEMP_M, TEMP_M$Blend == "E10")
AUX_M <- AUX_M[,-c(7,9)]
colnames(AUX_M) <- c("processID","sourceTypeID","fuelTypeID","modelYearID","roadTypeID","E10_VOC","City","processName","E10_NMHC")

TEMP_M <- full_join(TEMP_M,AUX_M)

# COLUMN NEW FOR VOC CORRECT
TEMP_M$VOC_Final <- TEMP_M$VOC*0

# STAR OF THE CYCLE TO ESTIMATE THE NEW VOC VALUES
n <- length(TEMP_M[,1])
unique(TEMP_M$Blend)

for(i in 1:n) {
  if (TEMP_M$Blend[i] == "E0") {
    TEMP_M$VOC_Final[i] <- TEMP_M$NMHC[i]
  } else if (TEMP_M$Blend[i] == "E10") {
    TEMP_M$VOC_Final[i] <- TEMP_M$VOC[i]
  } else if (TEMP_M$Blend[i] == "E8OX6") {
    TEMP_M$VOC_Final[i] <- TEMP_M$NMHC[i]+0.078*(TEMP_M$E10_VOC[i] - TEMP_M$E10_NMHC[i])
  }else if (TEMP_M$Blend[i] == "E6OX11") {
    TEMP_M$VOC_Final[i] <- TEMP_M$NMHC[i]+0.058*(TEMP_M$E10_VOC[i] - TEMP_M$E10_NMHC[i])
  }else if (TEMP_M$Blend[i] == "E5OX13") {
    TEMP_M$VOC_Final[i] <- TEMP_M$NMHC[i]+0.049*(TEMP_M$E10_VOC[i] - TEMP_M$E10_NMHC[i])
  }else if (TEMP_M$Blend[i] == "E3OX17") {
    TEMP_M$VOC_Final[i] <- TEMP_M$NMHC[i]+0.029*(TEMP_M$E10_VOC[i] - TEMP_M$E10_NMHC[i])
  }else  { ##OX24
    TEMP_M$VOC_Final[i] <- TEMP_M$NMHC[i]
  }
}

# DB FINAL WITH VOC CORRECT
TEMP_M <- TEMP_M[,-c(6,9,11,12,13)] %>%
  mutate(pollutantID = 87) %>%
  mutate (yearID = 2024)
  #mutate (yearID = 2031)
colnames(TEMP_M) <- c("processID","sourceTypeID","fuelTypeID","modelYearID","roadTypeID","Scenario","City","Blend","emissionQuant", "pollutantID", "yearID") 

## CUCUTA-----
# FILTER PROCESS: Evap y Refueling
C24 <- subset(c_final_em, c_final_em$processID == 11 | c_final_em$processID == 12 | c_final_em$processID == 13 | c_final_em$processID == 18 | c_final_em$processID == 19)

# DB VOC AND NMHC
VOC_C <- subset(C24, C24$pollutantID == 87)
VOC_C <- VOC_C[,-c(2,3)]
colnames(VOC_C) <- c("processID","sourceTypeID","fuelTypeID","modelYearID","roadTypeID","VOC","Scenario","City","Blend","processName")

NMHC_C <- subset(C24, C24$pollutantID == 79)
NMHC_C <- NMHC_C[,-c(2,3)]
colnames(NMHC_C) <- c("processID","sourceTypeID","fuelTypeID","modelYearID","roadTypeID","NMHC","Scenario","City","Blend","processName")

# DB TOTAL WITH POLLUTAND PER COLUMN
TEMP_C <- full_join(VOC_C, NMHC_C)

# DB E10: VOC and NMHC
AUX_C <- subset(TEMP_C, TEMP_C$Blend == "E10")
AUX_C <- AUX_C[,-c(7,9)]
colnames(AUX_C) <- c("processID","sourceTypeID","fuelTypeID","modelYearID","roadTypeID","E10_VOC","City","processName","E10_NMHC")

# DB TOTAL E10: VOC and NMHC
TEMP_C <- full_join(TEMP_C,AUX_C)

# COLUMN NEW FOR VOC CORRECT
TEMP_C$VOC_Final <- TEMP_C$VOC*0

# STAR OF THE CYCLE TO ESTIMATE THE NEW VOC VALUES
n <- length(TEMP_C[,1])
unique(TEMP_C$Blend)

for(i in 1:n) {
  if (TEMP_C$Blend[i] == "E0") {
    TEMP_C$VOC_Final[i] <- TEMP_C$NMHC[i]
  } else if (TEMP_C$Blend[i] == "E10") {
    TEMP_C$VOC_Final[i] <- TEMP_C$VOC[i]
  } else if (TEMP_C$Blend[i] == "E8OX6") {
    TEMP_C$VOC_Final[i] <- TEMP_C$NMHC[i]+0.078*(TEMP_C$E10_VOC[i] - TEMP_C$E10_NMHC[i])
  }else if (TEMP_C$Blend[i] == "E6OX11") {
    TEMP_C$VOC_Final[i] <- TEMP_C$NMHC[i]+0.058*(TEMP_C$E10_VOC[i] - TEMP_C$E10_NMHC[i])
  }else if (TEMP_C$Blend[i] == "E5OX13") {
    TEMP_C$VOC_Final[i] <- TEMP_C$NMHC[i]+0.049*(TEMP_C$E10_VOC[i] - TEMP_C$E10_NMHC[i])
  }else if (TEMP_C$Blend[i] == "E3OX17") {
    TEMP_C$VOC_Final[i] <- TEMP_C$NMHC[i]+0.029*(TEMP_C$E10_VOC[i] - TEMP_C$E10_NMHC[i])
  }else  { ##OX24
    TEMP_C$VOC_Final[i] <- TEMP_C$NMHC[i]
  }
}

# DB FINAL WITH VOC CORRECT
TEMP_C <- TEMP_C[,-c(6,9,11,12,13)] %>%
  mutate(pollutantID = 87) %>%
  mutate (yearID = 2024)
  #mutate (yearID = 2031)
colnames(TEMP_C) <- c("processID","sourceTypeID","fuelTypeID","modelYearID","roadTypeID","Scenario","City","Blend","emissionQuant", "pollutantID", "yearID") 

# DB CORRECT VOC
# DELETE PROCESS VOC RECORDS: Evap y Refueling
b_total <- subset(b_total_em, !(pollutantID == 87 & processID == 11))
b_total <- subset(b_total, !(pollutantID == 87 & processID == 12))
b_total <- subset(b_total, !(pollutantID == 87 & processID == 13))
b_total <- subset(b_total, !(pollutantID == 87 & processID == 18))
b_total <- subset(b_total, !(pollutantID == 87 & processID == 19))

m_total <- subset(m_total_em, !(pollutantID == 87 & processID == 11))
m_total <- subset(m_total, !(pollutantID == 87 & processID == 12))
m_total <- subset(m_total, !(pollutantID == 87 & processID == 13))
m_total <- subset(m_total, !(pollutantID == 87 & processID == 18))
m_total <- subset(m_total, !(pollutantID == 87 & processID == 19))

c_total <- subset(c_total_em, !(pollutantID == 87 & processID == 11))
c_total <- subset(c_total, !(pollutantID == 87 & processID == 12))
c_total <- subset(c_total, !(pollutantID == 87 & processID == 13))
c_total <- subset(c_total, !(pollutantID == 87 & processID == 18))
c_total <- subset(c_total, !(pollutantID == 87 & processID == 19))    

## 4.1. DB FINAL WITH VOC CORRECTION BY CITY (contains process name) -----
B24 <-bind_rows(b_total, TEMP_B) 
M24 <-bind_rows(m_total, TEMP_M)
C24 <-bind_rows(c_total, TEMP_C)

## 5.0. CORRECTION CO EMISSIONS OF GASOLINE ------

#Apply only for fuels with ETBE. Essential to have CO pollutant results for fuel scenario E0.
#CO_Start Emissions (oxy-fuel,source type)=  CO_Start Emissions (E0,source type)* [CO_Running Emissions(oxy-fuel,source type) /CO_Running Emissions(E0,source type)]
#(1,15) 'Running'
#(2,16) 'Starts'

# ## BOGOTA-----
# # FILTER PROCESS: Stars and Running
B24CO <- subset(B24, B24$fuelTypeID == 1)
B24CO <- subset ( B24CO  , B24CO$pollutantID == 2)
B24CO <- subset(B24CO, B24CO$processID == 1 | B24CO$processID == 15 | B24CO$processID == 2 | B24CO$processID == 16)

# DB CO Stars
CO_Stars_B <- subset(B24CO, B24CO$processID == 2 | B24CO$processID == 16)
CO_Stars_B <- aggregate(CO_Stars_B$emissionQuant, list(CO_Stars_B$sourceTypeID, CO_Stars_B$modelYearID, CO_Stars_B$Scenario,  CO_Stars_B$City, CO_Stars_B$Blend ), sum, na.rm=TRUE)
colnames(CO_Stars_B) <- c("sourceTypeID","modelYearID","Scenario","City","Blend","CO_Stars")

# DB CO Run
CO_Run_B <- subset(B24CO,  B24CO$processID == 1 | B24CO$processID == 15)  #%>%
  #  filter(roadTypeID == 5)
CO_Run_B<- aggregate(CO_Run_B$emissionQuant, list(CO_Run_B$sourceTypeID, CO_Run_B$modelYearID, CO_Run_B$Scenario,  CO_Run_B$City, CO_Run_B$Blend ), sum, na.rm=TRUE)
colnames(CO_Run_B) <- c("sourceTypeID","modelYearID","Scenario","City","Blend","CO_Run" )

# DB CO : Stars and Running
CO_B <- full_join(CO_Stars_B,CO_Run_B)

# DB E0 Stars
AUXCO_Stars_B <- subset(CO_Stars_B, CO_Stars_B$Blend == "E0" )
AUXCO_Stars_B<- aggregate(AUXCO_Stars_B$CO_Stars, list(AUXCO_Stars_B$sourceTypeID, AUXCO_Stars_B$modelYearID,  AUXCO_Stars_B$City), sum, na.rm=TRUE)
colnames(AUXCO_Stars_B) <- c("sourceTypeID","modelYearID","City","E0_CO_Stars")

# DB E0 Running
AUXCO_Run_B <- subset(CO_Run_B, CO_Run_B$Blend == "E0")
AUXCO_Run_B<- aggregate(AUXCO_Run_B$CO_Run, list(AUXCO_Run_B$sourceTypeID, AUXCO_Run_B$modelYearID,  AUXCO_Run_B$City), sum, na.rm=TRUE)
colnames(AUXCO_Run_B) <- c("sourceTypeID","modelYearID","City","E0_CO_Run")

# DB E0 CO : Stars and Running
AUXCO_B <- full_join(AUXCO_Stars_B,AUXCO_Run_B)

# DB TOTALCO : Stars and Running
TEMPCO_B <- full_join(CO_B,AUXCO_B)

# COLUMN NEW FOR VOC CORRECT
TEMPCO_B$CO_Stars_Final <- TEMPCO_B$CO_Stars*0

# STAR OF THE CYCLE TO ESTIMATE THE NEW CO VALUES
n <- length(TEMPCO_B[,1])
unique(TEMPCO_B$Blend)

#(1,15) 'Running'
#(2,16) 'Starts'

#CO Start Emissions (oxy fuel, source type) =
#CO Start Emissions (E0, source type) * [CO Running Emissions (oxy fuel, source type) /
#                                         CO Running Emissions (E0, source type) ]

for(i in 1:n) {
  if (TEMPCO_B$Blend[i] == "E0") {
    TEMPCO_B$CO_Stars_Final[i] <- TEMPCO_B$CO_Stars[i]
  }else  { ##E10 -OX24
    TEMPCO_B$CO_Stars_Final[i] <- TEMPCO_B$E0_CO_Stars[i] * ((TEMPCO_B$CO_Run[i] )/(TEMPCO_B$E0_CO_Run[i]))
  }
}

TEMPCO_B <- TEMPCO_B [,-c(6,7,8,9)] %>%
  #  mutate (yearID = 2024) %>%
   mutate (yearID = 2031) %>%
  mutate(pollutantID = 2) %>%
  mutate (processID = 16)  %>%
  mutate (fuelTypeID = 1)  %>%
  mutate (roadTypeID = 1)  
colnames(TEMPCO_B) <- c("sourceTypeID","modelYearID","Scenario","City","Blend","emissionQuant", "yearID","pollutantID", "processID","fuelTypeID","roadTypeID" ) 


# ## MEDELLIN-----
# # FILTER PROCESS: Stars and Running
M24CO <- subset(M24, M24$fuelTypeID == 1)
M24CO <- subset ( M24CO  , M24CO$pollutantID == 2)
M24CO <- subset(M24CO, M24CO$processID == 1 | M24CO$processID == 15 | M24CO$processID == 2 | M24CO$processID == 16)

# DB CO Stars
CO_Stars_M <- subset(M24CO, M24CO$processID == 2 | M24CO$processID == 16)
CO_Stars_M<- aggregate(CO_Stars_M$emissionQuant, list(CO_Stars_M$sourceTypeID, CO_Stars_M$modelYearID, CO_Stars_M$Scenario,  CO_Stars_M$City, CO_Stars_M$Blend ), sum, na.rm=TRUE)
colnames(CO_Stars_M) <- c("sourceTypeID","modelYearID","Scenario","City","Blend","CO_Stars")

# DB CO Run
CO_Run_M <- subset(M24CO,  M24CO$processID == 1 | M24CO$processID == 15)  #%>%
  #  filter(roadTypeID == 5)
CO_Run_M<- aggregate(CO_Run_M$emissionQuant, list(CO_Run_M$sourceTypeID, CO_Run_M$modelYearID, CO_Run_M$Scenario,  CO_Run_M$City, CO_Run_M$Blend ), sum, na.rm=TRUE)
colnames(CO_Run_M) <- c("sourceTypeID","modelYearID","Scenario","City","Blend","CO_Run" )

# DB CO : Stars and Running
CO_M <- full_join(CO_Stars_M,CO_Run_M)

# DB E0 Stars
AUXCO_Stars_M <- subset(CO_Stars_M, CO_Stars_M$Blend == "E0" )
AUXCO_Stars_M<- aggregate(AUXCO_Stars_M$CO_Stars, list(AUXCO_Stars_M$sourceTypeID, AUXCO_Stars_M$modelYearID,  AUXCO_Stars_M$City), sum, na.rm=TRUE)
colnames(AUXCO_Stars_M) <- c("sourceTypeID","modelYearID","City","E0_CO_Stars")

# DB E0 Running
AUXCO_Run_M <- subset(CO_Run_M, CO_Run_M$Blend == "E0")
AUXCO_Run_M<- aggregate(AUXCO_Run_M$CO_Run, list(AUXCO_Run_M$sourceTypeID, AUXCO_Run_M$modelYearID,  AUXCO_Run_M$City), sum, na.rm=TRUE)
colnames(AUXCO_Run_M) <- c("sourceTypeID","modelYearID","City","E0_CO_Run")

# DB E0 CO : Stars and Running
AUXCO_M <- full_join(AUXCO_Stars_M,AUXCO_Run_M)

# DB TOTALCO : Stars and Running
TEMPCO_M <- full_join(CO_M,AUXCO_M)

# COLUMN NEW FOR VOC CORRECT
TEMPCO_M$CO_Stars_Final <- TEMPCO_M$CO_Stars*0

# STAR OF THE CYCLE TO ESTIMATE THE NEW CO VALUES
n <- length(TEMPCO_M[,1])
unique(TEMPCO_M$Blend)

#(1,15) 'Running'
#(2,16) 'Starts'

#CO Start Emissions (oxy fuel, source type) =
#CO Start Emissions (E0, source type) * [CO Running Emissions (oxy fuel, source type) /
#                                         CO Running Emissions (E0, source type) ]

for(i in 1:n) {
  if (TEMPCO_M$Blend[i] == "E0") {
    TEMPCO_M$CO_Stars_Final[i] <- TEMPCO_M$CO_Stars[i]
  }else  { ##E10 -OX24
    TEMPCO_M$CO_Stars_Final[i] <- TEMPCO_M$E0_CO_Stars[i] * ((TEMPCO_M$CO_Run[i] )/(TEMPCO_M$E0_CO_Run[i]))
  }
}

TEMPCO_M <- TEMPCO_M [,-c(6,7,8,9)] %>%
  #  mutate (yearID = 2024) %>%
   mutate (yearID = 2031) %>%
  mutate(pollutantID = 2) %>%
  mutate (processID = 16)  %>%
  mutate (fuelTypeID = 1)  %>%
  mutate (roadTypeID = 1)  
colnames(TEMPCO_M) <- c("sourceTypeID","modelYearID","Scenario","City","Blend","emissionQuant", "yearID","pollutantID", "processID","fuelTypeID","roadTypeID" ) 

# ## CUCUTA-----
# # FILTER PROCESS: Stars and Running
C24CO <- subset(C24, C24$fuelTypeID == 1)
C24CO <- subset ( C24CO  , C24CO$pollutantID == 2)
C24CO <- subset(C24CO, C24CO$processID == 1 | C24CO$processID == 15 | C24CO$processID == 2 | C24CO$processID == 16)

# DB CO Stars
CO_Stars_C <- subset(C24CO, C24CO$processID == 2 | C24CO$processID == 16)
CO_Stars_C<- aggregate(CO_Stars_C$emissionQuant, list(CO_Stars_C$sourceTypeID, CO_Stars_C$modelYearID, CO_Stars_C$Scenario,  CO_Stars_C$City, CO_Stars_C$Blend ), sum, na.rm=TRUE)
colnames(CO_Stars_C) <- c("sourceTypeID","modelYearID","Scenario","City","Blend","CO_Stars")

# DB CO Run
CO_Run_C <- subset(C24CO,  C24CO$processID == 1 | C24CO$processID == 15) #%>%
  #  filter(roadTypeID == 5)
CO_Run_C<- aggregate(CO_Run_C$emissionQuant, list(CO_Run_C$sourceTypeID, CO_Run_C$modelYearID, CO_Run_C$Scenario,  CO_Run_C$City, CO_Run_C$Blend ), sum, na.rm=TRUE)
colnames(CO_Run_C) <- c("sourceTypeID","modelYearID","Scenario","City","Blend","CO_Run" )

# DB CO : Stars and Running
CO_C <- full_join(CO_Stars_C,CO_Run_C)

# DB E0 Stars
AUXCO_Stars_C <- subset(CO_Stars_C, CO_Stars_C$Blend == "E0" )
AUXCO_Stars_C<- aggregate(AUXCO_Stars_C$CO_Stars, list(AUXCO_Stars_C$sourceTypeID, AUXCO_Stars_C$modelYearID,  AUXCO_Stars_C$City), sum, na.rm=TRUE)
colnames(AUXCO_Stars_C) <- c("sourceTypeID","modelYearID","City","E0_CO_Stars")

# DB E0 Running
AUXCO_Run_C <- subset(CO_Run_C, CO_Run_C$Blend == "E0")
AUXCO_Run_C<- aggregate(AUXCO_Run_C$CO_Run, list(AUXCO_Run_C$sourceTypeID, AUXCO_Run_C$modelYearID,  AUXCO_Run_C$City), sum, na.rm=TRUE)
colnames(AUXCO_Run_C) <- c("sourceTypeID","modelYearID","City","E0_CO_Run")

# DB E0 CO : Stars and Running
AUXCO_C <- full_join(AUXCO_Stars_C,AUXCO_Run_C)

# DB TOTALCO : Stars and Running
TEMPCO_C <- full_join(CO_C,AUXCO_C)

# COLUMN NEW FOR VOC CORRECT
TEMPCO_C$CO_Stars_Final <- TEMPCO_C$CO_Stars*0

# STAR OF THE CYCLE TO ESTIMATE THE NEW CO VALUES
n <- length(TEMPCO_C[,1])
unique(TEMPCO_C$Blend)

#(1,15) 'Running'
#(2,16) 'Starts'

#CO Start Emissions (oxy fuel, source type) =
#CO Start Emissions (E0, source type) * [CO Running Emissions (oxy fuel, source type) /
#                                         CO Running Emissions (E0, source type) ]

for(i in 1:n) {
  if (TEMPCO_C$Blend[i] == "E0") {
    TEMPCO_C$CO_Stars_Final[i] <- TEMPCO_C$CO_Stars[i]
  }else  { ##E10 -OX24
    TEMPCO_C$CO_Stars_Final[i] <- TEMPCO_C$E0_CO_Stars[i] * ((TEMPCO_C$CO_Run[i] )/(TEMPCO_C$E0_CO_Run[i]))
  }
}

TEMPCO_C <- TEMPCO_C [,-c(6,7,8,9)] %>%
  # mutate (yearID = 2024) %>%
    mutate (yearID = 2031) %>%
  mutate(pollutantID = 2) %>%
  mutate (processID = 16)  %>%
  mutate (fuelTypeID = 1)  %>%
  mutate (roadTypeID = 1)  
colnames(TEMPCO_C) <- c("sourceTypeID","modelYearID","Scenario","City","Blend","emissionQuant", "yearID","pollutantID", "processID","fuelTypeID","roadTypeID" ) 

## DB FINAL CORRECT CO
#REMOVE - OC RECORDS OF PROCESS: Stars
bog_total <- subset(B24, !(pollutantID == 2 & processID == 2 & fuelTypeID == 1))
bog_total <- subset(bog_total, !(pollutantID == 2 & processID == 16 & fuelTypeID == 1))

med_total <- subset(M24, !(pollutantID == 2 & processID == 2 & fuelTypeID == 1))
med_total <- subset(med_total, !(pollutantID == 2 & processID == 16 & fuelTypeID == 1))

cuc_total <- subset(C24, !(pollutantID == 2 & processID == 2 & fuelTypeID == 1))
cuc_total <- subset(cuc_total, !(pollutantID == 2 & processID == 16 & fuelTypeID == 1))

## 5.1. DB FINAL WITH CO CORRECTION BY CITY (contains process name)----
B24 <-bind_rows(bog_total,TEMPCO_B)
M24 <-bind_rows(med_total,TEMPCO_M)
C24 <-bind_rows(cuc_total,TEMPCO_C)

## 6.0. DB FINAL  -----
# DB UNCORRECTED (VOC and CO)----
final_uncorrected_em24 <-bind_rows(b_total_em, m_total_em) %>%
  bind_rows(c_total_em)
final_uncorrected_em24 <-merge(final_uncorrected_em24, procesos[,c(1,2)], by=c('processID')) 
write.csv(final_uncorrected_em24, 'final_em31_T_VOC_CO_Uncorrected.csv', row.names=F)


# DB CORRECTED (VOC and CO)-----
final_em24 <-bind_rows(B24, M24) %>%
  bind_rows(C24)
final_em24 <-merge(final_em24, procesos[,c(1,2)], by=c('processID')) 
write.csv(final_em24, 'final_em24_T_VOC_CO_Correct2.csv', row.names=F)


## CLEARS MEMORY - PREVIOUS DATABASE
rm(BE10, BE03, BE8OX6C, BE6OX11, BE5OX13, BE3OX17, BOX24, NMHC_B, VOC_B, AUX_B, TEMP_B, b_final_em, b_total_em, b_total )
rm(ME0, ME10, ME8OX6, ME5OX13, MOX24, NMHC_M, VOC_M, AUX_M, TEMP_M, m_final_em, m_total_em, m_total )
rm(CE0, CE10, CE8OX6, CE5OX13, COX24, NMHC_C, VOC_C, AUX_C, TEMP_C, c_final_em, c_total_em, c_total )
rm(B24CO, CO_Stars_B, CO_Run_B, CO_B, AUXCO_Stars_B, AUXCO_Run_B, AUXCO_B, bog_total ) # ,TEMPCO_B
rm(M24CO, CO_Stars_M, CO_Run_M, CO_M, AUXCO_Stars_M, AUXCO_Run_M, AUXCO_M, med_total ) # ,TEMPCO_M
rm(C24CO, CO_Stars_C, CO_Run_C, CO_C, AUXCO_Stars_C, AUXCO_Run_C, AUXCO_C, cuc_total ) # ,TEMPCO_C
rm(BBE10, BEB03, BBE5OX13, BBOX24)
rm(MME0, MME10, ME5OX13, MMOX24 )
rm(CCE0, CCE10, CE5OX13, CCOX24 )


## 6.1. EXPORT DB OF INTEREST------
# Emission by process
Emissions_24 <-
  final_em24 %>%
  mutate(Process = ifelse(processID %in% c(1,15), 'Running',
                          ifelse(processID %in% c(2,16), 'Starts',
                                 ifelse(processID %in% c(11,12,13), "Evap", 
                                        ifelse(processID %in% c(18,19), "Refueling",processName)))))%>%  
  # micontaminanteID = ifelse(pollutantID == 87, 'COV',
  #                           ifelse(pollutantID == 2, "CO",
  #                                  ifelse(pollutantID == 3, 'NOx', "PM2.5")))) %>% 
  #filter(pollutantID %in% c(2,3,87,110) ) %>% #& fuelTypeID==1  & fuelTypeID ==2
  #filter (fuelTypeID==1) %>%
  # filter (pollutantID == 2) %>%
  group_by(Scenario, pollutantID, Process) %>%
  summarise(total = sum(emissionQuant/1000000))
write.csv(Emissions_24, 'EmissionProcess-total-gasoline-correct-voc-co_31-final.csv', row.names=F)


# Evaporative emission by process evap.
Emissions_Evap24 <-
  final_em24 %>%
  filter(pollutantID == 87 & fuelTypeID == 1 & processID %in% c(11,12,13,18,19)) %>%
  mutate(micontaminanteID = ifelse(pollutantID == 87, 'COV',pollutantID)) %>%
  group_by(Scenario, micontaminanteID, processName) %>%
  summarise(total = sum(emissionQuant/1000000)) 
write.csv(Emissions_Evap24, 'EmissionProcess_T_Evap_VOC_Correct24_final.csv', row.names=F) 

# Emission by vehicular category
Emissions_category24 <-
  final_em24 %>%
  #filter (City == "Bogota") %>%
  mutate(Process = ifelse(processID %in% c(1,15), 'Running',
                          ifelse(processID %in% c(2,16), 'Starts',
                                 ifelse(processID %in% c(11,12,13), "Evap",
                                        ifelse(processID %in% c(18,19), "Refueling",processName)))))%>%  
  # # micontaminanteID = ifelse(pollutantID == 87, 'VOC',
  #                           ifelse(pollutantID == 2, "CO",
  #                                  ifelse(pollutantID == 3, 'NOx', "PM2.5")))) %>% 
  #filter(pollutantID %in% c(2,3,87,110) ) %>% #& fuelTypeID==1  & fuelTypeID ==2
  group_by(City, Scenario, sourceTypeID, pollutantID ) %>% #Process
  summarise(total = sum(emissionQuant/1000000))
write.csv(Emissions_category24, 'EmissionCat_final_corrected_em24.csv', row.names=F)



## 7.0. GRAPHICS -----
#Change city to graph and file name

# NON-NORMALIZED GRAPHS----
png('Bta_Esc_Summary24.png', width=20,height=8,unit="in",res=300)
final_em24%>%
  filter (City == "Bogota") %>%
   filter (yearID == 2024) %>%
   #filter (yearID == 2031) %>%
  mutate(miprocesoID = ifelse(processID %in% c(1,15), 'Running',
                              ifelse(processID %in% c(2,16), 'Starts',
                                     ifelse(processID %in% c(11,12,13), "Evap", 
                                            ifelse(processID %in% c(18,19), "Refueling",processName)))),
         micontaminanteID = ifelse(pollutantID == 87, 'VOC',
                                   ifelse(pollutantID == 2, "CO",
                                          ifelse(pollutantID == 3, 'NOx', "PM2.5")))) %>% 
  filter(pollutantID %in% c(2,3,87,110) ) %>% #& fuelTypeID==1
  group_by(Scenario, micontaminanteID, miprocesoID) %>%
  summarise(total = sum(emissionQuant/1000000)) %>%
  ggplot (.)+
  geom_col(aes(x=Scenario, y=total, fill=miprocesoID))+
  scale_y_continuous(labels = scales::label_number_si())+ 
  scale_fill_brewer(name='Emission process', palette='Accent') + 
  labs(y='Emission total (ton/year)', title='Comparison of total emissions by scenario, pollutant and process')+
  facet_wrap(micontaminanteID ~., scales='free', ncol=2)+
  theme_bw()+
  theme(axis.text = element_text(size=10))+
  theme(axis.title=element_text(size=13,face="bold", colour="black"))+
  theme(title=element_text(size=13, colour="black"))+
  theme(legend.position = 'top')
dev.off()


png('Bta_Esc_evap_VOC.png', width=10,height=8,unit="in",res=300)
final_em24%>%
  filter (City == "Bogota") %>%
  filter (yearID == 2024) %>%
  #filter (yearID == 2031) %>%
  filter(pollutantID == 87  & processID %in% c(11,12,13,18,19)) %>% # & fuelTypeID == 1
  mutate(micontaminanteID = ifelse(pollutantID == 87, 'VOC',pollutantID)) %>%
  group_by(Scenario, micontaminanteID, processName) %>%
  summarise(total = sum(emissionQuant/1000000)) %>%
  ggplot(.)+
  geom_col(aes(x=Scenario, y=total, fill=processName))+
  scale_fill_brewer(name='Emission process', palette='Set3') + #google RColor Palettes
  labs(y='Emission total (ton/year)', title='Comparison of evaporative emissions of vehicles by scenario and process')+
  facet_wrap(micontaminanteID ~., scales='free', ncol=2)+
  theme_bw()+
  theme(axis.text = element_text(size=15))+
  theme(axis.title=element_text(size=15, colour="black"))+
  theme(title=element_text(size=13, colour="black"))+
  theme(legend.position = 'right')
dev.off()


# NORMALIZED GRAPHS -----
final_em24%>%
  filter (City == "Bogota") %>%
  filter (yearID == 2024) %>%
  #filter (yearID == 2031) %>%
  mutate(miprocesoID = ifelse(processID %in% c(1,15), 'Running',
                              ifelse(processID %in% c(2,16), 'Starts',
                                     ifelse(processID %in% c(11,12,13), "Evap", 
                                            ifelse(processID %in% c(18,19), "Refueling",processName)))),
         micontaminanteID = ifelse(pollutantID == 87, 'COV',
                                   ifelse(pollutantID == 2, "CO",
                                          ifelse(pollutantID == 3, 'NOx', "PM2.5")))) %>% 
  filter(pollutantID %in% c(2,3,87,110) ) %>% #& fuelTypeID==1
  group_by(Scenario_c, micontaminanteID, miprocesoID) %>%
  summarise(total = sum(emissionQuant/1000000)) %>%
  ggplot (.)+
  #geom_col(aes(x=Scenario, y=total, fill=miprocesoID), stat = "identity", position = "fill")+
  geom_bar (aes(x=Scenario_c, y=total, fill=miprocesoID), stat = "identity", position = "fill" )+
  scale_y_continuous(labels = scales::percent)+
  #scale_y_continuous(labels = scales::label_number_si())+ 
  scale_fill_brewer(name='Emission process', palette='Accent') + 
  labs(y='Emission total (ton/year)', title='Comparison of total emissions from gasoline vehicles by scenario, pollutant and process')+
  facet_wrap(micontaminanteID ~., scales='free', ncol=2)+
  theme_bw()+
  theme(legend.position = 'top')

png('Bta_Esc_evap.png', width=6,height=8,unit="in",res=300)
final_em24%>%
  filter (City == "Bogota") %>%
  filter (yearID == 2024) %>%
  #filter (yearID == 2031) %>%
  filter(pollutantID == 87  & processID %in% c(11,12,13,18,19)) %>% #& fuelTypeID == 1
  mutate(micontaminanteID = ifelse(pollutantID == 87, 'COV',pollutantID)) %>%
  group_by(Scenario, micontaminanteID, processName) %>%
  summarise(total = sum(emissionQuant/1000000)) %>%
  ggplot(.)+
  #geom_col(aes(x=Scenario, y=total, fill=processName))+
  geom_bar (aes(x=Scenario, y=total, fill=processName), stat = "identity", position = "fill" )+
  scale_y_continuous(labels = scales::percent)+
  scale_fill_brewer(name='Emission process', palette='Set3') + 
  labs(y='Emission total (ton/year)', title='Comparison of evaporative VOC emissions from gasoline vehicles by scenario and process')+
  facet_wrap(micontaminanteID ~., scales='free', ncol=2)+
  theme_bw()+
  theme(legend.position = 'right')
dev.off()



