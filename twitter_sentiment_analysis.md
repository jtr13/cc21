# Twitter sentiment analysis in R

Shivani Modi and Sriram Dommeti

## Loading all the required R libraries


```r
library(twitteR)
library(ROAuth)
library(hms)
library(lubridate) 
library(tidytext)
library(tm)
library(wordcloud)
library(igraph)
library(glue)
library(networkD3)
library(rtweet)
library(plyr)
library(stringr)
library(ggplot2)
library(ggeasy)
library(plotly)
library(dplyr)  
library(hms)
library(lubridate) 
library(magrittr)
library(tidyverse)
library(janeaustenr)
library(widyr)
```

## Sentiment Analysis

Sentiment analysis gives us insight into the things that automate mining of attitudes, opinions, views and emotions from text, speech, tweets and database sources. However, to fully explore the possibilities of this text analysis technique, we need data visualization tools to help organize the results. Visually representing the content of a text document is one of the most important tasks in the field of text mining. 

However, there are some gaps between visualizing unstructured (text) data and structured data. Many text visualizations do not represent the text directly, they represent an output of a language model. In this post, we will use tweets extracted using Twitter API, store tweets as text data, classify opinions in text into categories like positive, or negative or neutral, create a function to calculate the score of each type of opinion in the text and try to explore and visualize as much as we can, using R libraries. 

Tweets can be imported into R using Twitter API, then the text data has to be cleaned before analysis, for example removing emoticons, removing URLs, etc.

## Twitter authorization to extract tweets:

As a first step, we need to get authorized credentials from Twitter to use the API for extracting the tweets. Steps involve creating a Twitter developer account, creating an app and then we have necessary credentials. Reference for obtaining access tokens:

https://cran.r-project.org/web/packages/rtweet/vignettes/auth.html


```r
#Note: Replace below with your credentials following above reference
api_key <- "xxxxxxxxxxxxxxxxxxxxxxxxx"
api_secret <- "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
access_token <- "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
access_token_secret <- "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
#Note: This will ask us permission for direct authentication, type '1' for yes:
setup_twitter_oauth(api_key,api_secret,access_token,access_token_secret)
```


```
## [1] "Using direct authentication"
```

## Extracting Global Warming tweets:


```r
# extracting 4000 tweets related to global warming topic
tweets <- searchTwitter("#globalwarming", n=4000, lang="en")
n.tweet <- length(tweets)

# convert tweets to a data frame
tweets.df <- twListToDF(tweets)

tweets.txt <- sapply(tweets, function(t)t$getText())
# Ignore graphical Parameters to avoid input errors
tweets.txt <- str_replace_all(tweets.txt,"[^[:graph:]]", " ")

## pre-processing text:
clean.text = function(x)
{
  # convert to lower case
  x = tolower(x)
  # remove rt
  x = gsub("rt", "", x)
  # remove at
  x = gsub("@\\w+", "", x)
  # remove punctuation
  x = gsub("[[:punct:]]", "", x)
  # remove numbers
  x = gsub("[[:digit:]]", "", x)
  # remove links http
  x = gsub("http\\w+", "", x)
  # remove tabs
  x = gsub("[ |\t]{2,}", "", x)
  # remove blank spaces at the beginning
  x = gsub("^ ", "", x)
  # remove blank spaces at the end
  x = gsub(" $", "", x)
  # some other cleaning text
  x = gsub('https://','',x)
  x = gsub('http://','',x)
  x = gsub('[^[:graph:]]', ' ',x)
  x = gsub('[[:punct:]]', '', x)
  x = gsub('[[:cntrl:]]', '', x)
  x = gsub('\\d+', '', x)
  x = str_replace_all(x,"[^[:graph:]]", " ")
  return(x)
}

cleanText <- clean.text(tweets.txt)
# remove empty results (if any)
idx <- which(cleanText == " ")
cleanText <- cleanText[cleanText != " "]
```

## Frequency of Tweets


```r
tweets.df %<>% 
  mutate(
    created = created %>% 
      # Remove zeros.
      str_remove_all(pattern = '\\+0000') %>%
      # Parse date.
      parse_date_time(orders = '%y-%m-%d %H%M%S')
  )

tweets.df %<>% 
  mutate(Created_At_Round = created%>% round(units = 'hours') %>% as.POSIXct())

tweets.df %>% pull(created) %>% min()
```

```
## [1] "2021-03-20 14:55:43 UTC"
```

```r
tweets.df %>% pull(created) %>% max()
```

```
## [1] "2021-03-26 06:34:05 UTC"
```

```r
plt <- tweets.df %>% 
  dplyr::count(Created_At_Round) %>% 
  ggplot(mapping = aes(x = Created_At_Round, y = n)) +
  theme_light() +
  geom_line() +
  xlab(label = 'Date') +
  ylab(label = NULL) +
  ggtitle(label = 'Number of Tweets per Hour')

plt %>% ggplotly()
```

```{=html}
<div id="htmlwidget-c4cc1b0c22704a7b3371" style="width:672px;height:480px;" class="plotly html-widget"></div>
<script type="application/json" data-for="htmlwidget-c4cc1b0c22704a7b3371">{"x":{"data":[{"x":[1616252400,1616256000,1616259600,1616263200,1616266800,1616270400,1616274000,1616277600,1616281200,1616284800,1616288400,1616292000,1616295600,1616299200,1616302800,1616306400,1616310000,1616313600,1616317200,1616320800,1616324400,1616328000,1616331600,1616335200,1616338800,1616342400,1616346000,1616349600,1616353200,1616356800,1616360400,1616364000,1616367600,1616371200,1616374800,1616378400,1616382000,1616385600,1616389200,1616392800,1616396400,1616400000,1616403600,1616407200,1616410800,1616414400,1616418000,1616421600,1616425200,1616428800,1616432400,1616436000,1616439600,1616443200,1616446800,1616450400,1616454000,1616457600,1616461200,1616464800,1616468400,1616472000,1616475600,1616479200,1616482800,1616486400,1616490000,1616493600,1616497200,1616500800,1616504400,1616508000,1616511600,1616515200,1616518800,1616522400,1616526000,1616529600,1616533200,1616536800,1616540400,1616544000,1616547600,1616551200,1616554800,1616558400,1616562000,1616565600,1616569200,1616572800,1616576400,1616580000,1616583600,1616587200,1616590800,1616594400,1616598000,1616601600,1616605200,1616608800,1616612400,1616616000,1616619600,1616623200,1616626800,1616630400,1616634000,1616637600,1616641200,1616644800,1616648400,1616652000,1616655600,1616659200,1616662800,1616666400,1616670000,1616673600,1616677200,1616680800,1616684400,1616688000,1616691600,1616695200,1616698800,1616702400,1616706000,1616709600,1616713200,1616716800,1616720400,1616724000,1616727600,1616731200,1616734800,1616738400,1616742000],"y":[26,38,46,22,35,21,27,22,32,15,18,17,14,19,16,14,18,29,25,27,19,32,28,45,32,38,33,33,32,20,16,8,17,9,22,14,12,26,28,59,36,35,28,36,36,29,32,25,30,36,21,34,20,21,41,20,30,22,15,23,22,62,31,29,26,35,27,55,40,45,41,67,31,38,41,46,42,37,46,38,29,17,15,11,20,23,16,22,22,21,19,31,33,27,34,28,40,40,38,54,26,49,30,43,23,12,20,27,26,25,20,29,24,33,34,37,20,24,30,41,36,30,42,43,61,31,29,39,39,51,26,17,14,26,7,21,2],"text":["Created_At_Round: 2021-03-20 15:00:00<br />n: 26","Created_At_Round: 2021-03-20 16:00:00<br />n: 38","Created_At_Round: 2021-03-20 17:00:00<br />n: 46","Created_At_Round: 2021-03-20 18:00:00<br />n: 22","Created_At_Round: 2021-03-20 19:00:00<br />n: 35","Created_At_Round: 2021-03-20 20:00:00<br />n: 21","Created_At_Round: 2021-03-20 21:00:00<br />n: 27","Created_At_Round: 2021-03-20 22:00:00<br />n: 22","Created_At_Round: 2021-03-20 23:00:00<br />n: 32","Created_At_Round: 2021-03-21 00:00:00<br />n: 15","Created_At_Round: 2021-03-21 01:00:00<br />n: 18","Created_At_Round: 2021-03-21 02:00:00<br />n: 17","Created_At_Round: 2021-03-21 03:00:00<br />n: 14","Created_At_Round: 2021-03-21 04:00:00<br />n: 19","Created_At_Round: 2021-03-21 05:00:00<br />n: 16","Created_At_Round: 2021-03-21 06:00:00<br />n: 14","Created_At_Round: 2021-03-21 07:00:00<br />n: 18","Created_At_Round: 2021-03-21 08:00:00<br />n: 29","Created_At_Round: 2021-03-21 09:00:00<br />n: 25","Created_At_Round: 2021-03-21 10:00:00<br />n: 27","Created_At_Round: 2021-03-21 11:00:00<br />n: 19","Created_At_Round: 2021-03-21 12:00:00<br />n: 32","Created_At_Round: 2021-03-21 13:00:00<br />n: 28","Created_At_Round: 2021-03-21 14:00:00<br />n: 45","Created_At_Round: 2021-03-21 15:00:00<br />n: 32","Created_At_Round: 2021-03-21 16:00:00<br />n: 38","Created_At_Round: 2021-03-21 17:00:00<br />n: 33","Created_At_Round: 2021-03-21 18:00:00<br />n: 33","Created_At_Round: 2021-03-21 19:00:00<br />n: 32","Created_At_Round: 2021-03-21 20:00:00<br />n: 20","Created_At_Round: 2021-03-21 21:00:00<br />n: 16","Created_At_Round: 2021-03-21 22:00:00<br />n:  8","Created_At_Round: 2021-03-21 23:00:00<br />n: 17","Created_At_Round: 2021-03-22 00:00:00<br />n:  9","Created_At_Round: 2021-03-22 01:00:00<br />n: 22","Created_At_Round: 2021-03-22 02:00:00<br />n: 14","Created_At_Round: 2021-03-22 03:00:00<br />n: 12","Created_At_Round: 2021-03-22 04:00:00<br />n: 26","Created_At_Round: 2021-03-22 05:00:00<br />n: 28","Created_At_Round: 2021-03-22 06:00:00<br />n: 59","Created_At_Round: 2021-03-22 07:00:00<br />n: 36","Created_At_Round: 2021-03-22 08:00:00<br />n: 35","Created_At_Round: 2021-03-22 09:00:00<br />n: 28","Created_At_Round: 2021-03-22 10:00:00<br />n: 36","Created_At_Round: 2021-03-22 11:00:00<br />n: 36","Created_At_Round: 2021-03-22 12:00:00<br />n: 29","Created_At_Round: 2021-03-22 13:00:00<br />n: 32","Created_At_Round: 2021-03-22 14:00:00<br />n: 25","Created_At_Round: 2021-03-22 15:00:00<br />n: 30","Created_At_Round: 2021-03-22 16:00:00<br />n: 36","Created_At_Round: 2021-03-22 17:00:00<br />n: 21","Created_At_Round: 2021-03-22 18:00:00<br />n: 34","Created_At_Round: 2021-03-22 19:00:00<br />n: 20","Created_At_Round: 2021-03-22 20:00:00<br />n: 21","Created_At_Round: 2021-03-22 21:00:00<br />n: 41","Created_At_Round: 2021-03-22 22:00:00<br />n: 20","Created_At_Round: 2021-03-22 23:00:00<br />n: 30","Created_At_Round: 2021-03-23 00:00:00<br />n: 22","Created_At_Round: 2021-03-23 01:00:00<br />n: 15","Created_At_Round: 2021-03-23 02:00:00<br />n: 23","Created_At_Round: 2021-03-23 03:00:00<br />n: 22","Created_At_Round: 2021-03-23 04:00:00<br />n: 62","Created_At_Round: 2021-03-23 05:00:00<br />n: 31","Created_At_Round: 2021-03-23 06:00:00<br />n: 29","Created_At_Round: 2021-03-23 07:00:00<br />n: 26","Created_At_Round: 2021-03-23 08:00:00<br />n: 35","Created_At_Round: 2021-03-23 09:00:00<br />n: 27","Created_At_Round: 2021-03-23 10:00:00<br />n: 55","Created_At_Round: 2021-03-23 11:00:00<br />n: 40","Created_At_Round: 2021-03-23 12:00:00<br />n: 45","Created_At_Round: 2021-03-23 13:00:00<br />n: 41","Created_At_Round: 2021-03-23 14:00:00<br />n: 67","Created_At_Round: 2021-03-23 15:00:00<br />n: 31","Created_At_Round: 2021-03-23 16:00:00<br />n: 38","Created_At_Round: 2021-03-23 17:00:00<br />n: 41","Created_At_Round: 2021-03-23 18:00:00<br />n: 46","Created_At_Round: 2021-03-23 19:00:00<br />n: 42","Created_At_Round: 2021-03-23 20:00:00<br />n: 37","Created_At_Round: 2021-03-23 21:00:00<br />n: 46","Created_At_Round: 2021-03-23 22:00:00<br />n: 38","Created_At_Round: 2021-03-23 23:00:00<br />n: 29","Created_At_Round: 2021-03-24 00:00:00<br />n: 17","Created_At_Round: 2021-03-24 01:00:00<br />n: 15","Created_At_Round: 2021-03-24 02:00:00<br />n: 11","Created_At_Round: 2021-03-24 03:00:00<br />n: 20","Created_At_Round: 2021-03-24 04:00:00<br />n: 23","Created_At_Round: 2021-03-24 05:00:00<br />n: 16","Created_At_Round: 2021-03-24 06:00:00<br />n: 22","Created_At_Round: 2021-03-24 07:00:00<br />n: 22","Created_At_Round: 2021-03-24 08:00:00<br />n: 21","Created_At_Round: 2021-03-24 09:00:00<br />n: 19","Created_At_Round: 2021-03-24 10:00:00<br />n: 31","Created_At_Round: 2021-03-24 11:00:00<br />n: 33","Created_At_Round: 2021-03-24 12:00:00<br />n: 27","Created_At_Round: 2021-03-24 13:00:00<br />n: 34","Created_At_Round: 2021-03-24 14:00:00<br />n: 28","Created_At_Round: 2021-03-24 15:00:00<br />n: 40","Created_At_Round: 2021-03-24 16:00:00<br />n: 40","Created_At_Round: 2021-03-24 17:00:00<br />n: 38","Created_At_Round: 2021-03-24 18:00:00<br />n: 54","Created_At_Round: 2021-03-24 19:00:00<br />n: 26","Created_At_Round: 2021-03-24 20:00:00<br />n: 49","Created_At_Round: 2021-03-24 21:00:00<br />n: 30","Created_At_Round: 2021-03-24 22:00:00<br />n: 43","Created_At_Round: 2021-03-24 23:00:00<br />n: 23","Created_At_Round: 2021-03-25 00:00:00<br />n: 12","Created_At_Round: 2021-03-25 01:00:00<br />n: 20","Created_At_Round: 2021-03-25 02:00:00<br />n: 27","Created_At_Round: 2021-03-25 03:00:00<br />n: 26","Created_At_Round: 2021-03-25 04:00:00<br />n: 25","Created_At_Round: 2021-03-25 05:00:00<br />n: 20","Created_At_Round: 2021-03-25 06:00:00<br />n: 29","Created_At_Round: 2021-03-25 07:00:00<br />n: 24","Created_At_Round: 2021-03-25 08:00:00<br />n: 33","Created_At_Round: 2021-03-25 09:00:00<br />n: 34","Created_At_Round: 2021-03-25 10:00:00<br />n: 37","Created_At_Round: 2021-03-25 11:00:00<br />n: 20","Created_At_Round: 2021-03-25 12:00:00<br />n: 24","Created_At_Round: 2021-03-25 13:00:00<br />n: 30","Created_At_Round: 2021-03-25 14:00:00<br />n: 41","Created_At_Round: 2021-03-25 15:00:00<br />n: 36","Created_At_Round: 2021-03-25 16:00:00<br />n: 30","Created_At_Round: 2021-03-25 17:00:00<br />n: 42","Created_At_Round: 2021-03-25 18:00:00<br />n: 43","Created_At_Round: 2021-03-25 19:00:00<br />n: 61","Created_At_Round: 2021-03-25 20:00:00<br />n: 31","Created_At_Round: 2021-03-25 21:00:00<br />n: 29","Created_At_Round: 2021-03-25 22:00:00<br />n: 39","Created_At_Round: 2021-03-25 23:00:00<br />n: 39","Created_At_Round: 2021-03-26 00:00:00<br />n: 51","Created_At_Round: 2021-03-26 01:00:00<br />n: 26","Created_At_Round: 2021-03-26 02:00:00<br />n: 17","Created_At_Round: 2021-03-26 03:00:00<br />n: 14","Created_At_Round: 2021-03-26 04:00:00<br />n: 26","Created_At_Round: 2021-03-26 05:00:00<br />n:  7","Created_At_Round: 2021-03-26 06:00:00<br />n: 21","Created_At_Round: 2021-03-26 07:00:00<br />n:  2"],"type":"scatter","mode":"lines","line":{"width":1.88976377952756,"color":"rgba(0,0,0,1)","dash":"solid"},"hoveron":"points","showlegend":false,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null}],"layout":{"margin":{"t":43.7625570776256,"r":7.30593607305936,"b":40.1826484018265,"l":22.648401826484},"plot_bgcolor":"rgba(255,255,255,1)","paper_bgcolor":"rgba(255,255,255,1)","font":{"color":"rgba(0,0,0,1)","family":"","size":14.6118721461187},"title":{"text":"Number of Tweets per Hour","font":{"color":"rgba(0,0,0,1)","family":"","size":17.5342465753425},"x":0,"xref":"paper"},"xaxis":{"domain":[0,1],"automargin":true,"type":"linear","autorange":false,"range":[1616227920,1616766480],"tickmode":"array","ticktext":["Mar 22","Mar 24","Mar 26"],"tickvals":[1616371200,1616544000,1616716800],"categoryorder":"array","categoryarray":["Mar 22","Mar 24","Mar 26"],"nticks":null,"ticks":"outside","tickcolor":"rgba(179,179,179,1)","ticklen":3.65296803652968,"tickwidth":0.33208800332088,"showticklabels":true,"tickfont":{"color":"rgba(77,77,77,1)","family":"","size":11.689497716895},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"gridcolor":"rgba(222,222,222,1)","gridwidth":0.33208800332088,"zeroline":false,"anchor":"y","title":{"text":"Date","font":{"color":"rgba(0,0,0,1)","family":"","size":14.6118721461187}},"hoverformat":".2f"},"yaxis":{"domain":[0,1],"automargin":true,"type":"linear","autorange":false,"range":[-1.25,70.25],"tickmode":"array","ticktext":["0","20","40","60"],"tickvals":[0,20,40,60],"categoryorder":"array","categoryarray":["0","20","40","60"],"nticks":null,"ticks":"outside","tickcolor":"rgba(179,179,179,1)","ticklen":3.65296803652968,"tickwidth":0.33208800332088,"showticklabels":true,"tickfont":{"color":"rgba(77,77,77,1)","family":"","size":11.689497716895},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"gridcolor":"rgba(222,222,222,1)","gridwidth":0.33208800332088,"zeroline":false,"anchor":"x","title":{"text":"","font":{"color":"rgba(0,0,0,1)","family":"","size":14.6118721461187}},"hoverformat":".2f"},"shapes":[{"type":"rect","fillcolor":"transparent","line":{"color":"rgba(179,179,179,1)","width":0.66417600664176,"linetype":"solid"},"yref":"paper","xref":"paper","x0":0,"x1":1,"y0":0,"y1":1}],"showlegend":false,"legend":{"bgcolor":"rgba(255,255,255,1)","bordercolor":"transparent","borderwidth":1.88976377952756,"font":{"color":"rgba(0,0,0,1)","family":"","size":11.689497716895}},"hovermode":"closest","barmode":"relative"},"config":{"doubleClick":"reset","showSendToCloud":false},"source":"A","attrs":{"52106b654c5e":{"x":{},"y":{},"type":"scatter"}},"cur_data":"52106b654c5e","visdat":{"52106b654c5e":["function (y) ","x"]},"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.2,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>
```

## Estimating Sentiment Score

There are many resources describing methods to estimate sentiment. For the purpose of this tutorial, we will use a very simple algorithm which assigns sentiment score of the text by simply counting the number of occurrences of "positive" and "negative" words in a tweet.

Hu & Liu have published an "Opinion Lexicon" that categorizes approximately 6,800 words as positive or negative, which can be downloaded from this link:

http://www.cs.uic.edu/~liub/FBS/sentiment-analysis.html

### Loading sentiment word lists:


```r
positive = scan('resources/twitter_sentiment_analysis/positive-words.txt', what = 'character', comment.char = ';')
negative = scan('resources/twitter_sentiment_analysis/negative-words.txt', what = 'character', comment.char = ';')
# add your list of words below as you wish if missing in above read lists
pos.words = c(positive,'upgrade','Congrats','prizes','prize','thanks','thnx',
              'Grt','gr8','plz','trending','recovering','brainstorm','leader')
neg.words = c(negative,'wtf','wait','waiting','epicfail','Fight','fighting',
              'arrest','no','not')
```

### Sentiment scoring function:


```r
score.sentiment = function(sentences, pos.words, neg.words, .progress='none')
{
  require(plyr)
  require(stringr)
  
  # we are giving vector of sentences as input. 
  # plyr will handle a list or a vector as an "l" for us
  # we want a simple array of scores back, so we use "l" + "a" + "ply" = laply:
  scores = laply(sentences, function(sentence, pos.words, neg.words) {
    
    # clean up sentences with R's regex-driven global substitute, gsub() function:
    sentence = gsub('https://','',sentence)
    sentence = gsub('http://','',sentence)
    sentence = gsub('[^[:graph:]]', ' ',sentence)
    sentence = gsub('[[:punct:]]', '', sentence)
    sentence = gsub('[[:cntrl:]]', '', sentence)
    sentence = gsub('\\d+', '', sentence)
    sentence = str_replace_all(sentence,"[^[:graph:]]", " ")
    # and convert to lower case:
    sentence = tolower(sentence)
    
    # split into words. str_split is in the stringr package
    word.list = str_split(sentence, '\\s+')
    # sometimes a list() is one level of hierarchy too much
    words = unlist(word.list)
    
    # compare our words to the dictionaries of positive & negative terms
    pos.matches = match(words, pos.words)
    neg.matches = match(words, neg.words)
    
    # match() returns the position of the matched term or NA
    # we just want a TRUE/FALSE:
    pos.matches = !is.na(pos.matches)
    neg.matches = !is.na(neg.matches)
    
    # TRUE/FALSE will be treated as 1/0 by sum():
    score = sum(pos.matches) - sum(neg.matches)
    
    return(score)
  }, pos.words, neg.words, .progress=.progress )
  
  scores.df = data.frame(score=scores, text=sentences)
  return(scores.df)
}
```

### Calculating the sentiment score:


```r
analysis <- score.sentiment(cleanText, pos.words, neg.words)
# sentiment score frequency table
table(analysis$score)
```

```
## 
##   -5   -4   -3   -2   -1    0    1    2    3    4 
##    2   14   81  191  591 2259  674  128   52    8
```

## Histogram of sentiment scores:


```r
analysis %>%
  ggplot(aes(x=score)) + 
  geom_histogram(binwidth = 1, fill = "lightblue")+ 
  ylab("Frequency") + 
  xlab("sentiment score") +
  ggtitle("Distribution of Sentiment scores of the tweets") +
  ggeasy::easy_center_title()
```

<img src="twitter_sentiment_analysis_files/figure-html/unnamed-chunk-9-1.png" width="672" style="display: block; margin: auto;" />

***Analysis:*** From the Histogram of Sentiment scores, we can see that around half of the tweets have sentiment score as zero i.e. Neutral and overall as expected, the distribution depicts negative sentiment in the tweets related to global warming, since it is a major issue of concern.

## Barplot of sentiment type:


```r
neutral <- length(which(analysis$score == 0))
positive <- length(which(analysis$score > 0))
negative <- length(which(analysis$score < 0))
Sentiment <- c("Positive","Neutral","Negative")
Count <- c(positive,neutral,negative)
output <- data.frame(Sentiment,Count)
output$Sentiment<-factor(output$Sentiment,levels=Sentiment)
ggplot(output, aes(x=Sentiment,y=Count))+
  geom_bar(stat = "identity", aes(fill = Sentiment))+
  ggtitle("Barplot of Sentiment type of 4000 tweets")
```

<img src="twitter_sentiment_analysis_files/figure-html/unnamed-chunk-10-1.png" width="672" style="display: block; margin: auto;" />

***Analysis:*** It is also clear from this barplot of sentiment type that around half of the tweets have sentiment score as zero i.e. Neutral and there are more negative sentiment tweets than that of positive sentiment. This barplot helps us to identify overall opinion of the people about global warming.

## Wordcloud:


```r
text_corpus <- Corpus(VectorSource(cleanText))
text_corpus <- tm_map(text_corpus, content_transformer(tolower))
text_corpus <- tm_map(text_corpus, function(x)removeWords(x,stopwords("english")))
text_corpus <- tm_map(text_corpus, removeWords, c("global","globalwarming"))
tdm <- TermDocumentMatrix(text_corpus)
tdm <- as.matrix(tdm)
tdm <- sort(rowSums(tdm), decreasing = TRUE)
tdm <- data.frame(word = names(tdm), freq = tdm)
set.seed(123)
wordcloud(text_corpus, min.freq = 1, max.words = 100, scale = c(2.2,1),
          colors=brewer.pal(8, "Dark2"), random.color = T, random.order = F)
```

<img src="twitter_sentiment_analysis_files/figure-html/unnamed-chunk-11-1.png" width="672" style="display: block; margin: auto;" />

***Analysis:*** Wordcloud helps us to visually understand the important terms frequently used in the tweets related to global warming, here for example, "climate change", "environmental", "temperature", "emissions", etc.

## Word Frequency plot:


```r
ggplot(tdm[1:20,], aes(x=reorder(word, freq), y=freq)) + 
  geom_bar(stat="identity") +
  xlab("Terms") + 
  ylab("Count") + 
  coord_flip() +
  theme(axis.text=element_text(size=7)) +
  ggtitle('Most common word frequency plot') +
  ggeasy::easy_center_title()
```

<img src="twitter_sentiment_analysis_files/figure-html/unnamed-chunk-12-1.png" width="672" style="display: block; margin: auto;" />

***Analysis:*** we can infer that the most frequently used terms in the tweets related to global warming are, "climate", "climatechange", "since", "biggest", "hoax", etc.

## Network Analysis

We are using a weighted network (graph) to describe how to encode and visualize text data. In this section we are counting pairwise relative occurrence of words.

### Bigram analysis and Network definition

Bigram counts pairwise occurrences of words which appear together in the text.


```r
#bigram
bi.gram.words <- tweets.df %>% 
  unnest_tokens(
    input = text, 
    output = bigram, 
    token = 'ngrams', 
    n = 2
  ) %>% 
  filter(! is.na(bigram))

bi.gram.words %>% 
  select(bigram) %>% 
  head(10)
```

```
##                 bigram
## 1     rt wemeantoclean
## 2  wemeantoclean we're
## 3      we're expanding
## 4        expanding our
## 5          our nursery
## 6           nursery of
## 7        of nativetree
## 8      nativetree with
## 9           with reuse
## 10            reuse of
```

```r
extra.stop.words <- c('https')
stopwords.df <- tibble(
  word = c(stopwords(kind = 'es'),
           stopwords(kind = 'en'),
           extra.stop.words)
)
```

Next, we filter for stop words and remove white spaces.


```r
bi.gram.words %<>% 
  separate(col = bigram, into = c('word1', 'word2'), sep = ' ') %>% 
  filter(! word1 %in% stopwords.df$word) %>% 
  filter(! word2 %in% stopwords.df$word) %>% 
  filter(! is.na(word1)) %>% 
  filter(! is.na(word2)) 
```

Finally, we group and count by bigram.


```r
bi.gram.count <- bi.gram.words %>% 
  dplyr::count(word1, word2, sort = TRUE) %>% 
  dplyr::rename(weight = n)

bi.gram.count %>% head()
```

```
##           word1         word2 weight
## 1 globalwarming           amp    439
## 2          stop globalwarming    418
## 3         wants             2    416
## 4             2          help    415
## 5           amp   destruction    415
## 6         earth         wants    415
```

Let us plot the distribution of the weightvalues:


```r
bi.gram.count %>% 
  ggplot(mapping = aes(x = weight)) +
  theme_light() +
  geom_histogram() +
  labs(title = "Bigram Weight Distribution")
```

<img src="twitter_sentiment_analysis_files/figure-html/unnamed-chunk-16-1.png" width="672" style="display: block; margin: auto;" />

Note that it is very skewed, for visualization purposes it might be a good idea to perform a transformation, eg log transform:


```r
bi.gram.count %>% 
  mutate(weight = log(weight + 1)) %>% 
  ggplot(mapping = aes(x = weight)) +
  theme_light() +
  geom_histogram() +
  labs(title = "Bigram log-Weight Distribution")
```

<img src="twitter_sentiment_analysis_files/figure-html/unnamed-chunk-17-1.png" width="672" style="display: block; margin: auto;" />

In order to define weighted network from a bigram count we used the following structure.

* Each word is going to represent a node.
* Two words are going to be connected if they appear as a bigram.
* The weight of an edge is the number of times the bigram appears in the corpus.

### Network visualization


```r
threshold <- 50

# For visualization purposes we scale by a global factor. 
ScaleWeight <- function(x, lambda) {
  x / lambda
}

network <-  bi.gram.count %>%
  filter(weight > threshold) %>%
  mutate(weight = ScaleWeight(x = weight, lambda = 2E3)) %>% 
  graph_from_data_frame(directed = FALSE)

plot(
  network, 
  vertex.size = 1,
  vertex.label.color = 'black', 
  vertex.label.cex = 0.7, 
  vertex.label.dist = 1,
  edge.color = 'gray', 
  main = 'Bigram Count Network', 
  sub = glue('Weight Threshold: {threshold}'), 
  alpha = 50
)
```

<img src="twitter_sentiment_analysis_files/figure-html/unnamed-chunk-18-1.png" width="672" style="display: block; margin: auto;" />

We can even improvise the representation by setting the sizes of the nodes and the edges by the degree and weight respectively.


```r
V(network)$degree <- strength(graph = network)

# Compute the weight shares.
E(network)$width <- E(network)$weight/max(E(network)$weight)

plot(
  network, 
  vertex.color = 'lightblue',
  # Scale node size by degree.
  vertex.size = 2*V(network)$degree,
  vertex.label.color = 'black', 
  vertex.label.cex = 0.6, 
  vertex.label.dist = 1.6,
  edge.color = 'gray', 
  # Set edge width proportional to the weight relative value.
  edge.width = 3*E(network)$width ,
  main = 'Bigram Count Network', 
  sub = glue('Weight Threshold: {threshold}'), 
  alpha = 50
)
```

<img src="twitter_sentiment_analysis_files/figure-html/unnamed-chunk-19-1.png" width="672" style="display: block; margin: auto;" />

We can go a step further and make our visualization more dynamic using the networkD3 library.


```r
threshold <- 50

network <-  bi.gram.count %>%
  filter(weight > threshold) %>%
  graph_from_data_frame(directed = FALSE)

# Store the degree.
V(network)$degree <- strength(graph = network)
# Compute the weight shares.
E(network)$width <- E(network)$weight/max(E(network)$weight)

# Create networkD3 object.
network.D3 <- igraph_to_networkD3(g = network)
# Define node size.
network.D3$nodes %<>% mutate(Degree = (1E-2)*V(network)$degree)
# Define color group
network.D3$nodes %<>% mutate(Group = 1)
# Define edges width. 
network.D3$links$Width <- 10*E(network)$width

forceNetwork(
  Links = network.D3$links, 
  Nodes = network.D3$nodes, 
  Source = 'source', 
  Target = 'target',
  NodeID = 'name',
  Group = 'Group', 
  opacity = 0.9,
  Value = 'Width',
  Nodesize = 'Degree', 
  # We input a JavaScript function.
  linkWidth = JS("function(d) { return Math.sqrt(d.value); }"), 
  fontSize = 12,
  zoom = TRUE, 
  opacityNoHover = 1
)
```

```{=html}
<div id="htmlwidget-57a14fbebeb2914fcf39" style="width:672px;height:480px;" class="forceNetwork html-widget"></div>
<script type="application/json" data-for="htmlwidget-57a14fbebeb2914fcf39">{"x":{"links":{"source":[18,2,12,12,0,19,13,12,22,0,0,18,15,25,4,2,10,0,3,1,19,12,8,7,24,24,7,17,11,26,21,0,8,14,15],"target":[26,3,42,41,4,20,31,32,39,23,23,37,35,40,29,5,30,28,6,6,38,34,9,9,25,25,11,36,12,27,27,1,10,33,16],"value":[10,9.52164009111617,9.47608200455581,9.45330296127563,9.45330296127563,9.45330296127563,9.45330296127563,9.38496583143508,9.31662870159453,9.31662870159453,9.31662870159453,9.29384965831435,9.29384965831435,4.96583143507973,3.8496583143508,2.98405466970387,2.48291571753986,2.09567198177677,1.84510250569476,1.77676537585421,1.68564920273349,1.64009111617312,1.64009111617312,1.64009111617312,1.64009111617312,1.64009111617312,1.43507972665148,1.43507972665148,1.43507972665148,1.43507972665148,1.36674259681093,1.36674259681093,1.29840546697039,1.27562642369021,1.18451025056948],"colour":["#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666"]},"nodes":{"name":["globalwarming","stop","wants","2","amp","earth","help","good","ethiopia","morning","tigray","nicolaademarco","rt","climate","global","water","world","sgk","approx","average","c","temperature","wemeantoclean","climatechange","home","new","1975","since","gpwx","destruction","eritrea","change","chriscartw83","warming","johnrmoffitt","day","planet","climatedata","increase","cleandelhi","design","allentien","afp"],"group":[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],"nodesize":[11.46,8.33,8.31,8.31,8.54,4.15,8.3,8.2,8.18,8.21,8.18,8.16,7.39,2.18,1.09,1.59,0.78,0.74,1.32,1.44,0.72,0.72,0.72,2.32,1.26,1.89,1.2,1.32,0.57,4.15,4.09,2.18,1.31,1.09,0.92,0.81,0.74,0.72,0.72,0.72,0.63,0.56,0.52]},"options":{"NodeID":"name","Group":"Group","colourScale":"d3.scaleOrdinal(d3.schemeCategory20);","fontSize":12,"fontFamily":"serif","clickTextSize":30,"linkDistance":50,"linkWidth":"function(d) { return Math.sqrt(d.value); }","charge":-30,"opacity":0.9,"zoom":true,"legend":false,"arrows":false,"nodesize":true,"radiusCalculation":" Math.sqrt(d.nodesize)+6","bounded":false,"opacityNoHover":1,"clickAction":null}},"evals":[],"jsHooks":[]}</script>
```

In this blog, we explored how to extract data and insights from Twitter. We presented how to clean text data and perform sentiment analysis. Secondly, we saw how pairwise word counts give information about the relations of the input text. Lastly, we studied how to use networks to represent bigram count measures.

## References:

Bing Liu, Minqing Hu and Junsheng Cheng. "Opinion Observer: Analyzing 
       and Comparing Opinions on the Web." Proceedings of the 14th 
       International World Wide Web conference (WWW-2005), May 10-14, 
       2005, Chiba, Japan.
