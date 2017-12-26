World Bank Indicators
========================================================
author: Carlos Plaza
date: 26-dic-2017
autosize: true

Summary
========================================================

- The World Bank collects a lot of data for tracking the development of nations: income, investment, poverty, 
social/gender equality, education... It can be browsed and downloaded   <a href="https://data.worldbank.org/" target="_blank">here</a>.

- In this project the relation between GDP (Gross Domestic Product)per person and life expectancy at birth is depicted, taken the data from 2015 (last year available). There's a positive relation: with higher GDP per person, higher life expectancy is expected.

- Poorest countries with lowest life expectancy are in Africa.

- A link to a shiny app where it's possible to filter the data by continent and range of life expectancy is included.

Countries with lowest life expectancy
========================================================


```r
#data available at Github
library(knitr)
dat <- read.csv("World_Bank_indicators.csv", header = T, sep=";", na.strings = ".." )
dat <- na.omit(dat)
dat$population = as.numeric(gsub(",", "",dat$population, fixed = TRUE))
dat$GDP_per_person = as.numeric(gsub(",", "",dat$GDP_per_person, fixed = TRUE))
dat <- dat[order(dat$life_expectancy_at_bird),]
kable(dat[1:5,1:4], "html", row.names = FALSE)
```

<table>
 <thead>
  <tr>
   <th style="text-align:left;"> country </th>
   <th style="text-align:left;"> continent </th>
   <th style="text-align:right;"> life_expectancy_at_bird </th>
   <th style="text-align:right;"> GDP_per_person </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Central African Republic </td>
   <td style="text-align:left;"> Africa </td>
   <td style="text-align:right;"> 51.4 </td>
   <td style="text-align:right;"> 348.4 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Sierra Leone </td>
   <td style="text-align:left;"> Africa </td>
   <td style="text-align:right;"> 51.4 </td>
   <td style="text-align:right;"> 587.5 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Chad </td>
   <td style="text-align:left;"> Africa </td>
   <td style="text-align:right;"> 52.6 </td>
   <td style="text-align:right;"> 777.2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Nigeria </td>
   <td style="text-align:left;"> Africa </td>
   <td style="text-align:right;"> 53.0 </td>
   <td style="text-align:right;"> 2655.2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Cote d'Ivoire </td>
   <td style="text-align:left;"> Africa </td>
   <td style="text-align:right;"> 53.1 </td>
   <td style="text-align:right;"> 1434.3 </td>
  </tr>
</tbody>
</table>

Relation between GDP (log scale) and life expectancy
========================================================

![plot of chunk unnamed-chunk-2](worldBankIndicators-figure/unnamed-chunk-2-1.png)

Full shiny app <a href="https://cplesp.shinyapps.io/worldbank" target="_blank">here</a>.
