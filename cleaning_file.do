clear
use "/Users/ronin/Desktop/Capstone/original_data.dta"
*change above line to fit your computer ^

*What could be dropped?
*enumerator, any _rand variable

drop enum_name consent mch_funder_rand hc_pref_rand school_pref_rand trust_dist_rand trust_fms_rand trust_fgs_rand tax_willing_rand clan_tax_female_rand csupp_subclan_rand csupp_connection_rand csupp_need_rand csupp_severity_rand csupp_fundsavail_rand csupp_age_rand csupp_gender_rand csupp_likely_rand trust_dc_rand trust_hir_rand trust_gal_rand trust_punt_rand trust_sws_rand trust_fgspres_rand trust_imam_rand trust_aqil_rand

***AGE BRACKET CODING***
gen age_bracket =.
replace age_bracket = 1 if age < 26
replace age_bracket = 2 if age >= 26 & age < 34
replace age_bracket = 3 if age >= 34 & age < 50
replace age_bracket = 4 if age >= 50

*Variable for Local*
gen local = 1 if born_district == location
replace local = 0 if born_district != location

save "/Users/ronin/Desktop/Capstone/clean_data.dta", replace

*Preliminary investigations into individual survey responses
tab mch_funder
*biggest answer is NGO/aid agency. We can likely aggregate these. Need to confirm what the actual answer is still.
tab mch_time
*potential to aggregate above categories
tab hc_pref
tab mch_funder hc_pref if mch_funder == 4 | mch_funder == 5
tab school_pref
*there is strong preference for the district government to be the provider of social services over NGOs. The question of capacity remains.

*WHY would they think this? What experience with government do they have?
*They do not like the status quo, think that different is better?
*What has the history of government provided anything looked like?

tab willing_insurance10
tab willing_insurance5
*Few who said no at 10% still said no at 5%. The question of capacity remains.

tab trust_dist
tab trust_fms
tab trust_fgs
*while not significant, district government received the most trust, but just barely. Overall, trends in government trust do not differ across levels of gov.

tab support_rem
tab support_closefam
tab support_clan
tab support_aid

sum amount_rem amount_closefam amount_clan amount_aid

*shockingly, most people reported they do not receive support from familiy or clan relations, instead aid is the most (but not by a lot).
*Perhaps we overestimated the strength of clan financial support systems, or support is given in other non-monetary ways
*Those thay do receive funds get the biggest amounts from remmitances and close family members and aid

tab tax_willing
*80% willing to some degree to pay taxes, need to compare to previous results

tab clan_tax
tab clan_tax_allmen
tab clan_tax_female gender
*most are not asked to make clan contributions. Those that do mostly say all men do, only half say some or all women do.

tab clan_tax clan if clan == 307 | clan == 202
*amongst 2 biggest clans, results are the same

tab clan_tax gender
*men more likely to say yes than women

tab clan_tax dist_lab
*no noticable different amongst districts

tab clan_tax_freq
*those who said yes mostly contribute once a month

tab support_timing
tab csupp_likely
*yet almost everyone gave an ETA on financial support if requested...did we mess up by asking if people make **regular** contributions rather than contributions when needed? 75% said if they needed help, the clan would support!

tab trust_imam
tab trust_aqil
*trust in imam and aqil much higher than government officials (unsurprising)

*not really seeing anything significant to age in responses...


tab gender clan_tax
*why do way more men say yes that all members of a clan make regular contributions? 

*So whats the big picture? Whats the policy recommendation to the DCs?

*There is trust in and demand for district provision of services over aid/ngo agencies
*There is willingness to pay taxes in order to get such services
*There is minimal difference in levels of trust at different government levels

*Clan based financial support is not as regular, or common as we anticipated

*there is ample room for the gov to provide services that actually are not being provided on a regular basis by clan relations
*It is possible clan based support occurs only when necessary (rare) or through non-monetary channels

*There appears to be little distinction in clan behaviors based on clan, age, or district, but perhaps a distinction between gender. It is unclear why.



*Discussion on: how do you deal with the sampling that consilient did? Ask consilient for more detail on how they surveyed! 
*Explain how the demographics of our sample mirror or differ the demographics of the country overall
*do some robustness tests basically
*be skeptical!
*How many people did they try to ask?
*find existing studies on this same issue (countries with weak governments and their preferences for government services) 
*how did they define social protection systems?





***WORK ON JUST THE YES CLAN-TAX PEOPLE***

tab gender clan_tax
