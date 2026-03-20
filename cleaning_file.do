clear
use "/Users/ronin/Desktop/Capstone/original_data.dta"
*change above line to fit your computer ^

*What could be dropped?
*enumerator, any _rand variable

drop enum_name consent mch_funder_rand hc_pref_rand school_pref_rand trust_dist_rand trust_fms_rand trust_fgs_rand tax_willing_rand clan_tax_female_rand csupp_subclan_rand csupp_connection_rand csupp_need_rand csupp_severity_rand csupp_fundsavail_rand csupp_age_rand csupp_gender_rand csupp_likely_rand trust_dc_rand trust_hir_rand trust_gal_rand trust_punt_rand trust_sws_rand trust_fgspres_rand trust_imam_rand trust_aqil_rand

save "/Users/ronin/Desktop/Capstone/clean_data.dta", replace


tab mch_funder hc_pref
tab hc_pref
tab school_pref
tab willing_insurance10


tab trust_dist
tab trust_fms
tab trust_fgs


gen rem_rec = 1 if amount_rem > 0 


tab tax_willing


tab clan_tax
tab clan_tax_allmen
tab clan_tax_female
