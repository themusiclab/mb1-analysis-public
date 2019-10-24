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

** add glottocodes (hard-coded)
gen glottocode = ""
replace glottocode = "dutc1256" if language_harmonized=="Dutch"
replace glottocode = "stan1293" if language_harmonized=="English (AUS)"
replace glottocode = "cana1268" if language_harmonized=="English (CAN)"
replace glottocode = "stan1293" if language_harmonized=="English (UK)"
replace glottocode = "nort3314" if language_harmonized=="English (US)"
replace glottocode = "stan1290" if language_harmonized=="French"
replace glottocode = "queb1247" if language_harmonized=="French (CAN)"
replace glottocode = "stan1295" if language_harmonized=="German"
replace glottocode = "stan1295" if language_harmonized=="German (Swiss)"
replace glottocode = "hung1274" if language_harmonized=="Hungarian"
replace glottocode = "ital1282" if language_harmonized=="Italian"
replace glottocode = "nucl1643" if language_harmonized=="Japanese"
replace glottocode = "kore1280" if language_harmonized=="Korean"
replace glottocode = "mand1415" if language_harmonized=="Mandarin"
replace glottocode = "norw1258" if language_harmonized=="Norwegian"
replace glottocode = "stan1288" if language_harmonized=="Spanish (MEX)"
replace glottocode = "nucl1301" if language_harmonized=="Turkish"

** add language family info (hard-coded)
gen langfam = ""
replace langfam = "Indo-European|Germanic" if language_harmonized=="Dutch"
replace langfam = "Indo-European|Germanic" if language_harmonized=="English (AUS)"
replace langfam = "Indo-European|Germanic" if language_harmonized=="English (CAN)"
replace langfam = "Indo-European|Germanic" if language_harmonized=="English (UK)"
replace langfam = "Indo-European|Germanic" if language_harmonized=="English (US)"
replace langfam = "Indo-European|Italic" if language_harmonized=="French"
replace langfam = "Indo-European|Italic" if language_harmonized=="French (CAN)"
replace langfam = "Indo-European|Germanic" if language_harmonized=="German"
replace langfam = "Indo-European|Germanic" if language_harmonized=="German (Swiss)"
replace langfam = "Uralic" if language_harmonized=="Hungarian"
replace langfam = "Indo-European|Italic" if language_harmonized=="Italian"
replace langfam = "Japonic" if language_harmonized=="Japanese"
replace langfam = "Koreanic" if language_harmonized=="Korean"
replace langfam = "Sino-Tibetan" if language_harmonized=="Mandarin"
replace langfam = "Indo-European|Germanic" if language_harmonized=="Norwegian"
replace langfam = "Indo-European|Italic" if language_harmonized=="Spanish (MEX)"
replace langfam = "Turkic" if language_harmonized=="Turkish"

** summary langfam
ta langfam // all language family Ns
ta langfam if strpos(language_harm,"Engli")==0

** possible comparisons
gen langfam_compare = "not Indo-European (5 families)"
replace langfam_compare = langfam if langfam=="Indo-European|Germanic"
replace langfam_compare = langfam if langfam=="Indo-European|Italic"
replace langfam_compare = "English speakers" if strpos(language_harm,"Engli")>0
ta langfam_compare
