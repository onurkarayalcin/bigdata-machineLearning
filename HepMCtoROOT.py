import subprocess
from subprocess import call
import os
import sys

#os.chdir command is used to change directory
#subprocess works at where user is , does not apply with "cd".
os.chdir('programs/Delphes-3.3.0/')

#We can supply output and input file names from keyboard
outputFileName = raw_input("Please indicate output file name and path as path/name.root: ")

inputFileName = raw_input("Please indicate input file name and path as path/name.hepmc: ")

#Delphes command changes root file name ve hepmc file name/path.
#Root is a analyse package which is based on C++ and its file output format is .root
#HepMC is a MonteCarlo simulation package. It is the oldest MC generator but still useful to understand concept of 
#some processes. 

subprocess.call(["./DelphesHepMC", "cards/delphes_card_CMS.tcl", outputFileName, inputFileName])
#./DelphesHepMC is valid to start program.
#cards/delphes_card_CMS.tcl is needed card type to make simulation
