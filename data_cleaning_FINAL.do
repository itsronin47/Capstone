clear
use "/Users/ronin/Desktop/Capstone/cati_final_gu (1).dta"
*change above line to fit your computer ^

*What could be dropped?
*enumerator, any _rand variable

drop enum_name consent mch_funder_rand hc_pref_rand school_pref_rand trust_dist_rand trust_fms_rand trust_fgs_rand tax_willing_rand clan_tax_female_rand csupp_subclan_rand csupp_connection_rand csupp_need_rand csupp_severity_rand csupp_fundsavail_rand csupp_age_rand csupp_gender_rand csupp_likely_rand trust_dc_rand trust_hir_rand trust_gal_rand trust_punt_rand trust_sws_rand trust_fgspres_rand trust_imam_rand trust_aqil_rand

save "/Users/ronin/Desktop/Capstone/clean_cati_final_gu.dta", replace
