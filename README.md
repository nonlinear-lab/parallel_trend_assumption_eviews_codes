# parallel_trend_assumption_eviews_codes
This repository contains EViews-codes for the parallel trend assumption
1. EViews codes for data transformation to create variables from data of the American Community Survey (ACS) 
2. EViews codes for the ariance Inflation Factor and parallel trend assumption1 and parallel trend assumption2
(Parallel trend assumption1 is whehter Year*gender would be signficiant)
(Parallel trend assumption2 is whehter Year2018*gender and Year2019*gender would be jointly signficiant)
3. EViews codes for event study1 coefficient plot
(These coefficients are estimated by Year2017*gender,Year2018*gender,Year2021*gender,Year2022*gender and Year2023*gender)
(we set 2019 as baseline year, so coefficient for Year2019*gender is zero)     
4. EViews codes for event study2 predictive margin
(These coefficients are estimated by Year2017*gender,Year2018*gender,Year2021*gender,Year2022*gender and Year2023*gender)
(For control variable, disability, race, education, youth, we put it the actual data)
(However, gender, time, gender*time, we estimate ten sets
(male_2017, male_2018, male_2021,male_2022, male_2023, female_2017, female_2018, female_2021,female_2022, female_2023)  
(For 2019, predicative margin include only predicated value from control variable)
5. EViews codes for placebo analysis1 and Placebo analysis 2
(Placebo analysis1 is false year for pre-pandemic data only. Placebo analysis2 is false group for male only data)
9 EViews codes for placebo permutation stimulation
(This code generate randomly 500 set of gender and time and estimate t-statistics and its p-values for interaction term) 
