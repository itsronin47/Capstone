use "/Users/ronin/Desktop/full_contact (1).dta", clear

drop if sampled == 0

*instructions from Jacobus on setting up pweights
logit surveyed i.female i.location
predict phat, pr
gen ipw = 1 / phat



*Using the weights
svyset [pw=ipw]
*Who funds nearest MHC?
svy: tab mch_funder

*clinic scenario
svy: tab hc_pref

*school scenario
svy: tab school_pref

*Pay for insurance
svy: tab willing_insurance10

svy: tab trust_dist
svy: tab trust_fms
svy: tab trust_fgs

gen trust_d_bi = (trust_dist !=3)
gen trust_fms_bi = (trust_fms != 3)
gen trust_fgs_bi = (trust_fgs != 3)
*Can't use weights on McNemar Test
mcc trust_d_bi trust_fms_bi [fw=ipw]

*Paying taxes
svy: tab tax_willing
svy: tab tax_willing gender
svy: mean tax_willing, over(gender)
test _b[c.tax_willing@0bn.gender] = _b[c.tax_willing@1.gender]
*Still significant. So far no major changes from weighting

*clan tax
svy: tab clan_tax 
svy: tab clan_tax gender

svy: mean age, over(clan_tax)
test _b[c.age@0bn.clan_tax] = _b[c.age@1.clan_tax]

destring income_mid, replace
svy: mean income_mid, over(clan_tax)
test _b[c.income_mid@0bn.clan_tax] = _b[c.income_mid@1.clan_tax]
*ok this is the first actual difference. No longer sig at 10% and by a wider margin

svy: tab clan_tax_allmen
svy: tab clan_tax_female

*clan tax frequencies
svy: tab clan_tax_freq
svy: tab clan_tax_freq gender

*liklihood of receiving support
svy: tab csupp_likely


/*

*dummy variable for those who prefer a dc clinic
gen dc_hc =.
replace dc_hc = 1 if hc_pref == 2
replace dc_hc = 0 if hc_pref == 1




svy: logit dc_hc female 
logit female dc_hc [pw=ipw]

logit female dc_hc



*Significant tests
*T-testing mean ages by district
ttest age_hhrec if location == 1, by(survey)
ttest age_hhrec if location == 2, by(survey)
ttest age_hhrec if location == 3, by(survey)
ttest age_hhrec if location == 4, by(survey)
ttest age_hhrec, by(survey)

*Chi Testing district breakdown
tabi 223 187 220 252 \ 581 744 619 445

*Testing Gender Ratio
tab female survey if location == 1, chi2
tab female survey if location == 2, chi2
tab female survey if location == 3, chi2
tab female survey if location == 4, chi2
