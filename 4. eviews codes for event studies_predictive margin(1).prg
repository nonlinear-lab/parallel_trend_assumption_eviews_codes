'This is EViews code for event studies

' predictive margin

matrix(2,6) mdata

smpl @all
smpl if agep>=16 and agep<=64

series year2017 = @recode (year=2017, 1, 0)
series year2018 = @recode (year=2018, 1, 0)
series year2019 = @recode (year=2019, 1, 0)
series year2021 = @recode (year=2021, 1, 0)
series year2022 = @recode (year=2022, 1, 0)
series year2023 = @recode (year=2023, 1, 0)

equation eq4.ls(cov=cr, crname=st) lfpr gender year2017 year2018 year2021 year2022 year2023 gender*year2017 gender*year2018 gender*year2021 gender*year2022 gender*year2023 disability race education youth @expand(st, @dropfirst) c

series predict1=eq4.@coefs(12)*disability+eq4.@coefs(13)*race+eq4.@coefs(14)*education+eq4.@coefs(15)*youth+eq4.@coefs(16)

' out of 52 US states, excluding first stata as base_state, so only 51 states
vector(51) v_state
v_state.fill 2, 4, 5, 6, 8,9,10, 11, 12, 13, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 44, 45, 46, 47, 48, 49, 50, 51, 53, 54, 55, 56, 72

series sw=0
For !s=1 to 51
	!state_index=!s+16
	series sw1=eq4.@coefs(!state_index)*(st=v_state(!s))	
	sw=sw+sw1	
next

scalar predict_m=@mean(predict1+sw)


For !g=1 to 2

	if !g==1 then
	scalar sg=0
	endif
	if !g==2 then
	scalar sg=eq4.@coefs(1)
	endif

    	For !y=1 to 6
		if !y==1 then
			if !g==2 then 
			scalar sy2017=eq4.@coefs(2)+eq4.@coefs(7)
			mdata(!g,!y)=predict_m+sg+sy2017
			else
			mdata(!g,!y)=predict_m+sg+eq4.@coefs(2)
			endif
		endif
		if !y==2 then
			if !g==2 then
			scalar sy2018=eq4.@coefs(3)+eq4.@coefs(8)
			mdata(!g,!y)=predict_m+sg+sy2018
			else
			mdata(!g,!y)=predict_m+sg+eq4.@coefs(3)
			endif
		endif
		if !y==3 then
		scalar sy2019=0
		mdata(!g,!y)=predict_m+sg
		endif
		if !y==4 then
			if !g==2 then
			scalar sy2021=eq4.@coefs(4)+eq4.@coefs(9)
			mdata(!g,!y)=predict_m+sg+sy2021
			else
			mdata(!g,!y)=predict_m+sg+eq4.@coefs(4)
			endif
		endif
		if !y==5 then
			if !g==2 then
			scalar sy2022=eq4.@coefs(5)+eq4.@coefs(10)
			mdata(!g,!y)=predict_m+sg+sy2022
			else
			mdata(!g,!y)=predict_m+sg+eq4.@coefs(5)
			endif
		endif
		if !y==6 then
			if !g==2 then
			scalar sy2023=eq4.@coefs(6)+eq4.@coefs(11)
			mdata(!g,!y)=predict_m+sg+sy2023	
			else
			mdata(!g,!y)=predict_m+sg+eq4.@coefs(6)
			endif	
		endif
	next
next
 


'


