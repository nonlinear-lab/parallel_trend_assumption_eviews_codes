' placebo analysis

matrix(2,2) mout2

'baseline model
smpl @all 
smpl if agep>=16 and agep<=64

equation eq1.ls lfpr gender time gender*time disability race education youth c
equation eq2.ls(cov=cr, crname=st) lfpr gender time gender*time disability race education youth c

'placebo 1 (false time)

smpl if time<1

'false time
series time1 = @recode (year>=2019, 1, 0)

equation eq5.ls lfpr gender time1 gender*time1 disability race education youth c
equation eq6.ls(cov=cr, crname=st) lfpr gender time1 gender*time1 disability race education youth c @expand(st,@dropfirst) 
freeze(wald3_pt) eq6.wald c(3)=0
mout2(1,1)=wald3_pt(7,2)
mout2(1,2)=wald3_pt(7,4)
delete wald3_pt

'placebo 2 (false group)

smpl if gender<1

equation eq7.ls lfpr race time race*time disability education youth c
equation eq8.ls(cov=cr, crname=st) lfpr race time race*time disability education youth c @expand(st,@dropfirst) 
freeze(wald4_pt) eq8.wald c(3)=0
mout2(2,1)=wald4_pt(7,2)
mout2(2,2)=wald4_pt(7,4)
delete wald4_pt



