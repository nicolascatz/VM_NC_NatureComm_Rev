# VM_NC_NatureComm_Rev
Repository for Analysis software used for LFP analysis 

# Overview

The python book available (GenerateFiguresLFP_V1) analyses LFP signals from the compiled data (https://amubox.univ-amu.fr/s/KFrxfd8wK2ZSczq) and individually produce the figures and executes statistical tests. 

In a given folder, create 2 subfolders named "SCRIPTS" and "figures"
Place the GenerateFiguresLFP_V1 in the folder "SCRIPTS"
place the downloaded data file and the CSV file in the root directory



# Repo Contents


- You can find the LFP data in a single compiled file (>8 Gb) with the link 
https://amubox.univ-amu.fr/s/KFrxfd8wK2ZSczq

- the File named GenerateFiguresLFP_V1 contains the code needed for the analysis of LFP file and representations (all figures)
- the output of the different section are either figures or statisical outputs
- the file named DataframeNCUZUpdated160724.csv contains the file and parameters of each individual data file (file name, date, Stimulation applied, Side , genetic line) 



# System Requirements

The package development version is tested on Linux operating systems. The developmental version of the package has been tested on the following systems:

Linux: Ubuntu / 2026
Mac OSX:
Windows: 

# Software Requirements

Any API for code writing (VS Code, JupyterNotebook)
Tested on Python version 3.12.4

## Python Dependencies

numpy
scipy
scikit-learn
pandas
matplotlib
os
seaborn 
statsmodels



  Nicolas Catz / 2026
