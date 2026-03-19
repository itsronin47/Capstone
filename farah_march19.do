**March 19

tab mch_funder
/*
     Please think about the closest |
   maternal and child health center |
                   (MCH) to your ho |      Freq.     Percent        Cum.
------------------------------------+-----------------------------------
The ${dist_lab} district government |         87        9.86        9.86
  The ${state_lab} state government |         97       11.00       20.86
  The Federal Government of Somalia |         32        3.63       24.49
                  An NGO or charity |         99       11.22       35.71
                      An aid agency |        345       39.12       74.83
        A private business or owner |         55        6.24       81.07
           Don't know [DO NOT READ] |        167       18.93      100.00
------------------------------------+-----------------------------------
                              Total |        882      100.00
*/  
//questions to them: ngo vs aid agency? whats the difference

tab mch_time

/*
Please think about the closest |
     health clinic or hospital, |
         including MCH centers, |      Freq.     Percent        Cum.
--------------------------------+-----------------------------------
           Less than 10 minutes |        119       13.49       13.49
      Between 10 and 20 minutes |        257       29.14       42.63
      Between 20 and 30 minutes |        192       21.77       64.40
      Between 30 and 45 minutes |         76        8.62       73.02
Between 45 minutes and one hour |        113       12.81       85.83
             More than one hour |        125       14.17      100.00
--------------------------------+-----------------------------------
                          Total |        882      100.00
*/

tab hc_pref
/*
Please imagine there is both a private |
  health clinic and a health clinic run |
                                    by  |      Freq.     Percent        Cum.
----------------------------------------+-----------------------------------
                  Private health clinic |        224       25.40       25.40
Health clinic run by the district gover |        658       74.60      100.00
----------------------------------------+-----------------------------------
                                  Total |        882      100.00
*/

tab school_pref
//

tab willing_insurance10
//72% willing


tab willing_insurance10 gender

tab trust_dist
tab trust_fgs
tab trust_fms

tab support_rem
tab support_closefam
tab support_clan
tab support_aid

//generate a variable to trace some people who received aid to generate a profile on them
// average aid per person vs clan vs aid 

tab tax_willing

tab clan_tax
tab clan_tax_freq
tab clan_tax_allmen
tab clan_tax_female

// opportunity to break those into clans to trace clan patterns

tab csupp_subclan
tab csupp_connectio
tab csupp_age
tab csupp_need
tab csupp_severity //need vs severtity? diff?
tab csupp_gender 





