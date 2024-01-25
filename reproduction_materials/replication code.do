***************************************
* Main Text
***************************************

* bonus expectations

reg s2_tokens_mean i.cond if sample==1 & study==2
mixed bonus_chance i.cond if sample==1 || study:
	estat df, method(residual)
reg s2_performance_slope i.cond if sample==1 & study==2
mixed performance_slope i.cond if sample==1 || study:
	estat df, method(residual)

* work effort meta-analysis
* see spreadsheet for mini meta-analysis calculations. These materials do not provide df. 

reg z_ln_effort z_performance_slope if sample==1 & study==2
mixed z_ln_effort z_performance_slope if sample==1 & study>=3 || study:
	estat df, method(residual)
	
* manager survey
tabstat warmth_cent comp_cent prefer_cent promote_bonus_cent hire_cent work_outcome_cent, statistics( mean sd skewness kurtosis )

sktest warmth_cent
sktest comp_cent
sktest prefer_cent
sktest promote_bonus_cent
sktest hire_cent
sktest work_outcome_cent

ttest warmth_cent == 0
ttest comp_cent == 0
ttest prefer_cent == 0
ttest promote_bonus_cent == 0
ttest hire_cent == 0

reg warmth_cent 		age_cent women_nonbin nonwhite college income_cent sses_cent i.manage_num pol_cent
reg comp_cent 			age_cent women_nonbin nonwhite college income_cent sses_cent i.manage_num pol_cent
reg prefer_cent 		age_cent women_nonbin nonwhite college income_cent sses_cent i.manage_num pol_cent
reg promote_bonus_cent 	age_cent women_nonbin nonwhite college income_cent sses_cent i.manage_num pol_cent
reg hire_cent 			age_cent women_nonbin nonwhite college income_cent sses_cent i.manage_num pol_cent

***************************************
* Supplementary Information
***************************************

* Table S2
ttest age 			if study>=4, by(sample) unequal welch
prtest woman_other 	if study>=4, by(sample)
prtest nonwhite 	if study>=4, by(sample)
prtest college 		if study>=4, by(sample)
prtest working 		if study>=4, by(sample)
prtest manage 		if study>=4, by(sample)
ttest house_income 	if study>=4, by(sample) unequal welch
ttest sses 			if study>=4, by(sample) unequal welch
ttest pol 			if study>=4, by(sample) unequal welch


* Table S3, Figure S1
reg s2_tokens_0 	i.cond if sample==1
	margins cond
reg s2_tokens_2 	i.cond if sample==1
	margins cond
reg s2_tokens_4 	i.cond if sample==1
	margins cond
reg s2_tokens_6 	i.cond if sample==1
	margins cond
reg s2_tokens_8 	i.cond if sample==1
	margins cond
reg s2_tokens_10 	i.cond if sample==1
	margins cond
reg s2_tokens_mean 	i.cond if sample==1
	margins cond

	
* Table S4, Figure S2
reg muchlower_score 	i.cond if sample==1 & study==3
	margins cond
reg lower_score 		i.cond if sample==1 & study==3
	margins cond
reg same_score 			i.cond if sample==1 & study==3
	margins cond
reg higher_score 		i.cond if sample==1 & study==3
	margins cond
reg muchhigher_score	i.cond if sample==1 & study==3
	margins cond
reg bonus_chance		i.cond if sample==1 & study==3
	margins cond

	
* Table S5, Figure S3
reg muchlower_score 	i.cond if sample==1 & study==4
	margins cond
reg lower_score 		i.cond if sample==1 & study==4
	margins cond
reg same_score 			i.cond if sample==1 & study==4
	margins cond
reg higher_score 		i.cond if sample==1 & study==4
	margins cond
reg muchhigher_score	i.cond if sample==1 & study==4
	margins cond
reg bonus_chance		i.cond if sample==1 & study==4
	margins cond

	
* Table S6, Figure S4
reg muchlower_score 	i.cond if sample==1 & study==5
	margins cond
reg lower_score 		i.cond if sample==1 & study==5
	margins cond
reg same_score 			i.cond if sample==1 & study==5
	margins cond
reg higher_score 		i.cond if sample==1 & study==5
	margins cond
reg muchhigher_score	i.cond if sample==1 & study==5
	margins cond
reg bonus_chance		i.cond if sample==1 & study==5
	margins cond

	
* Table S7, Figure S5
mixed muchlower_score	i.cond if sample==1	|| study:
	margins cond
mixed lower_score		i.cond if sample==1	|| study:
	margins cond
mixed same_score		i.cond if sample==1	|| study:
	margins cond
mixed higher_score		i.cond if sample==1	|| study:
	margins cond
mixed muchhigher_score	i.cond if sample==1	|| study:
	margins cond

	
* Table S8
* meta-analysis results taken from meta-analysis spreadsheet
reg z_effort 		i.cond if sample==1 & study==1
	pwcompare cond, mcompare(bonferroni)
	estat ic
reg z_effort 		i.cond if sample==1 & study==2
	pwcompare cond, mcompare(bonferroni)
	estat ic
reg z_effort 		i.cond if sample==1 & study==3
	pwcompare cond, mcompare(bonferroni)
	estat ic
reg z_effort 		i.cond if sample==1 & study==4
	pwcompare cond, mcompare(bonferroni)
	estat ic
reg z_effort 		i.cond if sample==1 & study==5
	pwcompare cond, mcompare(bonferroni)
	estat ic
mixed z_effort 		i.cond if sample==1 & study>=3 || study:
	pwcompare cond, mcompare(bonferroni)	
	estat ic
	
reg z_ln_effort 		i.cond if sample==1 & study==1
	pwcompare cond, mcompare(bonferroni)
	estat ic
reg z_ln_effort 		i.cond if sample==1 & study==2
	pwcompare cond, mcompare(bonferroni)
	estat ic
reg z_ln_effort 		i.cond if sample==1 & study==3
	pwcompare cond, mcompare(bonferroni)
	estat ic
reg z_ln_effort 		i.cond if sample==1 & study==4
	pwcompare cond, mcompare(bonferroni)
	estat ic
reg z_ln_effort 		i.cond if sample==1 & study==5
	pwcompare cond, mcompare(bonferroni)
	estat ic
mixed z_ln_effort 		i.cond if sample==1 & study>=3 || study:
	pwcompare cond, mcompare(bonferroni)	
	estat ic

reg z_sqrt_effort 		i.cond if sample==1 & study==1
	pwcompare cond, mcompare(bonferroni)
	estat ic
reg z_sqrt_effort 		i.cond if sample==1 & study==2
	pwcompare cond, mcompare(bonferroni)
	estat ic
reg z_sqrt_effort 		i.cond if sample==1 & study==3
	pwcompare cond, mcompare(bonferroni)
	estat ic
reg z_sqrt_effort 		i.cond if sample==1 & study==4
	pwcompare cond, mcompare(bonferroni)
	estat ic
reg z_sqrt_effort 		i.cond if sample==1 & study==5
	pwcompare cond, mcompare(bonferroni)
	estat ic
mixed z_sqrt_effort 	i.cond if sample==1 & study>=3 || study:
	pwcompare cond, mcompare(bonferroni)	
	estat ic

	
* Tables S9a and S9b
reg tokens 				i.cond if sample==1 & study==1
	pwcompare cond, mcompare(bonferroni)
reg tokens 				i.cond if sample==1 & study==2
	pwcompare cond, mcompare(bonferroni)
reg numbersearches 		i.cond if sample==1 & study==3
	pwcompare cond, mcompare(bonferroni)
reg numbersearches 		i.cond if sample==1 & study==4
	pwcompare cond, mcompare(bonferroni)
reg numbersearches 		i.cond if sample==1 & study==5
	pwcompare cond, mcompare(bonferroni)
mixed numbersearches 	i.cond if sample==1 & study>=3 || study:
	pwcompare cond, mcompare(bonferroni)	

reg ln_numbersearches 	i.cond if sample==1 & study==3
	pwcompare cond, mcompare(bonferroni)
reg ln_numbersearches 	i.cond if sample==1 & study==4
	pwcompare cond, mcompare(bonferroni)
reg ln_numbersearches 	i.cond if sample==1 & study==5
	pwcompare cond, mcompare(bonferroni)
mixed ln_numbersearches i.cond if sample==1 & study>=3 || study:
	pwcompare cond, mcompare(bonferroni)	

reg sqrt_numbersearches 	i.cond if sample==1 & study==3
	pwcompare cond, mcompare(bonferroni)
reg sqrt_numbersearches 	i.cond if sample==1 & study==4
	pwcompare cond, mcompare(bonferroni)
reg sqrt_numbersearches 	i.cond if sample==1 & study==5
	pwcompare cond, mcompare(bonferroni)
mixed sqrt_numbersearches	i.cond if sample==1 & study>=3 || study:
	pwcompare cond, mcompare(bonferroni)	
	
poisson numbersearches 		i.cond if sample==1 & study==3
	pwcompare cond, mcompare(bonferroni)
poisson numbersearches 		i.cond if sample==1 & study==4
	pwcompare cond, mcompare(bonferroni)
poisson numbersearches 		i.cond if sample==1 & study==5
	pwcompare cond, mcompare(bonferroni)
poisson numbersearches		i.cond if sample==1 & study>=3 || study:
	pwcompare cond, mcompare(bonferroni)	
	
nbreg numbersearches 		i.cond if sample==1 & study==3
	pwcompare cond, mcompare(bonferroni)
nbreg numbersearches 		i.cond if sample==1 & study==4
	pwcompare cond, mcompare(bonferroni)
nbreg numbersearches 		i.cond if sample==1 & study==5
	pwcompare cond, mcompare(bonferroni)
nbreg numbersearches		i.cond if sample==1 & study>=3 || study:
	pwcompare cond, mcompare(bonferroni)	
	
	
* Table S12
reg percent 	i.cond if sample==1 & study==3
reg percent 	i.cond if sample==1 & study==4
reg percent 	i.cond if sample==1 & study==5
mixed percent 	i.cond if sample==1 || study:
	estat df, method(residual)

	
* Table S13
reg z_performance_slope 	i.cond if sample==1 & study==2
reg z_performance_slope 	i.cond if sample==1 & study==3
reg z_performance_slope 	i.cond if sample==1 & study==4
reg z_performance_slope 	i.cond if sample==1 & study==5
mixed z_performance_slope 	i.cond if sample==1 || study:


* Table S14
reg s2_performance_slope 	i.cond if sample==1 & study==2
reg performance_slope 		i.cond if sample==1 & study==3
reg performance_slope 		i.cond if sample==1 & study==4
reg performance_slope 		i.cond if sample==1 & study==5
mixed performance_slope 	i.cond if sample==1 || study:


* Table S15
khb reg z_effort 			i.cond || z_slope if sample==1, disentangle
khb reg z_ln_effort 		i.cond || z_slope if sample==1, disentangle
khb reg z_sqrt_effort 		i.cond || z_slope if sample==1, disentangle


* Table S16
khb nbreg numbersearches 	i.cond || z_slope if sample==1, disentangle

* Table S17
mixed z_effort				i.cond if sample==1 & study>=2 || study:
mixed z_effort				i.cond z_performance_slope if sample==1 & study>=2 || study:
mixed z_ln_effort			i.cond if sample==1 & study>=2 || study:
mixed z_ln_effort			i.cond z_performance_slope if sample==1 & study>=2 || study:
mixed z_sqrt_effort			i.cond if sample==1 & study>=2 || study:
mixed z_sqrt_effort			i.cond z_performance_slope if sample==1 & study>=2 || study:
menbreg numbersearches		i.cond if sample==1 || study:
menbreg numbersearches		i.cond z_performance_slope if sample==1 || study:

* Figure S7
mixed numbersearches		i.cond z_performance_slope if sample==1 || study:
	margins, at(z_performance_slope=(-2 -1 0 1 2))
mixed ln_numbersearches		i.cond z_performance_slope if sample==1 || study:
	margins, at(z_performance_slope=(-2 -1 0 1 2))
mixed sqrt_numbersearches	i.cond z_performance_slope if sample==1 || study:
	margins, at(z_performance_slope=(-2 -1 0 1 2))
menbreg numbersearches		i.cond z_performance_slope if sample==1 || study:
	margins, at(z_performance_slope=(-2 -1 0 1 2))

* Table S19
tabstat tokens					if sample==1, statistics( mean sd skewness kurtosis ) by(study)
	sktest tokens				if sample==1 & study==1
	sktest tokens				if sample==1 & study==2
tabstat numbersearches 			if sample==1, statistics( mean sd skewness kurtosis ) by(study)
	sktest numbersearches		if sample==1 & study==1
	sktest numbersearches		if sample==1 & study==2
	sktest z_effort				if sample==1
tabstat ln_numbersearches 		if sample==1, statistics( mean sd skewness kurtosis ) by(study)
	sktest ln_numbersearches	if sample==1 & study==3
	sktest ln_numbersearches	if sample==1 & study==4
	sktest ln_numbersearches	if sample==1 & study==5
	sktest z_ln_effort			if sample==1
tabstat sqrt_numbersearches 	if sample==1, statistics( mean sd skewness kurtosis ) by(study)
	sktest sqrt_numbersearches	if sample==1 & study==3
	sktest sqrt_numbersearches	if sample==1 & study==4
	sktest sqrt_numbersearches	if sample==1 & study==5
	sktest z_sqrt_effort		if sample==1
	

* Table S20
* AIC and BIC from TableS8
reg z_effort 				if sample==1 & study==3
	estimates store null
reg z_effort 				i.cond if sample==1 & study==3
	estimates store main
lrtest null main

reg z_ln_effort 			if sample==1 & study==3
	estimates store null
reg z_ln_effort 			i.cond if sample==1 & study==3
	estimates store main
lrtest null main

reg z_sqrt_effort 			if sample==1 & study==3
	estimates store null
reg z_sqrt_effort 			i.cond if sample==1 & study==3
	estimates store main
lrtest null main

poisson numbersearches 		if sample==1 & study==3
	estimates store null
poisson numbersearches 		i.cond if sample==1 & study==3
	estimates store main
lrtest null main

nbreg numbersearches 		if sample==1 & study==3
	estimates store null
nbreg numbersearches 		i.cond if sample==1 & study==3
	estimates store main
lrtest null main

reg z_effort 				if sample==1 & study==4
	estimates store null
reg z_effort 				i.cond if sample==1 & study==4
	estimates store main
lrtest null main

reg z_ln_effort 			if sample==1 & study==4
	estimates store null
reg z_ln_effort 			i.cond if sample==1 & study==4
	estimates store main
lrtest null main

reg z_sqrt_effort 			if sample==1 & study==4
	estimates store null
reg z_sqrt_effort 			i.cond if sample==1 & study==4
	estimates store main
lrtest null main

poisson numbersearches 		if sample==1 & study==4
	estimates store null
poisson numbersearches 		i.cond if sample==1 & study==4
	estimates store main
lrtest null main

nbreg numbersearches 		if sample==1 & study==4
	estimates store null
nbreg numbersearches 		i.cond if sample==1 & study==4
	estimates store main
lrtest null main

reg z_effort 				if sample==1 & study==5
	estimates store null
reg z_effort 				i.cond if sample==1 & study==5
	estimates store main
lrtest null main

reg z_ln_effort 			if sample==1 & study==5
	estimates store null
reg z_ln_effort 			i.cond if sample==1 & study==5
	estimates store main
lrtest null main

reg z_sqrt_effort 			if sample==1 & study==5
	estimates store null
reg z_sqrt_effort 			i.cond if sample==1 & study==5
	estimates store main
lrtest null main

poisson numbersearches 		if sample==1 & study==5
	estimates store null
poisson numbersearches 		i.cond if sample==1 & study==5
	estimates store main
lrtest null main

nbreg numbersearches 		if sample==1 & study==5
	estimates store null
nbreg numbersearches 		i.cond if sample==1 & study==5
	estimates store main
lrtest null main

mixed z_effort 				if sample==1 || study:
	estimates store null
mixed z_effort 				i.cond if sample==1 || study:
	estimates store main
lrtest null main

mixed z_ln_effort 			if sample==1 || study:
	estimates store null
mixed z_ln_effort 			i.cond if sample==1 || study:
	estimates store main
lrtest null main

mixed z_sqrt_effort 		if sample==1 || study:
	estimates store null
mixed z_sqrt_effort 		i.cond if sample==1 || study:
	estimates store main
lrtest null main

mepoisson numbersearches 	if sample==1 || study:
	estimates store null
mepoisson numbersearches 	i.cond if sample==1 || study:
	estimates store main
lrtest null main

menbreg numbersearches 		if sample==1 || study:
	estimates store null
menbreg numbersearches 		i.cond if sample==1 || study:
	estimates store main
lrtest null main


* Table S22
reg muchlower_score 	i.cond##i.s5_majority if sample==1 & study==5
	margins cond##s5_majority
reg lower_score 		i.cond##i.s5_majority if sample==1 & study==5
	margins cond##s5_majority
reg same_score 			i.cond##i.s5_majority if sample==1 & study==5
	margins cond##s5_majority
reg higher_score 		i.cond##i.s5_majority if sample==1 & study==5
	margins cond##s5_majority
reg muchhigher_score	i.cond##i.s5_majority if sample==1 & study==5
	margins cond##s5_majority
reg bonus_chance		i.cond##i.s5_majority if sample==1 & study==5
	margins cond##s5_majority

* Table S23
reg numbersearches 			i.cond i.s5_majority if sample==1 
	estat ic
reg numbersearches 			i.cond##i.s5_majority if sample==1 
	estat ic
	
reg ln_numbersearches 		i.cond i.s5_majority if sample==1 
	estat ic
reg ln_numbersearches 		i.cond##i.s5_majority if sample==1 
	estat ic

reg sqrt_numbersearches 	i.cond i.s5_majority if sample==1 
	estat ic
reg sqrt_numbersearches 	i.cond##i.s5_majority if sample==1 
	estat ic

poisson numbersearches 		i.cond i.s5_majority if sample==1 
	estat ic
poisson numbersearches 		i.cond##i.s5_majority if sample==1 
	estat ic

nbreg numbersearches 		i.cond i.s5_majority if sample==1 
	estat ic
nbreg numbersearches 		i.cond##i.s5_majority if sample==1 
	estat ic
