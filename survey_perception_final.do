*replacing missing values
replace Q1_Ethnicity= "." if missing(Q1_Ethnicity)
replace Q2_Residence= "." if missing(Q2_Residence)
replace Q3_Edu= "." if missing(Q3_Edu)
replace Q4_Age= "." if missing(Q4_Age)
replace Q5_Gender= "." if missing(Q5_Gender)
replace Q6_Vac_stat= "." if missing(Q6_Vac_stat)
replace Q7_B_stat = "." if missing(Q7_B_stat)
replace Q8_vir_perc = "." if missing(Q8_vir_perc)
replace Q9_vir_perc = "." if missing(Q9_vir_perc)
replace Q10_vir_perc = "." if missing(Q10_vir_perc)
replace Q11_b_perc = "." if missing(Q11_b_perc)
replace Q12_b_perc = "." if missing(Q12_b_perc)
replace Q13_b_perc = "." if missing(Q13_b_perc)
replace Q14_b_perc= "." if missing(Q14_b_perc)
replace Q16_Information = "." if missing(Q16_Information)

*drop missing observations 
drop if Q5_Gender== "."
drop if Q6_Vac_stat== "."
drop if Q7_B_stat== "."
drop if Q8_vir_perc == "."
drop if Q9_vir_perc== "."
drop if Q10_vir_perc== "."
drop if Q11_b_perc== "."
drop if Q12_b_perc == "."
drop if Q13_b_perc == "."
drop if Q14_b_perc == "."
drop if Q3_Edu== "."
drop if Q2_Residence== "."
drop if Q4_Age== "."
drop if Q1_Ethnicity== "."
drop if Q16_Information== "."

*fix long texts 
replace Q6_Vac_stat= "2_Pfizer" if Q6_Vac_stat== "2 shots of Pfizer"
replace Q6_Vac_stat= "2_Moderna" if Q6_Vac_stat== "2 shots of Moderna"
replace Q8_vir_perc= "stro_agree" if Q8_vir_perc== "Strongly agree"
replace Q8_vir_perc= "som_agree" if Q8_vir_perc== "Somewhat agree"
replace Q8_vir_perc= "stro_dis" if Q8_vir_perc== "Strongly disagree"
replace Q8_vir_perc= "som_dis" if Q8_vir_perc== "Somewhat disagree"
replace Q9_vir_perc= "stro_agree" if Q9_vir_perc== "Strongly agree"
replace Q9_vir_perc= "som_agree" if Q9_vir_perc== "Somewhat agree"
replace Q9_vir_perc= "stro_dis" if Q9_vir_perc== "Strongly disagree"
replace Q9_vir_perc= "som_dis" if Q9_vir_perc== "Somewhat disagree"
replace Q10_vir_perc= "stro_agree" if Q10_vir_perc== "Strongly agree"
replace Q10_vir_perc= "som_agree" if Q10_vir_perc== "Somewhat agree"
replace Q10_vir_perc= "stro_dis" if Q10_vir_perc== "Strongly disagree"
replace Q10_vir_perc= "som_dis" if Q10_vir_perc== "Somewhat disagree"
replace Q11_b_perc= "stro_agree" if Q11_b_perc== "Strongly agree"
replace Q11_b_perc= "som_agree" if Q11_b_perc== "Somewhat agree"
replace Q11_b_perc= "stro_dis" if Q11_b_perc== "Strongly disagree"
replace Q11_b_perc= "som_dis" if Q11_b_perc== "Somewhat disagree"
replace Q12_b_perc= "stro_agree" if Q12_b_perc== "Strongly agree"
replace Q12_b_perc= "som_agree" if Q12_b_perc== "Somewhat agree"
replace Q12_b_perc= "stro_dis" if Q12_b_perc== "Strongly disagree"
replace Q12_b_perc= "som_dis" if Q12_b_perc== "Somewhat disagree"
replace Q13_b_perc= "stro_agree" if Q13_b_perc== "Strongly agree"
replace Q13_b_perc= "som_agree" if Q13_b_perc== "Somewhat agree"
replace Q13_b_perc= "stro_dis" if Q13_b_perc== "Strongly disagree"
replace Q13_b_perc= "som_dis" if Q13_b_perc== "Somewhat disagree"
replace Q14_b_perc= "stro_agree" if Q14_b_perc== "Strongly Agree"
replace Q14_b_perc= "som_agree" if Q14_b_perc== "Somewhat agree"
replace Q14_b_perc= "stro_dis" if Q14_b_perc== "Strongly disagree"
replace Q14_b_perc= "som_dis" if Q14_b_perc== "Somewhat disagree"

*generating new variables to replace Q8 to Q14..etc so that it is clear that they are different questions 
*Next, I generate a variable called v_perc (Virus perception) that will be the combined sum of v_sev, v_wor and v_saf
*Also generating a variable called b_perc (Booster perception) that will be the combined sum of b_saf, b_eff, n_eff and b_var
gen v_sev= .
gen v_wor=.
gen v_saf=.
gen v_perc= .
gen b_saf=.
gen b_eff=.
gen b_var=.
gen n_eff=.
gen b_perc= .

*Converting Likert scale responses for v_sev, v_wor, v-saf, b_saf, b_eff, b_var and n_eff from string to numeric datatypes (where Strongly disagree= -2 and strongly agree=2)
replace v_sev= -2 if Q8_vir_perc== "stro_dis"
replace v_sev= -1 if Q8_vir_perc== "som_dis"
replace v_sev= 0 if Q8_vir_perc==  "Neither agree nor disagree"
replace v_sev= 1 if Q8_vir_perc== "som_agree"
replace v_sev= 2 if Q8_vir_perc== "stro_agree"
replace v_wor= -2 if Q9_vir_perc== "stro_dis"
replace v_wor= -1 if Q9_vir_perc== "som_dis"
replace v_wor= 0 if Q9_vir_perc==  "Neither agree nor disagree"
replace v_wor= 1 if Q9_vir_perc== "som_agree"
replace v_wor= 2 if Q9_vir_perc== "stro_agree"
replace v_saf= -2 if Q10_vir_perc== "stro_dis"
replace v_saf=-1 if Q10_vir_perc== "som_dis"
replace v_saf= 0 if Q10_vir_perc==  "Neither agree nor disagree"
replace v_saf= 1 if Q10_vir_perc== "som_agree"
replace v_saf= 2 if Q10_vir_perc== "stro_agree"
replace b_saf= -2 if Q11_b_perc== "stro_dis"
replace b_saf= -1 if Q11_b_perc== "som_dis"
replace b_saf= 0 if Q11_b_perc==  "Neither agree nor disagree"
replace b_saf= 1 if Q11_b_perc== "som_agree"
replace b_saf= 2 if Q11_b_perc== "stro_agree"
replace b_eff= -2 if Q12_b_perc== "stro_dis"
replace b_eff= -1 if Q12_b_perc== "som_dis"
replace b_eff= 0 if Q12_b_perc==  "Neither agree nor disagree"
replace b_eff= 1 if Q12_b_perc== "som_agree"
replace b_eff= 2 if Q12_b_perc== "stro_agree"
replace b_var= -2 if Q13_b_perc== "stro_dis"
replace b_var= -1 if Q13_b_perc== "som_dis"
replace b_var= 0 if Q13_b_perc==  "Neither agree nor disagree" 
replace b_var = 1 if Q13_b_perc== "som_agree"
replace b_var= 2 if Q13_b_perc== "stro_agree"
replace n_eff= -2 if Q14_b_perc== "stro_dis"
replace n_eff= -1 if Q14_b_perc== "som_dis"
replace n_eff= 0 if Q14_b_perc==  "Neither agree nor disagree" 
replace n_eff= 1 if Q14_b_perc== "som_agree"
replace n_eff= 2 if Q14_b_perc== "stro_agree"

*Creating v_perc & b_perc from sum of existing variables  
replace v_perc= v_sev + v_wor + v_saf
replace b_perc= b_saf + b_eff + b_var + n_eff

*Creating new replica variables from existing ones and Label defining categorical variables
gen info=.
replace info= 0 if Q16_Information== "news"
replace info= 1 if Q16_Information== "social media"
replace info= 2 if Q16_Information== "internet"
replace info= 3 if Q16_Information== "govt health"
replace info= 4 if Q16_Information== "fam"
replace info = 5 if Q16_Information== "multiple"
replace info = 6 if Q16_Information== "unclassified"
label define info 0 "news" 1 "social media" 2 "internet" 3 "govt health" 4 "fam" 5 "multiple" 6 "unclassified"
label values info info 

gen gender=. 
replace gender= 1 if Q5_Gender== "Male" 
replace gender= 2 if Q5_Gender== "Female"
replace gender= 3 if Q5_Gender== "Non-binary / third gender"
label define gender 1 "Male" 2 "Female" 3 "Non-binary/third gender"
label values gender gender 

gen vac_stat= .
replace vac_stat= 1 if Q6_Vac_stat=="2_Pfizer"
replace vac_stat= 2 if Q6_Vac_stat== "2_Moderna"
replace vac_stat= 3 if Q6_Vac_stat== "1 shot J&J"
label define vac_stat 1 "2_Pfizer" 2 "2_Moderna" 3 "1 shot J&J"
label values vac_stat vac_stat

gen b_stat= .
replace b_stat= 1 if Q7_B_stat== "Yes"
replace b_stat= 2 if Q7_B_stat== "No"
label define b_stat 1 "Yes" 2 "No"
label values b_stat b_stat

gen edu=.
replace edu= 1 if Q3_Edu== "Some High School"
replace edu= 2 if Q3_Edu== "High School diploma/ GED"
replace edu= 3 if Q3_Edu== "Associate's degree"
replace edu= 4 if Q3_Edu== "Bachelor's degree"
replace edu= 5 if Q3_Edu== "Graduate degree (masters or PhD)"
label define edu 1 "Some_HS" 2 "HS_diploma" 3 "Associates" 4 "Bachelors" 5 "Graduate", modify
label values edu edu

gen age=.
replace age= 1 if Q4_Age== "18-30"
replace age= 2 if Q4_Age== "31-50"
replace age= 3 if Q4_Age== "51-70"
label define age 1 "18-30" 2 "31-50" 3 "51-70"
label values age age 


*Using ANOVA test to compare differences in v_perc, b_perc, vac_stat, b_stat and info responses by gender, age and edu
oneway v_perc Q5_Gender
oneway v_perc gender
oneway v_perc age 
oneway v_perc edu

oneway b_perc Q5_Gender 
oneway b_perc age
oneway b_perc edu

oneway vac_stat gender 
oneway vac_stat age 
oneway vac_stat edu

oneway b_stat gender 
oneway b_stat age
oneway b_stat edu

oneway info gender 
oneway info age 
oneway info edu 

***b_stat and gender= pvalue= 0.045= borderline significance
***info and age=0.048= borderline significnace 
***info and gender= 0.0502 not significant 
***NO strong statistical significance in ANOVA tests!!

*Logistic regression?: CAN'T do this!!! 

 *Data Visualization procedure: 
 
*Demographic statistics (bar graphs):
graph bar (count), over(gender) title(Gender)
graph bar (count), over(age) title(Agegroup)
graph bar (count), over(edu) title(Education level)

*Bar Graphs showing v_perc responses by gendr, age, and edu
graph hbar v_perc, over (gender)
graph hbar v_perc, over (age)
graph hbar v_perc, over (edu)

*Bar Graphs showing b_perc responses by gender, age, and edu
graph hbar b_perc, over (gender)
graph hbar b_perc, over (age)
graph hbar b_perc, over (edu)

*Box plots showing v_perc responses by gendr, age, and edu
graph hbox v_perc, over(age) ytitle(Increasing concern about virus) title(Virus perception by age)
graph hbox v_perc, over(edu) ytitle(Increasing concern about virus) title(Virus perception by edu level)
graph hbox v_perc, over(gender) ytitle(Increasing concern about virus) title(Virus perception by gender)

*Box plots showing b_perc responses by gendr, age, and edu
graph hbox b_perc, over(age) ytitle(Increasing confidence in booster) title(Booster perception by age)
graph hbox b_perc, over(edu) ytitle(Increasing confidence in booster) title(Booster perception by edu level)
graph hbox b_perc, over(gender) ytitle(Increasing confidence in booster) title(Booster perception by gender)

*Categorical vs Categorical 
*Bar Graphs showing vac_stat responses by gender, age, and edu
graph hbar, over(vac_stat) by(, title(Vaccination status by gender)) by(gender)
graph hbar, over(vac_stat) by(, title(Vaccination status by age)) by(age)
graph hbar, over(vac_stat) by(, title(Vaccination status by education level)) by(edu)

*Bar Graphs showing b_stat responses by gender, age, and edu
graph hbar, over(b_stat) by(, title(Booster status by gender)) by(gender)
graph hbar, over(b_stat) by(, title(Booster status by age)) by(age)
graph hbar, over(b_stat) by(, title(Booster status by education level)) by(edu)

*Bar Graphs showing info responses by gender, age, and edu
graph hbar, over(info) by(, title(Covid information source by gender)) by(gender)
graph hbar, over(info) by(, title(Covid information source by age)) by(age)
graph hbar, over(info) by(, title(Covid information source by education level)) by(edu)
