insheet using "Vaccine Confidence Project Survey Data Phase 2.csv"
rename v1 StartDate
rename v2 EndDate
rename v3 Status
rename v4 RecordDate
rename v5 Q1_Ethnicity
replace v6 = "" in 1
drop v6
rename v7 Q2_Residence
rename v8 Q3_Edu_level
rename v9 Q3_Edu
drop Q3_Edu
rename v10 Q4_Age_group
rename v11 Q5_gender
rename v12 Q6_Vaccine_status
rename v13 Booster_Status
rename Booster_Status Q7_Booster_Status
rename v14 Q8_v_perception
rename Q8_v_perception Q8_vir_severe
rename v15 Q9_vir_worry
rename v16 Q10_vir_safe
rename v17 Q11_b_safe
rename v18 Q12_b_effect
rename v19 Q13_b_variant
rename v20 Q14_b_
rename Q14_b_ Q14_b_not_effect
rename v21 Q15_b_benefit
drop v22
rename v23 Q16_Information
drop in 1
drop in 2
drop Status
drop RecordDate
drop EndDate
drop StartDate

*Data in stata can either be classified as numeric or string 
*labeling variables 
label variable Q1_Ethnicity "Q1_Ethnicity
label variable Q2_Residence "Q2_Residence"
label variable Q3_Edu_level "Q3_Edu_level"
label variable Q4_Age_group "Q4_Age_group"
label variable Q5_gender "Q5_gender"
label variable Q6_Vaccine_status "Q6_Vaccine_status"
label variable Q7_Booster_Status "Q7_Booster_Status"
label variable Q8_vir_severe "Q8_vir_severe"
label variable Q9_vir_worry "Q9_vir_worry"
label variable Q10_vir_safe "Q10_vir_safe"
label variable Q11_b_safe "Q11_b_safe"
label variable Q12_b_effect "Q12_b_effect"
label variable Q13_b_variant "Q13_b_variant"
label variable Q14_b_not_effect "Q14_b_not_effect"
label variable Q16_Information "Q16_Information"

*creating new varaibles 
generate eth=.
gen info=.

*Splitting into categories
replace eth=0 if Q1_Ethnicity== "Not South Asian"
replace eth=1 if Q1_Ethnicity== "Afghanistan"
replace eth=1 if Q1_Ethnicity== "Bangladesh"
replace eth=1 if Q1_Ethnicity== "Bhutan"
replace eth=1 if Q1_Ethnicity== "India"
replace eth=1 if Q1_Ethnicity== "Nepal"
replace eth=1 if Q1_Ethnicity== "Pakistan"
replace eth=1 if Q1_Ethnicity== "Sri Lanka"
replace eth=1 if Q1_Ethnicity== "the Maldives"
replace eth=0 if Q1_Ethnicity== "Other"

*information-  news, social media,internet sources,  govt health sources,  fam $friends, multiple, unclassified
replace info=0 if Q16_Information== "news" 
replace info=0 if Q16_Information=="Non biased media like AP/Reuters"
replace info=0 if Q16_Information=="journalism"
replace info=0 if Q16_Information== "News" 
replace info=0 if Q16_Information== "The news report" 
replace info=0 if Q16_Information== "news media" 
replace info=0 if Q16_Information== "the bad news" 
replace info=0 if Q16_Information=="The bad news"
replace info=0 if Q16_Information=="The News media"
replace info=0 if Q16_Information== "The news report"
replace info=0 if Q16_Information== "The TV news"
replace info=0 if Q16_Information== "From media"
replace info=1 if Q16_Information== "Twitter" 
replace info=1 if Q16_Information=="On social networks" 
replace info=1 if Q16_Information=="Facebook"
replace info=1 if Q16_Information== "facebook" 
replace info=1 if Q16_Information=="twitter" 
replace info=1 if Q16_Information=="Social Media" 
replace info=1 if Q16_Information=="tiktok" 
replace info=1 if Q16_Information=="titok"
replace info=1 if Q16_Information=="From social media" 
replace info=1 if Q16_Information=="FASBOOK" 
replace info=1 if Q16_Information=="network media"
replace info=1 if Q16_Information=="Online rumors"
replace info=2 if Q16_Information== "Learn from the internet"
replace info=2 if Q16_Information== "I saw it on the internet."
replace info=2 if Q16_Information== "Google"
replace info=2 if Q16_Information== "On the website"
replace info=3 if Q16_Information== "Institute of Health"
replace info=4 if Q16_Information== "I got it from a friend" 
replace info=5 if Q16_Information== "My father and the internet" 
replace info=5 if Q16_Information=="From my family as well as social media/news" 
replace info=5 if Q16_Information=="Social media and friends and family"
replace info=5 if Q16_Information== "Google, friends"
replace info=5 if Q16_Information== "Friends, family, tv social media and news"
replace info=5 if Q16_Information=="Online/Social Media"
replace info=5 if Q16_Information== "Friends, family and online"
replace info=6 if Q16_Information== "Clinic"
replace info=6 if Q16_Information=="fhsoa" 
replace info=6 if Q16_Information=="Fort Lauderdale"
replace info=6 if Q16_Information== "新闻报到"
replace info=6 if Q16_Information== "sdfsdf"
replace info=6 if Q16_Information== "Job"
replace info=6 if Q16_Information== "N/A"
replace info=6 if Q16_Information== "no"
replace info=6 if Q16_Information== "11"
replace info=6 if Q16_Information== "HEB"


*inclusion criteria- drop non-inclusive 
drop if eth==0
drop if Q2_Residence== "No" 

*missing values
replace Q1_Ethnicity= "." if missing(Q1_Ethnicity)
replace Q2_Residence= "." if missing(Q2_Residence)
replace Q3_Edu_level= "." if missing(Q3_Edu_level)
replace Q4_Age_group= "." if missing(Q4_Age_group)
replace Q5_gender= "." if missing(Q5_gender)
replace Q6_Vaccine_status= "." if missing(Q6_Vaccine_status)
replace Q7_Booster_Status = "." if missing(Q7_Booster_Status)
replace Q8_vir_severe = "." if missing(Q8_vir_severe)
replace Q9_vir_worry = "." if missing(Q9_vir_worry)
replace Q10_vir_safe = "." if missing(Q10_vir_safe)
replace Q11_b_safe = "." if missing(Q11_b_safe)
replace Q12_b_effect = "." if missing(Q12_b_effect)
replace Q13_b_variant = "." if missing(Q13_b_variant)
replace Q14_b_not_effect = "." if missing(Q14_b_not_effect)
replace Q16_Information = "." if missing(Q16_Information)

*drop missing obs 
drop if Q5_gender== "."
drop if Q6_Vaccine_status== "."
drop if Q7_Booster_Status== "."
drop if Q8_vir_severe== "."
drop if Q9_vir_worry== "."
drop if Q10_vir_safe== "."
drop if Q11_b_safe== "."
drop if Q12_b_effect == "."
drop if Q13_b_variant == "."
drop if Q14_b_not_effect == "."
drop if Q3_Edu_level== "."
drop if Q2_Residence== "."
drop if Q4_Age_group== "."
drop if eth== .
drop if Q16_Information== "."

*fix long texts 
replace Q6_Vaccine_status= "2_Pfizer" if Q6_Vaccine_status== "2 shots of Pfizer"
replace Q6_Vaccine_status= "2_Moderna" if Q6_Vaccine_status== "2 shots of Moderna"
replace Q8_vir_severe= "stro_agree" if Q8_vir_severe== "Strongly agree"
replace Q8_vir_severe= "som_agree" if Q8_vir_severe== "Somewhat agree"
replace Q8_vir_severe= "stro_dis" if Q8_vir_severe== "Strongly disagree"
replace Q8_vir_severe= "som_dis" if Q8_vir_severe== "Somewhat disagree"
replace Q9_vir_worry= "stro_agree" if Q9_vir_worry== "Strongly agree"
replace Q9_vir_worry= "som_agree" if Q9_vir_worry== "Somewhat agree"
replace Q9_vir_worry= "stro_dis" if Q9_vir_worry== "Strongly disagree"
replace Q9_vir_worry= "som_dis" if Q9_vir_worry== "Somewhat disagree"
replace Q10_vir_safe= "stro_agree" if Q10_vir_safe== "Strongly agree"
replace Q10_vir_safe= "som_agree" if Q10_vir_safe== "Somewhat agree"
replace Q10_vir_safe= "stro_dis" if Q10_vir_safe== "Strongly disagree"
replace Q10_vir_safe= "som_dis" if Q10_vir_safe== "Somewhat disagree"
replace Q11_b_safe= "stro_agree" if Q11_b_safe== "Strongly agree"
replace Q11_b_safe= "som_agree" if Q11_b_safe== "Somewhat agree"
replace Q11_b_safe= "stro_dis" if Q11_b_safe== "Strongly disagree"
replace Q11_b_safe= "som_dis" if Q11_b_safe== "Somewhat disagree"
replace Q12_b_effect= "stro_agree" if Q12_b_effect== "Strongly agree"
replace Q12_b_effect= "som_agree" if Q12_b_effect== "Somewhat agree"
replace Q12_b_effect= "stro_dis" if Q12_b_effect== "Strongly disagree"
replace Q12_b_effect= "som_dis" if Q12_b_effect== "Somewhat disagree"
replace Q13_b_variant= "stro_agree" if Q13_b_variant== "Strongly agree"
replace Q13_b_variant= "som_agree" if Q13_b_variant== "Somewhat agree"
replace Q13_b_variant= "stro_dis" if Q13_b_variant== "Strongly disagree"
replace Q13_b_variant= "som_dis" if Q13_b_variant== "Somewhat disagree"
replace Q14_b_not_effect= "stro_agree" if Q14_b_not_effect== "Strongly Agree"
replace Q14_b_not_effect= "som_agree" if Q14_b_not_effect== "Somewhat agree"
replace Q14_b_not_effect= "stro_dis" if Q14_b_not_effect== "Strongly disagree"
replace Q14_b_not_effect= "som_dis" if Q14_b_not_effect== "Somewhat disagree"
 

*Grouping virus perc & vaccine perc 
gen v_sev= .
gen v_wor=.
gen v_saf=.
gen v_perc= .
gen b_saf=.
gen b_eff=.
gen b_var=.
gen n_eff=.
gen b_perc= .

replace v_sev= -2 if Q8_vir_severe== "stro_dis"
replace v_sev= -1 if Q8_vir_severe== "som_dis"
replace v_sev= 0 if Q8_vir_severe==  "Neither agree nor disagree"
replace v_sev= 1 if Q8_vir_severe== "som_agree"
replace v_sev= 2 if Q8_vir_severe== "stro_agree"
replace v_wor= -2 if Q9_vir_worry== "stro_dis"
replace v_wor= -1 if Q9_vir_worry== "som_dis"
replace v_wor= 0 if Q9_vir_worry==  "Neither agree nor disagree"
replace v_wor= 1 if Q9_vir_worry== "som_agree"
replace v_wor= 2 if Q9_vir_worry== "stro_agree"
replace v_saf= -2 if Q10_vir_safe== "stro_dis"
replace v_saf=-1 if Q10_vir_safe== "som_dis"
replace v_saf= 0 if Q10_vir_safe==  "Neither agree nor disagree"
replace v_saf= 1 if Q10_vir_safe== "som_agree"
replace v_saf= 2 if Q10_vir_safe== "stro_agree"
replace b_saf= -2 if Q11_b_safe== "stro_dis"
replace b_saf= -1 if Q11_b_safe== "som_dis"
replace b_saf= 0 if Q11_b_safe==  "Neither agree nor disagree"
replace b_saf= 1 if Q11_b_safe== "som_agree"
replace b_saf= 2 if Q11_b_safe== "stro_agree"
replace b_eff= -2 if Q12_b_effect== "stro_dis"
replace b_eff= -1 if Q12_b_effect== "som_dis"
replace b_eff= 0 if Q12_b_effect==  "Neither agree nor disagree"
replace b_eff= 1 if Q12_b_effect== "som_agree"
replace b_eff= 2 if Q12_b_effect== "stro_agree"
replace b_var= -2 if Q13_b_variant== "stro_dis"
replace b_var= -1 if Q13_b_variant== "som_dis"
replace b_var= 0 if Q13_b_variant==  "Neither agree nor disagree" 
replace b_var = 1 if Q13_b_variant== "som_agree"
replace b_var= 2 if Q13_b_variant== "stro_agree"
replace n_eff= -2 if Q14_b_not_effect== "stro_dis"
replace n_eff= -1 if Q14_b_not_effect== "som_dis"
replace n_eff= 0 if Q14_b_not_effect==  "Neither agree nor disagree" 
replace n_eff= 1 if Q14_b_not_effect== "som_agree"
replace n_eff= 2 if Q14_b_not_effect== "stro_agree"

*summing v_perc & b_perc 
replace v_perc= v_sev + v_wor + v_saf
replace b_perc= b_saf + b_eff + b_var + n_eff

*For virus_perc >0 means scared/concerned of the virus- so a +ve response 
*We created a label define called v_perc to label 1 as concern, 2 as not concern etc. label define can work with any variable 
replace v_perc= 1 if v_perc >0
replace v_perc= 2 if v_perc <0
label define v_perc 1 "concern" 2 "n_concern" 0 "neutral", modify 
label values v_perc v_perc

replace b_perc=1 if b_perc >0
replace b_perc=2 if b_perc <0
label define b_perc 1 "confident" 2 "n_confident" 0 "neutral", modify
label values b_perc b_perc
*we left 0 the same ie neutral. 1 means concerned about virus, 2 means not concerned 
 
 *news, social media,internet sources,  govt health sources,  fam $friends, multiple, unclassified
label define info 0 "news" 1 "social media" 2 "internet" 3 "govt health" 4 "fam" 5 "multiple" 6 "unclassified"
label values info info 

label define v_sev -2 "stro_dis" -1 "som_dis" 0 "neither" 1 "som_agree" 2 "stro_agree"
label values v_sev v_sev
label values v_saf v_sev
label values v_wor v_sev
label values b_saf v_sev 
label values b_eff v_sev
label values b_var v_sev
label values n_eff v_sev
***

gen gender=. 
replace gender= 1 if Q5_gender== "Male" 
replace gender= 2 if Q5_gender== "Female"
replace gender= 3 if Q5_gender== "Non-binary / third gender"
label define gender 1 "Male" 2 "Female" 3 "Non-binary/third gender"
label values gender gender 

gen vac_stat= .
replace vac_stat= 1 if Q6_Vaccine_status=="2_Pfizer"
replace vac_stat= 2 if Q6_Vaccine_status== "2_Moderna"
replace vac_stat= 3 if Q6_Vaccine_status== "1 shot J&J"
label define vac_stat 1 "2_Pfizer" 2 "2_Moderna" 3 "1 shot J&J"
label values vac_stat vac_stat

gen b_stat= .
replace b_stat= 1 if Q7_Booster_Status== "Yes"
replace b_stat= 2 if Q7_Booster_Status== "No"
label define b_stat 1 "Yes" 2 "No"
label values b_stat b_stat

gen edu=.
replace edu= 1 if Q3_Edu_level== "Some High School"
replace edu= 2 if Q3_Edu_level== "High School diploma/ GED"
replace edu= 3 if Q3_Edu_level== "Associate's degree"
replace edu= 4 if Q3_Edu_level== "Bachelor's degree"
replace edu= 5 if Q3_Edu_level== "Graduate degree (masters or PhD)"
label define edu 1 "Some_HS" 2 "HS_diplo" 3 "Assoc" 4 "Bach" 5 "Grad"
label values edu edu

gen age=.
replace age= 1 if Q4_Age_group== "18-30"
replace age= 2 if Q4_Age_group== "31-50"
replace age= 3 if Q4_Age_group== "51-70"
label define age 1 "18-30" 2 "31-50" 3 "51-70"
label values age age 

*CHi square tests 
*When ALL expected cell counts are greater than or equal to 5, the chi square 
* test is appropriate. Add the option "chi" to the tab or tabi commands.
** When at least one one of the expected cell counts is less than 5, the fisher 
* exact test is appropriate. Add the option "exact" to the tab or tabi commands.

*-exposures: gender, age group, education level 
*Outcomes; vaccine status, booster status, virus perception, booster/virus perception, information source 

*Gender
tab Q5_gender Q6_Vaccine_status, expected chi exact
tab Q5_gender Q7_Booster_Status, expected chi exact
tab Q5_gender info, expected chi exact 
tab Q5_gender v_perc, expected chi exact 
tab Q5_gender b_perc, expected chi exact 
*Edu level
tab Q3_Edu_level Q6_Vaccine_status, expected chi exact
tab Q3_Edu_level Q7_Booster_Status, expected chi exact
tab Q3_Edu_level info, expected chi exact 
tab Q3_Edu_level v_perc, expected chi exact 
tab Q3_Edu_level b_perc, expected chi exact
*Age group 
tab Q4_Age_group Q6_Vaccine_status, expected chi exact
tab Q4_Age_group Q7_Booster_Status, expected chi exact
tab Q4_Age_group info, expected chi exact 
tab Q4_Age_group v_perc, expected chi exact 
tab Q4_Age_group b_perc, expected chi exact 

*Info source [Info source is an outcome but you can still run this to see how it compares ]
*tab info Q6_Vaccine_status, expected chi exact
*tab info Q7_Booster_Status, expected chi exact
*tab info v_perc, expected chi exact 
*tab info b_perc, expected chi exact

*logistic reg
*Vaccine status 

mlogit vac_stat i.gender, rrr
mlogit vac_stat i.age, rrr 
mlogit vac_stat i.edu, rrr

mlogit vac_stat i.gender i.age i.edu, rrr

*Booster status 
mlogit b_stat i.gender, rrr
mlogit b_stat i.age, rrr 
mlogit b_stat i.edu, rrr

mlogit b_stat i.gender i.age i.edu, rrr

*Virus perception
logistic v_perc i.gender
 *SHows odds ratio
mlogit v_perc i.gender 
*Exactly, but doesent show odds ratio 
mlogit v_perc i.gender, rrr
mlogit v_perc i.age, rrr
mlogit v_perc i.edu, rrr

mlogit v_perc i.gender i.age i.edu, rrr

*Vaccine/booster perception
mlogit b_perc i.gender, rrr
mlogit b_perc i.age, rrr 
mlogit b_perc i.edu, rrr

mlogit b_perc i.gender i.age i.edu, rrr

*Information source 
mlogit info i.gender
mlogit info i.age 
mlogit info i.edu

mlogit info i.gender i.age i.edu, rrr
