** playing around for manybabies phylogenetic analyses
** mehr 24oct2019-

clear all
set more off
cd ~/git/mb1-analysis-public

** get mb data
tempfile mb_baby
insheet using ./processed_data/03_data_trial_main.csv, names
save `mb_baby'

** get lab-level data
insheet using ./metadata/languages_per_lab_simple.csv, names clear
mer m:m lab using `mb_baby'

** summary data
collapse (firstnm) lab lang*, by(subid_uniq)
ta language_harm
