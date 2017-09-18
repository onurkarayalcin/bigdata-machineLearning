#!/bin/bash
//All the files needed to be analysed are exported from local directories

export path=/media/cakir/cakir_data/snowmass2/
export Ntuplerpath=/home/cakir/NtuplerAnalyzer
export macropath=/home/cakir/Desktop/PlottingTool

//These two function defined previously are used with some specific parameters
ListOfScenarios=(140PU_ 50PU_ NoPU_) 
ListOfSamples=(DiBoson BosonJets TopJets TTbar)

//With using loops, runReader.py analyzer code could be performed to all files
cd $Ntuplerpath
for i in "${ListOfScenarios[@]}"; do 
	for k in "${ListOfSamples[@]}"; do
		python /home/cakir/NtuplerAnalyzer/runReader.py "DeepSingle" $i$k
	done
done
