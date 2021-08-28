# Ben Shneiderman's Visualization Mantra

Mohammed Aqid Khatkhatay and Sanket Gokhale



## Introduction:

Data Visualization today has emerged as a very important aspect in any career. It has not only made comprehending data easy for the human brain but also gaining insights [1].

Visualization has become easier with the improvements in hardware and software over the years. Colors have been useful in deciding the information to be conveyed [2].

Good communication is the key to good understanding. Similarly good visualization is the key to good insights.

Every data visualization has 3 C's namely Content, Context and Construction. Content basically refers to the data to be plotted. Context refers to the specifications about data, usually stored in a data dictionary. Construction is the phase where the visuals are built from the content and context.


## Need for Visualization:

Firstly the need for any kind of data or information visualization is to gain insights into the data and not just pictures or graphs. 

Moreover visualization allows us to detect faulty or missing data or inconsistencies within the data.

Anomalies can also be found and corrected.  Visualization is multidisciplinary, that is any person can use it to get a deeper understanding of data.

It can help higher level professionals convert raw insights into business problems. Colors add different perceptions and can help think differently. Visualization should penetrate the visual domain of an individual. 

Too much visualization can cause problems and staggering of data. It can also hide important insights. For this purpose we need fixed guidelines on how to apply visualizations and what to show and what to hide. 



## Ben Shneiderman's Visual Information Seeking Mantra 

In his paper titled “The eyes have it: a task by data type taxonomy for information visualizations” [3], Ben Schneiderman suggested the following 7 principles for visualization of data.


### Step 1-> Overview:

The first step of the Holy Trinity of Visual Information Seeking is 'Overview'. In this step, it is recommended to visualize the given data set in a simple way without going into too much detail. We do not want to lose any information in this step, thus it is recommended to not apply any filters and just visualize the given data to get an idea about it.

For explaining the different steps of Visual Information Seeking, we take the example of Covid-19 statistics from 1 January to 15 January of USA. The data set has 3 columns: 
(i) date 
(ii) daily_new_cases 
(iii) daily_deaths

As the first step, we will visualize the Covid-19 data set using simple bar graph. 
The x-axis represents the dates and the bar height shows the daily_new_cases for each date.


```r
library(ggplot2)
library(reshape2)
library(scales)
daily_new_cases = c(225974, 239642, 201613, 199506, 234864, 264914, 280785, 308301, 258373, 221676, 220023, 230597, 239313, 235643, 249623)
daily_deaths = c(2304, 2109, 1427, 2003, 3806, 4115, 4160, 4066, 3278, 1883, 2078, 4513, 4097, 4161, 3821)
dat <- data.frame(date=c("Jan 01","Jan 02","Jan 03","Jan 04","Jan 05","Jan 06","Jan 07","Jan 08","Jan 09","Jan 10","Jan 11","Jan 12","Jan 13","Jan 14","Jan 15"),daily_new_cases=c(daily_new_cases), daily_deaths=c(daily_deaths))

ggp <- ggplot(dat, aes(x=date, y=daily_new_cases)) +
    geom_bar(stat="identity", position="dodge") +
    theme(axis.text.x = element_text(angle = 60)) +
    scale_y_continuous(labels = comma) +
    ggtitle("Daily New Cases") +
    theme(plot.title = element_text(hjust = 0.5))
ggp
```

<img src="ben_shneidermans_visualization_mantra_files/figure-html/unnamed-chunk-2-1.png" width="768" style="display: block; margin: auto;" />


### Step 2(and 3) -> Zoom and Filter:

After understanding the basic distribution of the data set in the first step, the next steps that follow are 'Zoom' and 'Filter'. Here, we proceed to focus on the part of the data set that is of value to us. Zooming and Filtering help highlight the objects of interest using various techniques.

Continuing on our example, there are two ways we can zoom in on the data:

i) Suppose we want to find the days where the daily_new_cases is between 220,000 and 310,000. Here we will perform a zoom on the Y-axis so that we can only see bar graphs for days that have daily_new_cases between the 220,000 and 310,000.

ii) We can also perform zoom on specific days. In this example, we want to find out the daily_new_cases from Jan 1 to Jan 5.


```r
ggp1 <- ggplot(dat, aes(x=date, y=daily_new_cases, fill = daily_deaths)) +
    geom_bar(stat="identity", position="dodge") +
    theme(axis.text.x = element_text(angle = 15))
ggp1 +                                              
  coord_cartesian(ylim = c(220000, 310000)) + ggtitle("Daily New Cases") + theme(plot.title = element_text(hjust = 0.5))
```

<img src="ben_shneidermans_visualization_mantra_files/figure-html/unnamed-chunk-3-1.png" width="768" style="display: block; margin: auto;" />

```r
ggp2 <- ggplot(dat, aes(x=date, y=daily_new_cases, fill = daily_deaths)) +
    geom_bar(stat="identity", position="dodge") +
    theme(axis.text.x = element_text(angle = 0))
ggp2 + xlim("Jan 01", "Jan 03", "Jan 04", "Jan 05") + scale_y_continuous(labels = comma)+ ggtitle("Daily New Cases and Daily Deaths Overview") + theme(plot.title = element_text(hjust = 0.5))
```

<img src="ben_shneidermans_visualization_mantra_files/figure-html/unnamed-chunk-3-2.png" width="768" style="display: block; margin: auto;" />

In this data set, we can filter to show only the dates of interest. Suppose we want to find the daily_new_cases for dates which have observed more than 4000 deaths. Here we can use the filter() function in R as follows:


```r
library(ggplot2)
library(plotly)

p <-filter(dat, dat$daily_deaths>=4000) 
ggp2 <- ggplot(p, aes(x=date, y=daily_new_cases, fill = daily_deaths)) +
    geom_bar(stat="identity", position="dodge") +
    theme(axis.text.x = element_text(angle = 60)) + 
    scale_y_continuous(labels = comma) 
ggp2+ ggtitle("Daily New Cases filtered by Daily Deaths") + theme(plot.title = element_text(hjust = 0.5))
```

<img src="ben_shneidermans_visualization_mantra_files/figure-html/unnamed-chunk-4-1.png" width="768" style="display: block; margin: auto;" />



### Step 4 -> Details On Demand

We identify areas of interest in the first step(Overview), and dig deeper into the data using zooming and filtering in the second step, the next step naturally should be to find exact details which will help us find interesting facts from the data set.
The final step of the Holy Trinity is details on demand. Here we use the full power of interactivity that are provided by the libraries that we use.

For example, for the Covid-19 dataset, we can use the library 'plotly' to make the graph we produced above, more interactive. When we hover our cursor above each bar in this graph, we get the details for that particular day.


```r
ggplotly(ggp2+ ggtitle("Daily New Cases filtered by Daily Deaths with details on Hover")+ theme(plot.title = element_text(hjust = 0.5))) 
```

```{=html}
<div id="htmlwidget-02c9b5f418e2d0cdc3da" style="width:768px;height:576px;" class="plotly html-widget"></div>
<script type="application/json" data-for="htmlwidget-02c9b5f418e2d0cdc3da">{"x":{"data":[{"orientation":"v","width":0.9,"base":0,"x":[3],"y":[308301],"text":"date: Jan 08<br />daily_new_cases: 308301<br />daily_deaths: 4066","type":"bar","marker":{"autocolorscale":false,"color":"rgba(19,43,67,1)","line":{"width":1.88976377952756,"color":"transparent"}},"showlegend":false,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"orientation":"v","width":0.9,"base":0,"x":[5],"y":[239313],"text":"date: Jan 13<br />daily_new_cases: 239313<br />daily_deaths: 4097","type":"bar","marker":{"autocolorscale":false,"color":"rgba(23,51,78,1)","line":{"width":1.88976377952756,"color":"transparent"}},"showlegend":false,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"orientation":"v","width":0.9,"base":0,"x":[1],"y":[264914],"text":"date: Jan 06<br />daily_new_cases: 264914<br />daily_deaths: 4115","type":"bar","marker":{"autocolorscale":false,"color":"rgba(26,56,85,1)","line":{"width":1.88976377952756,"color":"transparent"}},"showlegend":false,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"orientation":"v","width":0.9,"base":0,"x":[2],"y":[280785],"text":"date: Jan 07<br />daily_new_cases: 280785<br />daily_deaths: 4160","type":"bar","marker":{"autocolorscale":false,"color":"rgba(32,68,101,1)","line":{"width":1.88976377952756,"color":"transparent"}},"showlegend":false,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"orientation":"v","width":0.9,"base":0,"x":[6],"y":[235643],"text":"date: Jan 14<br />daily_new_cases: 235643<br />daily_deaths: 4161","type":"bar","marker":{"autocolorscale":false,"color":"rgba(32,69,102,1)","line":{"width":1.88976377952756,"color":"transparent"}},"showlegend":false,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"orientation":"v","width":0.9,"base":0,"x":[4],"y":[230597],"text":"date: Jan 12<br />daily_new_cases: 230597<br />daily_deaths: 4513","type":"bar","marker":{"autocolorscale":false,"color":"rgba(86,177,247,1)","line":{"width":1.88976377952756,"color":"transparent"}},"showlegend":false,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"x":[1],"y":[0],"name":"99_da9116039af18896f07f7e500638debb","type":"scatter","mode":"markers","opacity":0,"hoverinfo":"skip","showlegend":false,"marker":{"color":[0,1],"colorscale":[[0,"#132B43"],[0.00334448160535107,"#132B44"],[0.00668896321070214,"#132C44"],[0.0100334448160532,"#142C45"],[0.0133779264214043,"#142D45"],[0.0167224080267553,"#142D46"],[0.0200668896321074,"#142D46"],[0.0234113712374585,"#142E47"],[0.0267558528428096,"#152E47"],[0.0301003344481606,"#152F48"],[0.0334448160535117,"#152F48"],[0.0367892976588628,"#152F49"],[0.0401337792642138,"#153049"],[0.0434782608695649,"#16304A"],[0.046822742474916,"#16304A"],[0.0501672240802681,"#16314B"],[0.0535117056856191,"#16314B"],[0.0568561872909702,"#16324C"],[0.0602006688963213,"#17324D"],[0.0635451505016723,"#17324D"],[0.0668896321070234,"#17334E"],[0.0702341137123745,"#17334E"],[0.0735785953177255,"#17344F"],[0.0769230769230766,"#18344F"],[0.0802675585284277,"#183450"],[0.0836120401337788,"#183550"],[0.0869565217391298,"#183551"],[0.0903010033444809,"#183651"],[0.093645484949832,"#193652"],[0.096989966555183,"#193652"],[0.100334448160536,"#193753"],[0.103678929765887,"#193754"],[0.107023411371238,"#193854"],[0.110367892976589,"#1A3855"],[0.11371237458194,"#1A3955"],[0.117056856187291,"#1A3956"],[0.120401337792643,"#1A3956"],[0.123745819397994,"#1A3A57"],[0.127090301003345,"#1B3A57"],[0.130434782608696,"#1B3B58"],[0.133779264214047,"#1B3B59"],[0.137123745819398,"#1B3B59"],[0.140468227424749,"#1C3C5A"],[0.1438127090301,"#1C3C5A"],[0.147157190635451,"#1C3D5B"],[0.150501672240802,"#1C3D5B"],[0.153846153846153,"#1C3D5C"],[0.157190635451504,"#1D3E5C"],[0.160535117056855,"#1D3E5D"],[0.163879598662206,"#1D3F5D"],[0.167224080267558,"#1D3F5E"],[0.170568561872911,"#1D3F5F"],[0.173913043478262,"#1E405F"],[0.177257525083613,"#1E4060"],[0.180602006688964,"#1E4160"],[0.183946488294315,"#1E4161"],[0.187290969899666,"#1E4261"],[0.190635451505017,"#1F4262"],[0.193979933110368,"#1F4263"],[0.197324414715719,"#1F4363"],[0.20066889632107,"#1F4364"],[0.204013377926421,"#1F4464"],[0.207357859531772,"#204465"],[0.210702341137123,"#204465"],[0.214046822742474,"#204566"],[0.217391304347826,"#204566"],[0.220735785953177,"#214667"],[0.224080267558528,"#214668"],[0.227424749163879,"#214768"],[0.23076923076923,"#214769"],[0.234113712374583,"#214769"],[0.237458193979934,"#22486A"],[0.240802675585285,"#22486A"],[0.244147157190636,"#22496B"],[0.247491638795987,"#22496C"],[0.250836120401338,"#224A6C"],[0.254180602006689,"#234A6D"],[0.25752508361204,"#234A6D"],[0.260869565217391,"#234B6E"],[0.264214046822743,"#234B6E"],[0.267558528428094,"#244C6F"],[0.270903010033445,"#244C70"],[0.274247491638796,"#244C70"],[0.277591973244147,"#244D71"],[0.280936454849498,"#244D71"],[0.284280936454849,"#254E72"],[0.2876254180602,"#254E72"],[0.290969899665551,"#254F73"],[0.294314381270902,"#254F74"],[0.297658862876253,"#254F74"],[0.301003344481604,"#265075"],[0.304347826086957,"#265075"],[0.307692307692308,"#265176"],[0.31103678929766,"#265176"],[0.314381270903011,"#275277"],[0.317725752508362,"#275278"],[0.321070234113713,"#275278"],[0.324414715719064,"#275379"],[0.327759197324415,"#275379"],[0.331103678929766,"#28547A"],[0.334448160535117,"#28547B"],[0.337792642140468,"#28557B"],[0.341137123745819,"#28557C"],[0.34448160535117,"#28567C"],[0.347826086956521,"#29567D"],[0.351170568561872,"#29567D"],[0.354515050167223,"#29577E"],[0.357859531772575,"#29577F"],[0.361204013377926,"#2A587F"],[0.364548494983277,"#2A5880"],[0.36789297658863,"#2A5980"],[0.371237458193981,"#2A5981"],[0.374581939799332,"#2A5982"],[0.377926421404683,"#2B5A82"],[0.381270903010034,"#2B5A83"],[0.384615384615385,"#2B5B83"],[0.387959866220736,"#2B5B84"],[0.391304347826087,"#2C5C85"],[0.394648829431438,"#2C5C85"],[0.397993311036789,"#2C5D86"],[0.40133779264214,"#2C5D86"],[0.404682274247491,"#2C5D87"],[0.408026755852843,"#2D5E87"],[0.411371237458194,"#2D5E88"],[0.414715719063545,"#2D5F89"],[0.418060200668896,"#2D5F89"],[0.421404682274247,"#2E608A"],[0.424749163879598,"#2E608A"],[0.428093645484949,"#2E618B"],[0.4314381270903,"#2E618C"],[0.434782608695651,"#2E618C"],[0.438127090301004,"#2F628D"],[0.441471571906355,"#2F628D"],[0.444816053511706,"#2F638E"],[0.448160535117057,"#2F638F"],[0.451505016722409,"#30648F"],[0.45484949832776,"#306490"],[0.458193979933111,"#306590"],[0.461538461538462,"#306591"],[0.464882943143813,"#306592"],[0.468227424749164,"#316692"],[0.471571906354515,"#316693"],[0.474916387959866,"#316793"],[0.478260869565217,"#316794"],[0.481605351170568,"#326895"],[0.484949832775919,"#326895"],[0.48829431438127,"#326996"],[0.491638795986621,"#326996"],[0.494983277591972,"#326997"],[0.498327759197323,"#336A98"],[0.501672240802677,"#336A98"],[0.505016722408028,"#336B99"],[0.508361204013379,"#336B99"],[0.51170568561873,"#346C9A"],[0.515050167224081,"#346C9B"],[0.518394648829432,"#346D9B"],[0.521739130434783,"#346D9C"],[0.525083612040134,"#346E9D"],[0.528428093645485,"#356E9D"],[0.531772575250836,"#356E9E"],[0.535117056856187,"#356F9E"],[0.538461538461538,"#356F9F"],[0.541806020066889,"#3670A0"],[0.54515050167224,"#3670A0"],[0.548494983277591,"#3671A1"],[0.551839464882943,"#3671A1"],[0.555183946488294,"#3772A2"],[0.558528428093645,"#3772A3"],[0.561872909698996,"#3773A3"],[0.565217391304347,"#3773A4"],[0.568561872909698,"#3773A4"],[0.571906354515051,"#3874A5"],[0.575250836120402,"#3874A6"],[0.578595317725753,"#3875A6"],[0.581939799331104,"#3875A7"],[0.585284280936455,"#3976A8"],[0.588628762541806,"#3976A8"],[0.591973244147157,"#3977A9"],[0.595317725752509,"#3977A9"],[0.59866220735786,"#3978AA"],[0.602006688963211,"#3A78AB"],[0.605351170568562,"#3A79AB"],[0.608695652173913,"#3A79AC"],[0.612040133779264,"#3A79AC"],[0.615384615384615,"#3B7AAD"],[0.618729096989966,"#3B7AAE"],[0.622073578595317,"#3B7BAE"],[0.625418060200668,"#3B7BAF"],[0.628762541806019,"#3C7CB0"],[0.63210702341137,"#3C7CB0"],[0.635451505016723,"#3C7DB1"],[0.638795986622074,"#3C7DB1"],[0.642140468227426,"#3C7EB2"],[0.645484949832777,"#3D7EB3"],[0.648829431438128,"#3D7FB3"],[0.652173913043479,"#3D7FB4"],[0.65551839464883,"#3D7FB5"],[0.658862876254181,"#3E80B5"],[0.662207357859532,"#3E80B6"],[0.665551839464883,"#3E81B6"],[0.668896321070234,"#3E81B7"],[0.672240802675585,"#3F82B8"],[0.675585284280936,"#3F82B8"],[0.678929765886287,"#3F83B9"],[0.682274247491638,"#3F83BA"],[0.685618729096989,"#4084BA"],[0.68896321070234,"#4084BB"],[0.692307692307692,"#4085BB"],[0.695652173913043,"#4085BC"],[0.698996655518394,"#4086BD"],[0.702341137123745,"#4186BD"],[0.705685618729098,"#4186BE"],[0.709030100334449,"#4187BF"],[0.7123745819398,"#4187BF"],[0.715719063545151,"#4288C0"],[0.719063545150502,"#4288C1"],[0.722408026755853,"#4289C1"],[0.725752508361204,"#4289C2"],[0.729096989966555,"#438AC2"],[0.732441471571906,"#438AC3"],[0.735785953177257,"#438BC4"],[0.739130434782609,"#438BC4"],[0.74247491638796,"#438CC5"],[0.745819397993311,"#448CC6"],[0.749163879598662,"#448DC6"],[0.752508361204013,"#448DC7"],[0.755852842809364,"#448EC8"],[0.759197324414715,"#458EC8"],[0.762541806020066,"#458FC9"],[0.765886287625417,"#458FC9"],[0.76923076923077,"#458FCA"],[0.772575250836121,"#4690CB"],[0.775919732441472,"#4690CB"],[0.779264214046823,"#4691CC"],[0.782608695652174,"#4691CD"],[0.785953177257526,"#4792CD"],[0.789297658862877,"#4792CE"],[0.792642140468228,"#4793CF"],[0.795986622073579,"#4793CF"],[0.79933110367893,"#4894D0"],[0.802675585284281,"#4894D0"],[0.806020066889632,"#4895D1"],[0.809364548494983,"#4895D2"],[0.812709030100334,"#4896D2"],[0.816053511705685,"#4996D3"],[0.819397993311036,"#4997D4"],[0.822742474916387,"#4997D4"],[0.826086956521738,"#4998D5"],[0.829431438127089,"#4A98D6"],[0.83277591973244,"#4A99D6"],[0.836120401337792,"#4A99D7"],[0.839464882943145,"#4A9AD8"],[0.842809364548496,"#4B9AD8"],[0.846153846153847,"#4B9BD9"],[0.849498327759198,"#4B9BDA"],[0.852842809364549,"#4B9BDA"],[0.8561872909699,"#4C9CDB"],[0.859531772575251,"#4C9CDB"],[0.862876254180602,"#4C9DDC"],[0.866220735785953,"#4C9DDD"],[0.869565217391304,"#4D9EDD"],[0.872909698996655,"#4D9EDE"],[0.876254180602006,"#4D9FDF"],[0.879598662207357,"#4D9FDF"],[0.882943143812709,"#4DA0E0"],[0.88628762541806,"#4EA0E1"],[0.889632107023411,"#4EA1E1"],[0.892976588628762,"#4EA1E2"],[0.896321070234113,"#4EA2E3"],[0.899665551839464,"#4FA2E3"],[0.903010033444817,"#4FA3E4"],[0.906354515050168,"#4FA3E5"],[0.909698996655519,"#4FA4E5"],[0.91304347826087,"#50A4E6"],[0.916387959866221,"#50A5E7"],[0.919732441471572,"#50A5E7"],[0.923076923076923,"#50A6E8"],[0.926421404682274,"#51A6E8"],[0.929765886287626,"#51A7E9"],[0.933110367892977,"#51A7EA"],[0.936454849498328,"#51A8EA"],[0.939799331103679,"#52A8EB"],[0.94314381270903,"#52A9EC"],[0.946488294314381,"#52A9EC"],[0.949832775919732,"#52AAED"],[0.953177257525083,"#53AAEE"],[0.956521739130434,"#53ABEE"],[0.959866220735785,"#53ABEF"],[0.963210702341136,"#53ACF0"],[0.966555183946487,"#54ACF0"],[0.969899665551838,"#54ADF1"],[0.973244147157191,"#54ADF2"],[0.976588628762542,"#54AEF2"],[0.979933110367894,"#55AEF3"],[0.983277591973245,"#55AFF4"],[0.986622073578596,"#55AFF4"],[0.989966555183947,"#55B0F5"],[0.993311036789298,"#56B0F6"],[0.996655518394649,"#56B1F6"],[1,"#56B1F7"]],"colorbar":{"bgcolor":"rgba(255,255,255,1)","bordercolor":"transparent","borderwidth":1.88976377952756,"thickness":23.04,"title":"daily_deaths","titlefont":{"color":"rgba(0,0,0,1)","family":"","size":14.6118721461187},"tickmode":"array","ticktext":["4100","4200","4300","4400","4500"],"tickvals":[0.0760626398210291,0.299776286353468,0.523489932885906,0.747203579418344,0.970917225950783],"tickfont":{"color":"rgba(0,0,0,1)","family":"","size":11.689497716895},"ticklen":2,"len":0.5}},"xaxis":"x","yaxis":"y","frame":null}],"layout":{"margin":{"t":43.2754946727549,"r":7.30593607305936,"b":39.6955859969559,"l":66.4840182648402},"plot_bgcolor":"rgba(235,235,235,1)","paper_bgcolor":"rgba(255,255,255,1)","font":{"color":"rgba(0,0,0,1)","family":"","size":14.6118721461187},"title":{"text":"Daily New Cases filtered by Daily Deaths with details on Hover","font":{"color":"rgba(0,0,0,1)","family":"","size":17.5342465753425},"x":0.5,"xref":"paper"},"xaxis":{"domain":[0,1],"automargin":true,"type":"linear","autorange":false,"range":[0.4,6.6],"tickmode":"array","ticktext":["Jan 06","Jan 07","Jan 08","Jan 12","Jan 13","Jan 14"],"tickvals":[1,2,3,4,5,6],"categoryorder":"array","categoryarray":["Jan 06","Jan 07","Jan 08","Jan 12","Jan 13","Jan 14"],"nticks":null,"ticks":"outside","tickcolor":"rgba(51,51,51,1)","ticklen":3.65296803652968,"tickwidth":0.66417600664176,"showticklabels":true,"tickfont":{"color":"rgba(77,77,77,1)","family":"","size":11.689497716895},"tickangle":-60,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"gridcolor":"rgba(255,255,255,1)","gridwidth":0.66417600664176,"zeroline":false,"anchor":"y","title":{"text":"date","font":{"color":"rgba(0,0,0,1)","family":"","size":14.6118721461187}},"hoverformat":".2f"},"yaxis":{"domain":[0,1],"automargin":true,"type":"linear","autorange":false,"range":[-15415.05,323716.05],"tickmode":"array","ticktext":["0","100,000","200,000","300,000"],"tickvals":[0,100000,200000,300000],"categoryorder":"array","categoryarray":["0","100,000","200,000","300,000"],"nticks":null,"ticks":"outside","tickcolor":"rgba(51,51,51,1)","ticklen":3.65296803652968,"tickwidth":0.66417600664176,"showticklabels":true,"tickfont":{"color":"rgba(77,77,77,1)","family":"","size":11.689497716895},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"gridcolor":"rgba(255,255,255,1)","gridwidth":0.66417600664176,"zeroline":false,"anchor":"x","title":{"text":"daily_new_cases","font":{"color":"rgba(0,0,0,1)","family":"","size":14.6118721461187}},"hoverformat":".2f"},"shapes":[{"type":"rect","fillcolor":null,"line":{"color":null,"width":0,"linetype":[]},"yref":"paper","xref":"paper","x0":0,"x1":1,"y0":0,"y1":1}],"showlegend":false,"legend":{"bgcolor":"rgba(255,255,255,1)","bordercolor":"transparent","borderwidth":1.88976377952756,"font":{"color":"rgba(0,0,0,1)","family":"","size":11.689497716895}},"hovermode":"closest","barmode":"relative"},"config":{"doubleClick":"reset","showSendToCloud":false},"source":"A","attrs":{"11bd856e613a":{"x":{},"y":{},"fill":{},"type":"bar"}},"cur_data":"11bd856e613a","visdat":{"11bd856e613a":["function (y) ","x"]},"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.2,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>
```


In 1996, Shneiderman offered a taxonomy for visual information seeking. The taxonomy divides general visual information seeking into seven data types and seven tasks. This taxonomy is one of the earliest and most influential contributions to the information visualization field.

Seven Data Types:

• <u>one-dimensional data</u>:

This refers to the linear type of data. For example texts and numbers.

• <u>two-dimensional data</u>:

This refers to the multi-layer type of data. For example maps and contour plots.

• <u>three-dimensional data</u>:

This refers to the object type of data. For example buildings, street-view or mechanical instruments.

• <u>temporal data</u>:

This refers to the time based type of data. For example time charts and time series.

• <u>multidimensional data</u>:

This refers to the statistical and relational data containing n-attributes in n-dimensions. For example multidimensional histogram or multidimensional scatters.

• <u>tree data</u>:

This refers to data having parent-child type structure. For example Decision tree and Family tree.

• <u>network data</u>:

This refers to data in which attributes have relationships among themselves. For example social networks.

The additional tasks other than the Holy Trinity include the following:

• relate

• history

• extract

### Step 5 -> Relate

Relate allows users to view relationships between data points. This mantra allows users to further explore networks or maps that help in determining the further course of actions. We can demonstrate this using a simple blood transfusion dataset which tells us the blood transfusion capability between different blood groups. We first plot the network diagram. Each arrow head in this indicates a valid blood transfusion relation.

*8/27/2021: Setting eval=FALSE for the following code chunk since geomnet is currently not on CRAN and thus preventing GA from rendering the book.*


```r
library(GGally)
library(network)
library(ggnetwork)
library(geomnet)
data(blood, package = "geomnet")

# plot with ggnet2 (Figure 2a)
ggplot(data = blood$edges, aes(from_id = from, to_id = to)) +
  geom_net(colour = "darkred", layout.alg = "circle", labelon = TRUE, size = 12, directed = TRUE, vjust = 0.6, labelcolour = "grey80", arrowsize = 1, linewidth = 0.5, arrowgap = 0.02,  selfloops = TRUE, ecolour = "Blue") +theme_net() + ggtitle("Relationship between Blood Types") + theme(plot.title = element_text(hjust = 0.5))
```



### Step 6 -> History

This mantra enables the developer to create a history of user actions in order to let the user undo or redo any action taken while visualizing the data. This works on the assumption that the user is bound to make mistake or the desired goal of an activity is not obtained in the first attempt. Hence it is always desirable to give the user flexibility to undo or redo the necessary steps. Since it is difficult to demonstrate this in the form of an RMD we shall skip this mantra.

### Step 7 -> Extract

This mantra allows users to visualize a part of the graph in order to focus only on the data that is necessary for immediate use. 

In the below example we plot a graph showing effectiveness vs dose of phase 1 and phase 2 trials of a very small sample set. On hovering over the bar graphs we can hide/un-hide the necessary/unnecessary data. This is a good way to extract insights without getting hindered from data not required.


```r
library(highcharter)
df <- data.frame(dose=c(0.5, 1, 2),
                effectiveness=c(4.2, 10, 29.5))
df2 <- data.frame(supp=rep(c("Phase 1", "Phase 2"), each=3),
                dose=rep(c(0.5, 1, 2),2),
                effectiveness=c(6.8, 15, 33, 4.2, 10, 29.5))

hc <- df2 %>% 
  hchart('column', hcaes(x = 'dose', y = 'effectiveness', group = 'supp'))%>% hc_title( text = "<i>Effectiveness vs dose of phase 1 and phase 2 trials</i>",margin = 20,align = "left",style = list(useHTML = TRUE))
hc
```

```{=html}
<div id="htmlwidget-05b2ce4baf53678c8c03" style="width:100%;height:500px;" class="highchart html-widget"></div>
<script type="application/json" data-for="htmlwidget-05b2ce4baf53678c8c03">{"x":{"hc_opts":{"chart":{"reflow":true},"title":{"text":"<i>Effectiveness vs dose of phase 1 and phase 2 trials<\/i>","margin":20,"align":"left","style":{"useHTML":true}},"yAxis":{"title":{"text":"effectiveness"},"type":"linear"},"credits":{"enabled":false},"exporting":{"enabled":false},"boost":{"enabled":false},"plotOptions":{"series":{"label":{"enabled":false},"turboThreshold":0,"showInLegend":true},"treemap":{"layoutAlgorithm":"squarified"},"scatter":{"marker":{"symbol":"circle"}}},"series":[{"name":"Phase 1","data":[{"supp":"Phase 1","dose":0.5,"effectiveness":6.8,"x":0.5,"y":6.8},{"supp":"Phase 1","dose":1,"effectiveness":15,"x":1,"y":15},{"supp":"Phase 1","dose":2,"effectiveness":33,"x":2,"y":33}],"type":"column"},{"name":"Phase 2","data":[{"supp":"Phase 2","dose":0.5,"effectiveness":4.2,"x":0.5,"y":4.2},{"supp":"Phase 2","dose":1,"effectiveness":10,"x":1,"y":10},{"supp":"Phase 2","dose":2,"effectiveness":29.5,"x":2,"y":29.5}],"type":"column"}],"xAxis":{"type":"linear","title":{"text":"dose"},"categories":null}},"theme":{"chart":{"backgroundColor":"transparent"},"colors":["#7cb5ec","#434348","#90ed7d","#f7a35c","#8085e9","#f15c80","#e4d354","#2b908f","#f45b5b","#91e8e1"]},"conf_opts":{"global":{"Date":null,"VMLRadialGradientURL":"http =//code.highcharts.com/list(version)/gfx/vml-radial-gradient.png","canvasToolsURL":"http =//code.highcharts.com/list(version)/modules/canvas-tools.js","getTimezoneOffset":null,"timezoneOffset":0,"useUTC":true},"lang":{"contextButtonTitle":"Chart context menu","decimalPoint":".","downloadJPEG":"Download JPEG image","downloadPDF":"Download PDF document","downloadPNG":"Download PNG image","downloadSVG":"Download SVG vector image","drillUpText":"Back to {series.name}","invalidDate":null,"loading":"Loading...","months":["January","February","March","April","May","June","July","August","September","October","November","December"],"noData":"No data to display","numericSymbols":["k","M","G","T","P","E"],"printChart":"Print chart","resetZoom":"Reset zoom","resetZoomTitle":"Reset zoom level 1:1","shortMonths":["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"],"thousandsSep":" ","weekdays":["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"]}},"type":"chart","fonts":[],"debug":false},"evals":[],"jsHooks":[]}</script>
```


## References:

[1] https://medium.com/multiple-views-visualization-research-explained/the-purpose-of-visualization-is-insight-not-pictures-an-interview-with-visualization-pioneer-ben-beb15b2d8e9b

[2]
 Lyn Bartram, Abhisekh Patra, and Maureen Stone. 2017. Affective Color in Visualization. In Proceedings of the 2017 CHI Conference on Human Factors in Computing Systems (CHI '17). Association for Computing Machinery, New York, NY, USA, 1364–1374. DOI:https://doi.org/10.1145/3025453.3026041

[3]
 B. Shneiderman, "The eyes have it: a task by data type taxonomy for information visualizations," Proceedings 1996 IEEE Symposium on Visual Languages, Boulder, CO, USA, 1996, pp. 336-343, doi: 10.1109/VL.1996.545307.

