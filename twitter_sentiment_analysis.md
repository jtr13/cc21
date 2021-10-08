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
## [1] "2021-10-05 01:34:17 UTC"
```

```r
tweets.df %>% pull(created) %>% max()
```

```
## [1] "2021-10-08 01:25:52 UTC"
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
<div id="htmlwidget-9ac34e7dc3a6fe4357da" style="width:672px;height:480px;" class="plotly html-widget"></div>
<script type="application/json" data-for="htmlwidget-9ac34e7dc3a6fe4357da">{"x":{"data":[{"x":[1633399200,1633402800,1633406400,1633410000,1633413600,1633417200,1633420800,1633424400,1633428000,1633431600,1633435200,1633438800,1633442400,1633446000,1633449600,1633453200,1633456800,1633460400,1633464000,1633467600,1633471200,1633474800,1633478400,1633482000,1633485600,1633489200,1633492800,1633496400,1633500000,1633503600,1633507200,1633510800,1633514400,1633518000,1633521600,1633525200,1633528800,1633532400,1633536000,1633539600,1633543200,1633546800,1633550400,1633554000,1633557600,1633561200,1633564800,1633568400,1633572000,1633575600,1633579200,1633582800,1633586400,1633590000,1633593600,1633597200,1633600800,1633604400,1633608000,1633611600,1633615200,1633618800,1633622400,1633626000,1633629600,1633633200,1633636800,1633640400,1633644000,1633647600,1633651200,1633654800],"y":[18,29,48,75,59,27,54,60,59,60,58,94,102,82,122,86,77,68,95,63,58,51,38,48,50,112,59,49,76,58,43,51,48,34,28,49,85,125,62,75,61,53,77,70,41,41,40,25,14,19,24,57,30,28,39,45,23,35,29,75,128,82,67,60,35,55,27,34,78,31,27,15],"text":["Created_At_Round: 2021-10-05 02:00:00<br />n:  18","Created_At_Round: 2021-10-05 03:00:00<br />n:  29","Created_At_Round: 2021-10-05 04:00:00<br />n:  48","Created_At_Round: 2021-10-05 05:00:00<br />n:  75","Created_At_Round: 2021-10-05 06:00:00<br />n:  59","Created_At_Round: 2021-10-05 07:00:00<br />n:  27","Created_At_Round: 2021-10-05 08:00:00<br />n:  54","Created_At_Round: 2021-10-05 09:00:00<br />n:  60","Created_At_Round: 2021-10-05 10:00:00<br />n:  59","Created_At_Round: 2021-10-05 11:00:00<br />n:  60","Created_At_Round: 2021-10-05 12:00:00<br />n:  58","Created_At_Round: 2021-10-05 13:00:00<br />n:  94","Created_At_Round: 2021-10-05 14:00:00<br />n: 102","Created_At_Round: 2021-10-05 15:00:00<br />n:  82","Created_At_Round: 2021-10-05 16:00:00<br />n: 122","Created_At_Round: 2021-10-05 17:00:00<br />n:  86","Created_At_Round: 2021-10-05 18:00:00<br />n:  77","Created_At_Round: 2021-10-05 19:00:00<br />n:  68","Created_At_Round: 2021-10-05 20:00:00<br />n:  95","Created_At_Round: 2021-10-05 21:00:00<br />n:  63","Created_At_Round: 2021-10-05 22:00:00<br />n:  58","Created_At_Round: 2021-10-05 23:00:00<br />n:  51","Created_At_Round: 2021-10-06 00:00:00<br />n:  38","Created_At_Round: 2021-10-06 01:00:00<br />n:  48","Created_At_Round: 2021-10-06 02:00:00<br />n:  50","Created_At_Round: 2021-10-06 03:00:00<br />n: 112","Created_At_Round: 2021-10-06 04:00:00<br />n:  59","Created_At_Round: 2021-10-06 05:00:00<br />n:  49","Created_At_Round: 2021-10-06 06:00:00<br />n:  76","Created_At_Round: 2021-10-06 07:00:00<br />n:  58","Created_At_Round: 2021-10-06 08:00:00<br />n:  43","Created_At_Round: 2021-10-06 09:00:00<br />n:  51","Created_At_Round: 2021-10-06 10:00:00<br />n:  48","Created_At_Round: 2021-10-06 11:00:00<br />n:  34","Created_At_Round: 2021-10-06 12:00:00<br />n:  28","Created_At_Round: 2021-10-06 13:00:00<br />n:  49","Created_At_Round: 2021-10-06 14:00:00<br />n:  85","Created_At_Round: 2021-10-06 15:00:00<br />n: 125","Created_At_Round: 2021-10-06 16:00:00<br />n:  62","Created_At_Round: 2021-10-06 17:00:00<br />n:  75","Created_At_Round: 2021-10-06 18:00:00<br />n:  61","Created_At_Round: 2021-10-06 19:00:00<br />n:  53","Created_At_Round: 2021-10-06 20:00:00<br />n:  77","Created_At_Round: 2021-10-06 21:00:00<br />n:  70","Created_At_Round: 2021-10-06 22:00:00<br />n:  41","Created_At_Round: 2021-10-06 23:00:00<br />n:  41","Created_At_Round: 2021-10-07 00:00:00<br />n:  40","Created_At_Round: 2021-10-07 01:00:00<br />n:  25","Created_At_Round: 2021-10-07 02:00:00<br />n:  14","Created_At_Round: 2021-10-07 03:00:00<br />n:  19","Created_At_Round: 2021-10-07 04:00:00<br />n:  24","Created_At_Round: 2021-10-07 05:00:00<br />n:  57","Created_At_Round: 2021-10-07 06:00:00<br />n:  30","Created_At_Round: 2021-10-07 07:00:00<br />n:  28","Created_At_Round: 2021-10-07 08:00:00<br />n:  39","Created_At_Round: 2021-10-07 09:00:00<br />n:  45","Created_At_Round: 2021-10-07 10:00:00<br />n:  23","Created_At_Round: 2021-10-07 11:00:00<br />n:  35","Created_At_Round: 2021-10-07 12:00:00<br />n:  29","Created_At_Round: 2021-10-07 13:00:00<br />n:  75","Created_At_Round: 2021-10-07 14:00:00<br />n: 128","Created_At_Round: 2021-10-07 15:00:00<br />n:  82","Created_At_Round: 2021-10-07 16:00:00<br />n:  67","Created_At_Round: 2021-10-07 17:00:00<br />n:  60","Created_At_Round: 2021-10-07 18:00:00<br />n:  35","Created_At_Round: 2021-10-07 19:00:00<br />n:  55","Created_At_Round: 2021-10-07 20:00:00<br />n:  27","Created_At_Round: 2021-10-07 21:00:00<br />n:  34","Created_At_Round: 2021-10-07 22:00:00<br />n:  78","Created_At_Round: 2021-10-07 23:00:00<br />n:  31","Created_At_Round: 2021-10-08 00:00:00<br />n:  27","Created_At_Round: 2021-10-08 01:00:00<br />n:  15"],"type":"scatter","mode":"lines","line":{"width":1.88976377952756,"color":"rgba(0,0,0,1)","dash":"solid"},"hoveron":"points","showlegend":false,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null}],"layout":{"margin":{"t":43.7625570776256,"r":7.30593607305936,"b":40.1826484018265,"l":28.4931506849315},"plot_bgcolor":"rgba(255,255,255,1)","paper_bgcolor":"rgba(255,255,255,1)","font":{"color":"rgba(0,0,0,1)","family":"","size":14.6118721461187},"title":{"text":"Number of Tweets per Hour","font":{"color":"rgba(0,0,0,1)","family":"","size":17.5342465753425},"x":0,"xref":"paper"},"xaxis":{"domain":[0,1],"automargin":true,"type":"linear","autorange":false,"range":[1633386420,1633667580],"tickmode":"array","ticktext":["Oct 05","Oct 06","Oct 07","Oct 08"],"tickvals":[1633392000,1633478400,1633564800,1633651200],"categoryorder":"array","categoryarray":["Oct 05","Oct 06","Oct 07","Oct 08"],"nticks":null,"ticks":"outside","tickcolor":"rgba(179,179,179,1)","ticklen":3.65296803652968,"tickwidth":0.33208800332088,"showticklabels":true,"tickfont":{"color":"rgba(77,77,77,1)","family":"","size":11.689497716895},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"gridcolor":"rgba(222,222,222,1)","gridwidth":0.33208800332088,"zeroline":false,"anchor":"y","title":{"text":"Date","font":{"color":"rgba(0,0,0,1)","family":"","size":14.6118721461187}},"hoverformat":".2f"},"yaxis":{"domain":[0,1],"automargin":true,"type":"linear","autorange":false,"range":[8.3,133.7],"tickmode":"array","ticktext":["25","50","75","100","125"],"tickvals":[25,50,75,100,125],"categoryorder":"array","categoryarray":["25","50","75","100","125"],"nticks":null,"ticks":"outside","tickcolor":"rgba(179,179,179,1)","ticklen":3.65296803652968,"tickwidth":0.33208800332088,"showticklabels":true,"tickfont":{"color":"rgba(77,77,77,1)","family":"","size":11.689497716895},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"gridcolor":"rgba(222,222,222,1)","gridwidth":0.33208800332088,"zeroline":false,"anchor":"x","title":{"text":"","font":{"color":"rgba(0,0,0,1)","family":"","size":14.6118721461187}},"hoverformat":".2f"},"shapes":[{"type":"rect","fillcolor":"transparent","line":{"color":"rgba(179,179,179,1)","width":0.66417600664176,"linetype":"solid"},"yref":"paper","xref":"paper","x0":0,"x1":1,"y0":0,"y1":1}],"showlegend":false,"legend":{"bgcolor":"rgba(255,255,255,1)","bordercolor":"transparent","borderwidth":1.88976377952756,"font":{"color":"rgba(0,0,0,1)","family":"","size":11.689497716895}},"hovermode":"closest","barmode":"relative"},"config":{"doubleClick":"reset","showSendToCloud":false},"source":"A","attrs":{"46fe15273de8":{"x":{},"y":{},"type":"scatter"}},"cur_data":"46fe15273de8","visdat":{"46fe15273de8":["function (y) ","x"]},"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.2,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>
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
##   -4   -3   -2   -1    0    1    2    3    4    5 
##   15   39  211  669 2178  694  162   24    6    2
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
##               bigram
## 1       rt antalyadf
## 2  antalyadf adfdata
## 3   adfdata focusing
## 4        focusing on
## 5   on globalwarming
## 6  globalwarming the
## 7             the 10
## 8         10 warmest
## 9      warmest years
## 10          years on
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
## 1        global       warming    423
## 2       climate        change    371
## 3            rt  johnrmoffitt    334
## 4 globalwarming climatechange    268
## 5         franz         josef    199
## 6    astonished          yest    198
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
<div id="htmlwidget-7c577743803d8a543614" style="width:672px;height:480px;" class="forceNetwork html-widget"></div>
<script type="application/json" data-for="htmlwidget-7c577743803d8a543614">{"x":{"links":{"source":[50,25,19,2,39,3,25,49,2,19,2,1,3,2,15,3,3,3,15,34,52,33,6,2,29,36,3,3,31,32,7,11,3,26,39,43,2,4,25,42,15,16,47,20,3,17,2,21,40,42,12,22,3,35,36,44,12,40,43,4,2,5,23,0,2,10,5,13],"target":[79,67,64,68,41,27,27,50,78,24,24,53,34,57,17,17,17,15,63,74,73,73,55,58,31,37,37,51,51,72,56,61,30,69,44,45,45,7,70,76,18,18,77,21,60,71,11,65,46,46,13,23,28,38,38,47,62,48,48,8,52,9,66,16,75,59,54,14],"value":[10,8.77068557919622,7.89598108747045,6.33569739952719,4.70449172576832,4.68085106382979,4.68085106382979,4.68085106382979,4.68085106382979,4.68085106382979,4.65721040189125,4.25531914893617,2.97872340425532,2.90780141843972,2.90780141843972,2.88416075650118,2.86052009456265,2.78959810874704,2.78959810874704,2.78959810874704,2.52955082742317,2.15130023640662,2.03309692671395,1.98581560283688,1.98581560283688,1.91489361702128,1.91489361702128,1.91489361702128,1.89125295508274,1.84397163120567,1.82033096926714,1.82033096926714,1.79669030732861,1.725768321513,1.70212765957447,1.70212765957447,1.67848699763593,1.60756501182033,1.60756501182033,1.60756501182033,1.5839243498818,1.51300236406619,1.39479905437352,1.39479905437352,1.34751773049645,1.27659574468085,1.27659574468085,1.27659574468085,1.27659574468085,1.27659574468085,1.27659574468085,1.27659574468085,1.25295508274232,1.25295508274232,1.25295508274232,1.25295508274232,1.25295508274232,1.25295508274232,1.25295508274232,1.25295508274232,1.25295508274232,1.25295508274232,1.25295508274232,1.22931442080378,1.22931442080378,1.22931442080378,1.20567375886525,1.20567375886525],"colour":["#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666"]},"nodes":{"name":["global","climate","rt","globalwarming","franz","astonished","exact","josef","seeing","truly","far","omarbula","get","probably","you’ll","climatecrisis","warming","climatechange","make","bumoon","green","mindset","planet's","programs","bumoon_io","t.co","polar","aqtl0bico4","reason","water","gpwx","drought","will","world's","choice","cultural","economic","environmental","religious","1982","accurately","april","co2","exxon","internal","johnrmoffitt","predicted","report","scientists","10yrs","around","flood","spe_token_bsc","change","yest","date","glacier","chrisnoble_nz","drgem2015","worse","moreover","globalism","rid","climateemergency","aims","people","visit","9i","alvinfoo","ice","kwyrbhnfe9","nytimes","gain","coral","combination","waterinno","levels","manageme","bkaydw","14"],"group":[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],"nodesize":[4.23,3.71,11.89,9.48,3.97,3.96,1.98,3.97,1.98,1.98,1.23,2.43,2.36,2.36,1.18,3.58,5.09,4.87,1.7,1.58,0.81,1.62,0.8,1.58,2.57,2.17,0.72,1.43,0.68,0.68,0.67,1.32,0.59,0.57,1.08,0.54,1.08,1.08,1.08,1.06,1.06,0.53,1.06,1.06,1.06,3.87,1.06,1.06,1.06,0.52,1.04,1.16,1.02,3.71,1.98,1.98,1.98,1.97,1.26,1.23,1.23,1.22,1.18,0.91,0.81,0.81,0.78,0.77,0.73,0.72,0.68,0.59,0.59,1.08,0.54,0.54,0.53,0.53,0.53,0.52]},"options":{"NodeID":"name","Group":"Group","colourScale":"d3.scaleOrdinal(d3.schemeCategory20);","fontSize":12,"fontFamily":"serif","clickTextSize":30,"linkDistance":50,"linkWidth":"function(d) { return Math.sqrt(d.value); }","charge":-30,"opacity":0.9,"zoom":true,"legend":false,"arrows":false,"nodesize":true,"radiusCalculation":" Math.sqrt(d.nodesize)+6","bounded":false,"opacityNoHover":1,"clickAction":null}},"evals":[],"jsHooks":[]}</script>
```

In this blog, we explored how to extract data and insights from Twitter. We presented how to clean text data and perform sentiment analysis. Secondly, we saw how pairwise word counts give information about the relations of the input text. Lastly, we studied how to use networks to represent bigram count measures.

## References:

Bing Liu, Minqing Hu and Junsheng Cheng. "Opinion Observer: Analyzing 
       and Comparing Opinions on the Web." Proceedings of the 14th 
       International World Wide Web conference (WWW-2005), May 10-14, 
       2005, Chiba, Japan.
