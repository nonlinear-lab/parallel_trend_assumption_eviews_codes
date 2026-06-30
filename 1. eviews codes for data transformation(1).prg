' This is EViews code for data preparation

smpl if agep>=16 and agep<=64

series lfpr = @recode (esr <> 6, 1, 0)
series at_work = @recode (esr=1 or esr=4, 1, 0)
series unemployment = @recode (esr=3, 1, 0)
series employment = @recode (esr<>3 or esr<>6, 1, 0)
series gender = @recode (sex=2, 1, 0)
series time = @recode (year>2019, 1, 0)
series disability = @recode (dis=1, 1, 0)
series race = @recode (rac1p>1, 1, 0)
series education = @recode (schl<16, 1, 0)
series youth = @recode (agep>=16 and agep<=24, 1, 0)


