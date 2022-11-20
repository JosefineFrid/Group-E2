# Group-E2
Project in MNXB01.

How to use the program: 
First start with the first clean up program from tutorial 3 that is used to get rid of irrelevant data.
First you clean up the data with cleanup1.sh and the input the datafile, write in the command line: ./cleanup1.sh path/smhi-opendata_1_53430_20210926_101122_Lund.csv

For example: ./cleanup1.sh /home/josefine9/tutorial3/casestudy/data/smhi-opendata_1_52230_20210906_212532.csv

The output file rawdata_smhi-opendata_1_52230_20210906_212532.csv is what you will use in the next clean up file.
The file is already in the program, you will have to change the path if it doesn't correspond with what is in the file. This is what is written in the cleanup2 file:

SOURCEFILE=src/rawdata_smhi-opendata_1_53430_20210926_101122_Lund.csv
DATAFILE=rawdata_smhi-opendata_1_53430_20210926_101122_Lund.csv

To run the cleanup2 program you type in the year that you would like to create a graph for. You can choose any year between 1863-2020.
To run it you write ./cleanup2.sh year in the command line.
For example: ./cleanup2.sh 1900

The output file that you will use for the ROOT program is: tempMonth_year, in the example the output file would be tempMonth_1900.

To create the graph you have to enter root in the shell. Load the program and then execute it and adding the tempMonth_year file from cleanup2.sh.
For example:
root
.L graph_tempMonth.C
.x graph_tempMonth.C("tempMonth_1900")

The output will be a graph of the average temperature per month in that year.

