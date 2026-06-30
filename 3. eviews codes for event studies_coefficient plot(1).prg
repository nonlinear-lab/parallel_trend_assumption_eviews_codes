'This is EViews code for event studies

' coefficient plot

smpl @all
smpl if agep>=16 and agep<=64

series year2017 = @recode (year=2017, 1, 0)
series year2018 = @recode (year=2018, 1, 0)
series year2019 = @recode (year=2019, 1, 0)
series year2021 = @recode (year=2021, 1, 0)
series year2022 = @recode (year=2022, 1, 0)
series year2023 = @recode (year=2023, 1, 0)

equation eq4.ls(cov=cr, crname=st) lfpr gender year2017 year2018 year2021 year2022 year2023 gender*year2017 gender*year2018 gender*year2021 gender*year2022 gender*year2023 disability race education youth @expand(st, @dropfirst) c

' 1. Create temporary series to hold the plot data
series plot_year
series plot_coef
series plot_lb
series plot_ub

' 2. Restrict the sample to the first 6 rows to store our 6 years of data
smpl @first @first+5

' 3. Fill in the data for 2017 (Using C(7))
plot_year(1) = 2017
plot_coef(1) = eq4.@coefs(7)
plot_lb(1) = eq4.@coefs(7) - 1.96 * eq4.@stderrs(7)
plot_ub(1) = eq4.@coefs(7) + 1.96 * eq4.@stderrs(7)

' 4. Fill in the data for 2018 (Using C(8))
plot_year(2) = 2018
plot_coef(2) = eq4.@coefs(8)
plot_lb(2) = eq4.@coefs(8) - 1.96 * eq4.@stderrs(8)
plot_ub(2) = eq4.@coefs(8) + 1.96 * eq4.@stderrs(8)

' 5. Fill in the data for 2019 (The Base Year = 0)
plot_year(3) = 2019
plot_coef(3) = 0
plot_lb(3) = 0
plot_ub(3) = 0

' 6. Fill in the data for 2021 (Using C(9))
plot_year(4) = 2021
plot_coef(4) = eq4.@coefs(9)
plot_lb(4) = eq4.@coefs(9) - 1.96 * eq4.@stderrs(9)
plot_ub(4) = eq4.@coefs(9) + 1.96 * eq4.@stderrs(9)

' 7. Fill in the data for 2022 (Using C(10))
plot_year(5) = 2022
plot_coef(5) = eq4.@coefs(10)
plot_lb(5) = eq4.@coefs(10) - 1.96 * eq4.@stderrs(10)
plot_ub(5) = eq4.@coefs(10) + 1.96 * eq4.@stderrs(10)

' 8. Fill in the data for 2023 (Using C(11))
plot_year(6) = 2023
plot_coef(6) = eq4.@coefs(11)
plot_lb(6) = eq4.@coefs(11) - 1.96 * eq4.@stderrs(11)
plot_ub(6) = eq4.@coefs(11) + 1.96 * eq4.@stderrs(11)

' 9. Group the data for graphing (High-Low-Close format requires: UB, LB, Coef)
group event_data plot_ub plot_lb plot_coef

' 10. Generate the Error Bar graph mapped against the Year series
freeze(event_graph) event_data.errbar(x=plot_year)

' 11. Format the graph aesthetics 
event_graph.addtext(t) "Event Study: Shift in the Gender Gap Relative to 2019"
event_graph.addtext(l) "Difference in LFPR Gap (delta)"
event_graph.addtext(b) "Year"

' 12. Add the horizontal dashed zero line 
event_graph.draw(line, left) 0

' 13. CRITICAL: Reset the sample back to your main working dataset!
smpl if agep>=16 and agep<=64


