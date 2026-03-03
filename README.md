#  Analyses_Zayan_et_al_NatureComm

Repository for Analysis software used for all analyses 


# LFP analyses

## Overview and install

The python book available (<code>GenerateFiguresLFP_V1</code>) analyses LFP signals from the compiled data (https://amubox.univ-amu.fr/s/KFrxfd8wK2ZSczq) and individually produce the figures and executes statistical tests. 

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

- the File named <code>GenerateFiguresLFP_V1</code> contains the code needed for the analysis of LFP file and representations (all figures)
- the output of the different section are either figures or statistical outputs
- the file named DataframeNCUZUpdated160724.csv contains the file and parameters of each individual data file (file name, date, Stimulation applied, Side , genetic line) 



## System Requirements

The package development version is tested on Linux operating systems. The developmental version of the package has been tested on the following systems:

Linux: Ubuntu / 2026<br>
Mac OSX:<br>
Windows: <br>

## Software Requirements

Any API for code writing (VS Code, JupyterNotebook) <br>
Tested on Python version 3.12.4


### Python Dependencies

<code>GenerateFiguresLFP_V1</code> mainly depends on the Python scientific stack.

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

# Multiunit analyses

<br>

From Neuronexus .xdat files 

--> convert files into .zarr

--> convert files into .dat


From .dat files run into Spyking circus
	
--> To do clusturing
	
--> To do manual curation 


From spyking circus files

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


<br>

# Calcium imaging analyses

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

# License
<br>

This project is covered under the #Apache 2.0# License.



<br>
<br>

