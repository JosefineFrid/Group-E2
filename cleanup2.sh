#!/bin/bash

## Clean up data after the input year
## ./cleanup.sh 1900

INPUTYEAR=$1

SOURCEFILE=src/rawdata_smhi-opendata_1_53430_20210926_101122_Lund.csv
DATAFILE=rawdata_smhi-opendata_1_53430_20210926_101122_Lund.csv

################################## TAKE AWAY Y VALUES #############################

if [[ "x$INPUTYEAR" == 'x' ]]; then
   echo "Missing input year, exiting"
   exit 1
fi

if [[ "$INPUTYEAR" -lt 1863 || "$INPUTYEAR" -gt 2020 ]]; then
   echo "Year must be between 1863-2020"
   exit 1
fi

cp -a $SOURCEFILE ./copy_$DATAFILE

if [[ $? != 0 ]]; then
   echo "Error downloading or copying file, maybe wrong command syntax? exiting...."
   exit 1
fi

echo "Finding the first line containing $INPUTYEAR..."
STARTLINE=$(grep -n $INPUTYEAR copy_${DATAFILE} | cut -d ":" -f 1 | head -n 1)
LASTLINE=$(grep -n $INPUTYEAR copy_${DATAFILE} | cut -d ":" -f 1 | tac | head -n 1)

tail -n +$STARTLINE copy_${DATAFILE} > version1_${DATAFILE}
STARTLINE=$(( $LASTLINE - $STARTLINE + 1 ))
head -n +$STARTLINE version1_${DATAFILE} > version2_${DATAFILE}

## Fix each months temperature

## JANUARY
TOTALTEMPJAN=$(grep -n "$INPUTYEAR-01" version2_${DATAFILE} | awk '{print $3}' | awk '{ sum += $1 } END { print sum }')
STARTLINEJAN=$(grep -n "$INPUTYEAR-01" version2_${DATAFILE} | cut -d ":" -f 1 | head -n 1)
LASTLINEJAN=$(grep -n "$INPUTYEAR-01" version2_${DATAFILE} | cut -d ":" -f 1 | tac | head -n 1)
NUMBEROFTEMPJAN=$(( $LASTLINEJAN - $STARTLINEJAN ))
AVERAGETEMPJAN=$(echo "scale=2; $TOTALTEMPJAN / $NUMBEROFTEMPJAN" | bc -l | sed -e 's/^-\./-0./' -e 's/^\./0./')


## FEBRUARY
TOTALTEMPFEB=$(grep -n "$INPUTYEAR-02" version2_${DATAFILE} | awk '{print $3}' | awk '{ sum += $1 } END { print sum }')
STARTLINEFEB=$(grep -n "$INPUTYEAR-02" version2_${DATAFILE} | cut -d ":" -f 1 | head -n 1)
LASTLINEFEB=$(grep -n "$INPUTYEAR-02" version2_${DATAFILE} | cut -d ":" -f 1 | tac | head -n 1)
NUMBEROFTEMPFEB=$(( $LASTLINEFEB - $STARTLINEFEB ))
AVERAGETEMPFEB=$(echo "scale=2; $TOTALTEMPFEB / $NUMBEROFTEMPFEB" | bc -l | sed -e 's/^-\./-0./' -e 's/^\./0./')


## MARCH
TOTALTEMPMAR=$(grep -n "$INPUTYEAR-03" version2_${DATAFILE} | awk '{print $3}' | awk '{ sum += $1 } END { print sum }')
STARTLINEMAR=$(grep -n "$INPUTYEAR-03" version2_${DATAFILE} | cut -d ":" -f 1 | head -n 1)
LASTLINEMAR=$(grep -n "$INPUTYEAR-03" version2_${DATAFILE} | cut -d ":" -f 1 | tac | head -n 1)
NUMBEROFTEMPMAR=$(( $LASTLINEMAR - $STARTLINEMAR ))
AVERAGETEMPMAR=$(echo "scale=2; $TOTALTEMPMAR / $NUMBEROFTEMPMAR" | bc -l | sed -e 's/^-\./-0./' -e 's/^\./0./')


## APRIL
TOTALTEMPAPR=$(grep -n "$INPUTYEAR-04" version2_${DATAFILE} | awk '{print $3}' | awk '{ sum += $1 } END { print sum }')
STARTLINEAPR=$(grep -n "$INPUTYEAR-04" version2_${DATAFILE} | cut -d ":" -f 1 | head -n 1)
LASTLINEAPR=$(grep -n "$INPUTYEAR-04" version2_${DATAFILE} | cut -d ":" -f 1 | tac | head -n 1)
NUMBEROFTEMPAPR=$(( $LASTLINEAPR - $STARTLINEAPR ))
AVERAGETEMPAPR=$(echo "scale=2; $TOTALTEMPAPR / $NUMBEROFTEMPAPR" | bc -l | sed -e 's/^-\./-0./' -e 's/^\./0./')


## MAY
TOTALTEMPMAY=$(grep -n "$INPUTYEAR-05" version2_${DATAFILE} | awk '{print $3}' | awk '{ sum += $1 } END { print sum }')
STARTLINEMAY=$(grep -n "$INPUTYEAR-05" version2_${DATAFILE} | cut -d ":" -f 1 | head -n 1)
LASTLINEMAY=$(grep -n "$INPUTYEAR-05" version2_${DATAFILE} | cut -d ":" -f 1 | tac | head -n 1)
NUMBEROFTEMPMAY=$(( $LASTLINEMAY - $STARTLINEMAY ))
AVERAGETEMPMAY=$(echo "scale=2; $TOTALTEMPMAY / $NUMBEROFTEMPMAY" | bc -l | sed -e 's/^-\./-0./' -e 's/^\./0./')


## JUNE

TOTALTEMPJUN=$(grep -n "$INPUTYEAR-06" version2_${DATAFILE} | awk '{print $3}'| awk '{ sum += $1 } END { print sum }')
STARTLINEJUN=$(grep -n "$INPUTYEAR-06" version2_${DATAFILE} | cut -d ":" -f 1 | head -n 1)
LASTLINEJUN=$(grep -n "$INPUTYEAR-06" version2_${DATAFILE} | cut -d ":" -f 1 | tac | head -n 1)
NUMBEROFTEMPJUN=$(( $LASTLINEJUN - $STARTLINEJUN ))
AVERAGETEMPJUN=$(echo "scale=2; $TOTALTEMPJUN / $NUMBEROFTEMPJUN" | bc -l | sed -e 's/^-\./-0./' -e 's/^\./0./')


## JULY

TOTALTEMPJUL=$(grep -n "$INPUTYEAR-07" version2_${DATAFILE} | awk '{print $3}' | awk '{ sum += $1 } END { print sum }')
STARTLINEJUL=$(grep -n "$INPUTYEAR-07" version2_${DATAFILE} | cut -d ":" -f 1 | head -n 1)
LASTLINEJUL=$(grep -n "$INPUTYEAR-07" version2_${DATAFILE} | cut -d ":" -f 1 | tac | head -n 1)
NUMBEROFTEMPJUL=$(( $LASTLINEJUL - $STARTLINEJUL ))
AVERAGETEMPJUL=$(echo "scale=2; $TOTALTEMPJUL / $NUMBEROFTEMPJUL" | bc -l | sed -e 's/^-\./-0./' -e 's/^\./0./')


## AUGUST

TOTALTEMPAUG=$(grep -n "$INPUTYEAR-08" version2_${DATAFILE} | awk '{print $3}' | awk '{ sum += $1 } END { print sum }')
STARTLINEAUG=$(grep -n "$INPUTYEAR-08" version2_${DATAFILE} | cut -d ":" -f 1 | head -n 1)
LASTLINEAUG=$(grep -n "$INPUTYEAR-08" version2_${DATAFILE} | cut -d ":" -f 1 | tac | head -n 1)
NUMBEROFTEMPAUG=$(( $LASTLINEAUG - $STARTLINEAUG ))
AVERAGETEMPAUG=$(echo "scale=2; $TOTALTEMPAUG / $NUMBEROFTEMPAUG" | bc -l | sed -e 's/^-\./-0./' -e 's/^\./0./')


## SEPTEMBER

TOTALTEMPSEP=$(grep -n "$INPUTYEAR-09" version2_${DATAFILE} | awk '{print $3}' | awk '{ sum += $1 } END { print sum }')
STARTLINESEP=$(grep -n "$INPUTYEAR-09" version2_${DATAFILE} | cut -d ":" -f 1 | head -n 1)
LASTLINESEP=$(grep -n "$INPUTYEAR-09" version2_${DATAFILE} | cut -d ":" -f 1 | tac | head -n 1)
NUMBEROFTEMPSEP=$(( $LASTLINESEP - $STARTLINESEP ))
AVERAGETEMPSEP=$(echo "scale=2; $TOTALTEMPSEP / $NUMBEROFTEMPSEP" | bc -l | sed -e 's/^-\./-0./' -e 's/^\./0./')


## OCTOBER

TOTALTEMPOCT=$(grep -n "$INPUTYEAR-10" version2_${DATAFILE} | awk '{print $3}' | awk '{ sum += $1 } END { print sum }')
STARTLINEOCT=$(grep -n "$INPUTYEAR-10" version2_${DATAFILE} | cut -d ":" -f 1 | head -n 1)
LASTLINEOCT=$(grep -n "$INPUTYEAR-10" version2_${DATAFILE} | cut -d ":" -f 1 | tac | head -n 1)
NUMBEROFTEMPOCT=$(( $LASTLINEOCT - $STARTLINEOCT ))
AVERAGETEMPOCT=$(echo "scale=2; $TOTALTEMPOCT / $NUMBEROFTEMPOCT" | bc -l | sed -e 's/^-\./-0./' -e 's/^\./0./')


## NOVEMBER

TOTALTEMPNOV=$(grep -n "$INPUTYEAR-11" version2_${DATAFILE} | awk '{print $3}' | awk '{ sum += $1 } END { print sum }')
STARTLINENOV=$(grep -n "$INPUTYEAR-11" version2_${DATAFILE} | cut -d ":" -f 1 | head -n 1)
LASTLINENOV=$(grep -n "$INPUTYEAR-11" version2_${DATAFILE} | cut -d ":" -f 1 | tac | head -n 1)
NUMBEROFTEMPNOV=$(( $LASTLINENOV - $STARTLINENOV ))
AVERAGETEMPNOV=$(echo "scale=2; $TOTALTEMPNOV / $NUMBEROFTEMPNOV" | bc -l | sed -e 's/^-\./-0./' -e 's/^\./0./')


## DECEMBER

TOTALTEMPDEC=$(grep -n "$INPUTYEAR-12" version2_${DATAFILE} | awk '{print $3}' | awk '{ sum += $1 } END { print sum }')
STARTLINEDEC=$(grep -n "$INPUTYEAR-12" version2_${DATAFILE} | cut -d ":" -f 1 | head -n 1)
LASTLINEDEC=$(grep -n "$INPUTYEAR-12" version2_${DATAFILE} | cut -d ":" -f 1 | tac | head -n 1)
NUMBEROFTEMPDEC=$(( $LASTLINEDEC - $STARTLINEDEC ))
AVERAGETEMPDEC=$(echo "scale=2; $TOTALTEMPDEC / $NUMBEROFTEMPDEC" | bc -l | sed -e 's/^-\./-0./' -e 's/^\./0./')

echo -e "1 $AVERAGETEMPJAN\n2 $AVERAGETEMPFEB\n3 $AVERAGETEMPMAR\n4 $AVERAGETEMPAPR\n5 $AVERAGETEMPMAY\n6 $AVERAGETEMPJUN\n7 $AVERAGETEMPJUL\n8 $AVERAGETEMPAUG\n9 $AVERAGETEMPSEP\n10 $AVERAGETEMPOCT\n11 $AVERAGETEMPNOV\n12 $AVERAGETEMPDEC" > tempMonth_$INPUTYEAR








