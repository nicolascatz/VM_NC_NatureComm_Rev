#  Analyses_Zayan_et_al_NatureComm

Repository for Analysis software used for all analyses 


# LFP analyses

## Overview and install

The python book available (<code>Generate_Figures_LFP_animals.ipynb</code> and <code>Generate_Figures_LFP_channels.ipynb</code>) analyses LFP signals from the compiled data (https://amubox.univ-amu.fr/s/KFrxfd8wK2ZSczq) and individually produce the figures and executes statistical tests. 

In a given folder, create 1 subfolder named "figures"
Place the downloaded data file and the CSV file in the root directory



## Repo Contents

### Data structure

You can find the LFP data in a single compiled file (>8 Gb) with the link 
https://amubox.univ-amu.fr/s/KFrxfd8wK2ZSczq

A single variable contains all the data. <br>

<code>LfpPop=np.load(os.path.join(pathroot,'LfpPop.npy'),allow_pickle=True)<br>
LfpPop.shape <br>
</code>

(390,1)  <br>

Each row correspond to a given file (same row than in <code>DataframeNCUZUpdated160724.csv</code><br>


<code>LfpPop[0].shape</code>

(1,35)  <br>
Each column correspond to a given channel (electrode) from the file ID=0 <br>

<code>LfpPop[0][0,10].shape</code> <br>

(7,20001) <br>

Each row correspond to a given trial and each column to a time point (in ms realigned on stimulation onset) <br>

### Files

- the File named <code>Generate_Figures_LFP_animals</code> contains the code needed for the analysis of LFP file and representations (all figures)
- the output of the different section are either figures or statistical outputs
- the file named DataframeNCUZUpdated160724.csv contains the file and parameters of each individual data file (file name, date, Stimulation applied, Side , genetic line) 




# Multiunit analyses

<br>

## From Neuronexus .xdat files 

--> convert files into .zarr

--> convert files into .dat


## From .dat files run into Spyking circus
	
--> To do clustering
	
--> To do manual curation 


## From spyking circus files

--> open 
			1_thq_cool_process_sdf.ipynb
			1_thq_hot_process_sdf.ipynb
			1_tactile_process_sdf.ipynb


--> then open 
	2_Df_cluster_resp_rate.ipynb
	3_Df_mean_sdf_period_cluster.ipynb
	4_listing_valid_neurons_threshold.ipynb


--> then make the plot with 
	5_Fig_Tac_WT_svg.ipynb
	5_Fig_Thq_WT_svg.ipynb
	5_Fig_Tac_WT_vs_ML2_svg.ipynb
	5_Fig_Thq_WT_vs_ML2_svg.ipynb



# Calcium imaging analyses

Widefield calcium imaging codes are available **https://amubox.univ-amu.fr/s/NEC9F9E2pbNre7o**
	
Widefield calcium imaging data were analysed using scripts located in: CALCIUM/Read_movie/
	
These scripts extract calcium fluorescence signals from widefield imaging movies and synchronize imaging frames with thermode stimulation data recorded through the Allego acquisition system.
The analysis workflow consists of loading stimulation timing information, synchronizing imaging and stimulation signals, and extracting fluorescence traces from regions of interest.
	
## Data

The datasets required to run this analysis are available upon request.<br>
Please download the dataset and place the files in the working directory before running the notebooks.<br>

The analysis requires the following input files.<br>

###  Widefield calcium imaging movies

Imaging data are provided as TIFF files: *.tif<br>
Each file contains the full calcium imaging movie recorded during stimulation experiments.<br>

###  Mask of the region responsive to tactile stimulation
The region of interest responsive to tactile stimulation is provided as a binary mask image (*.tif).
These masks were manually created for each recording and used as a reference to visually validate the tactile stimulation masks generated automatically by the analysis scripts. The resulting masks are used to define the regions from which calcium fluorescence signals are extracted.

### Thermode stimulation data

Thermode stimulation recordings are provided as CSV files containing temperature and current measurements: *.csv
These files contain the temperature time course during stimulation.

### Allego acquisition files
Stimulation timing and synchronization signals are recorded with the Allego acquisition system.<br>
The Allego reader loads a set of files with the same base name:<br>
<basename>.xdat.json<br>
<basename>_data.xdat<br>
<basename>_timestamp.xdat<br>
These files contain metadata, signal values, and timestamps used to synchronize imaging frames with stimulation events. The reader functions load auxiliary and digital input signals to identify stimulation timing.<br>


## Analysis workflow

The calcium imaging analysis is performed using the following notebooks in the order listed below.

1. read_mask_and_allego.ipynb
   
This notebook performs the initial data loading and synchronization steps:<br>
•	loads Allego acquisition recordings containing auxiliary and digital signals<br>
•	loads thermode stimulation recordings (temperature and current)<br>
•	determines stimulation onset times from thermode and TTL signals<br>
•	aligns stimulation events with the corresponding camera frames<br>
•	generates synchronization tables linking camera frames, thermode signals, and Allego timestamps<br>
The resulting synchronization tables are saved and used in the subsequent analysis to align calcium imaging movies with stimulation events.<br>

2. read_traces_from_movie.ipynb
   
This notebook extracts calciu fluorescence signals from the imaging movies using the synchronization information generated in the previous step.
It performs the following steps:<br>
•	loads the ROI mask corresponding to the tactile-responsive region<br>
•	loads the widefield calcium imaging movie<br>
•	crops the movie to the region of interest<br>
•	loads the synchronization table produced in the previous step<br>
•	segments the movie into stimulation-aligned sweeps<br>
•	generates stimulation-aligned image stacks<br>
•	extracts fluorescence signals from masked regions and surrounding areas<br>
•	generates summary plots and stimulation-aligned calcium traces<br>
The extracted fluorescence traces represent the calcium responses to thermal stimulation.<br>

## Python scripts

The notebooks rely on additional helper functions implemented in:
my_functions.py
These functions perform tasks including:<br>
•	loading and formatting thermode stimulation data<br>
•	reading Allego acquisition signals<br>
•	synchronizing stimulation timing with imaging frames<br>
•	extracting stimulation-aligned movie segments<br>
•	computing fluorescence traces and generating plots<br>

The Allego data reader is implemented in:
allego_file_reader.py
This script reads Allego signal arrays, timestamps, and metadata from the xdat recording files.

## Outputs

Running the notebooks generates:
•	synchronization tables linking stimulation events with camera frames
•	stimulation-aligned imaging sequences
•	fluorescence traces extracted from masked regions
•	summary figures illustrating calcium responses across stimulation sweeps
These outputs are used for downstream analyses and figure generation.



For each conditions run the code inside the corresponding folder following the order to analyse and generate plots

	--> Tactile
	--> Tactile_vs_Tactile_urethane
	--> Thermic
	--> Thermic_vs_Thermic_urethane
	--> Warm_vs_Cool


To get the analysis of receptive field overlapping between conditions, open 

	--> Receptive_field_overlapping.ipynb

To get the analysis of the stereotaxic coordiantes

	--> stereotaxic_coordinates_mapping.ipynb




# System Requirements

The package development version is tested on Linux operating systems. The developmental version of the package has been tested on the following systems:

Linux: Ubuntu / 2026<br>
Mac OSX:<br>
Windows: <br>

# Software Requirements

Any API for code writing (VS Code, JupyterNotebook) <br>
Tested on Python version 3.12.4


## Python Dependencies

### for LFP

<code>Generate_Figures_LFP_animals</code> and <code>Generate_Figures_LFP_channels</code> mainly depends on the Python scientific stack.

<div style="display: flex; background-color: #f6f8fa; padding: 16px; border: 1px solid #d0d7de; border-radius: 6px; margin-top: 10px; margin-bottom: 20px; font-family: 'SFMono-Regular', Consolas, 'Liberation Mono', Menlo, monospace; font-size: 14px; width: fit-content;">
  numpy<br>
  scipy<br>
  matplotlib<br>
  pandas<br>
  statsmodels<br>
  scikit-learn<br>
  os<br>
  seaborn
</div>

<br>
<br>

### For SPIKE

<code>analysis.yml</code>
<code>circus.yml</code>
<code>xdatconverter.yml</code>
<code>zarrconverter.yml</code>

# License
<br>

This project is covered under the **Apache 2.0** License.



<br>
<br>

