'Placebo permutation simulation

matrix(500,4) mout3

series gender_p
series year_p
series time_p

scalar c_001=0
scalar c_005=0
scalar c_010=0

For !s=1 to 500
gender_p=@recode(@rnd < 0.5, 1, 0)
y1=2018+@floor(@rnd*5)
time_p=@recode(y1>2020, 1, 0)

equation eq9.ls(cov=cr, crname=st) lfpr gender_p time_p gender_p*time_p disability race education youth c

freeze(wald5_pt) eq9.wald c(3)=0
mout3(!s,1)=wald5_pt(7,2)
mout3(!s,2)=wald5_pt(7,4)
delete wald5_pt

mout3(!s,3)=eq9.@coefs(3)
!df=eq9.@regobs-eq9.@ncoefs
!pa=@tdist(@abs(eq9.@@tstats(3)),!df)
mout3(!s,4)=!pa

if !pa<0.01 then
c_001=c_001+1
endif
if !pa<0.05 then
c_005=c_005+1
endif
if !pa<0.10 then
c_010=c_010+1
endif

next


