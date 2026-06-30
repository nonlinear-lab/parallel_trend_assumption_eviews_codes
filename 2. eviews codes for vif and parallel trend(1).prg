'This is EViews code for baseline model, VIF and parallel trend 

matrix(7,3) mout

smpl @all 
smpl if agep>=16 and agep<=64

equation eq1.ls lfpr gender time gender*time disability race education youth c
equation eq2.ls(cov=cr, crname=st) lfpr gender time gender*time disability race education youth c

'vif
freeze(vif_pt) eq1.varinf

For !s=1 to 7
scalar ss=!s+8
mout(!s,1)=vif_pt(ss,4)
mout(!s,2)=1/vif_pt(ss,4)
next

delete vif_pt

' parallel trend assumption 1

smpl if time=0
equation eq3.ls(cov=cr, crname=st) lfpr gender year gender*year disability race education youth c

freeze(wald1_pt) eq3.wald c(3)=0
mout(1,3)=wald1_pt(7,2)

delete wald1_pt

' parallel trend assumption 2

series year2018 = @recode (year=2018, 1, 0)
series year2019 = @recode (year=2019, 1, 0)

smpl if time=0
equation eq3.ls(cov=cr, crname=st) lfpr gender year gender*year2018 gender*year2019 disability race education youth c

freeze(wald2_pt) eq3.wald c(3)=0, c(4)=0

mout(2,3)=wald2_pt(6,2)

delete wald2_pt
