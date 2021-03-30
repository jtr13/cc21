# An introduction of web scrapping using rvest

Hang Luo




## Introduction
Here, we briefly introduce how to do web scraping with R and mainly the usage of R package "rvest". We will use the data from problem set 2 as an example. We need to scrape the data of vaccination rates from this page: "https://www.beckershospitalreview.com/public-health/states-ranked-by-percentage-of-covid-19-vaccines-administered.html." Specifically, "State","State Distributed","Administrated","Percentage" are the variates we need to scape from this page.

## Understanding a web page "HTML"

HTML is not a programming language. Instead, it’s called a markup language — it describes the content and structure of a web page. HTML is organized using tags, which are surrounded by <> symbols. Different tags perform different functions. Together, many tags will form and contain the content of a web page.

The simplest HTML document looks like this:

```{}
<html>
<head>
```

Although the above is a legitimate HTML document, it has no text or other content. If we were to save that as a html file and open it using a web browser, we would see a blank page.

Notice that the word html is surrounded by <> brackets, which indicates that it is a tag. To add some more structure and text to this HTML document, we could add the following:

```{}
<head>
</head>
<body>
<p>
Here's a paragraph of text!
</p>
<p>
Here's a second paragraph of text!
</p>
</body>
</html>
```

Here we’ve added \<head> and \<body> tags, which add more structure to the document. The \<p> tags are what we use in HTML to designate paragraph text.

There are many, many tags in HTML. The important takeaway is to know that tags have particular names (html, body, p, etc.) to make them identifiable in an HTML document.

Notice that each of the tags are “paired” in a sense that each one is accompanied by another with a similar name. That is to say, the opening \<html> tag is paired with another tag \</html> that indicates the beginning and end of the HTML document. The same applies to \<body> and \<p>.


## The rvest library

The rvest library is a library that lets users easily scrape data from web pages. Rvest is one of the tidyverse libraries, so it works well with the other libraries contained in the bundle. 

Install package

```r
#install.packages('rvest')
library(rvest)
```

In order to start parsing through a web page, we first need to request that data from the computer server that contains it. In rvest, the function that serves this purpose is the read_html() function. 
We will get data from "https://www.beckershospitalreview.com/public-health/states-ranked-by-percentage-of-covid-19-vaccines-administered.html", which is in the problem2.

read_html():

```r
url <- "https://www.beckershospitalreview.com/public-health/states-ranked-by-percentage-of-covid-19-vaccines-administered.html"
page <- read_html(url)
```

To read the webpage only once, we need to save the page and read the saved page next time when we try to run the code. We can use function write_html() as follow:
write_html(page, "vac_page.html")

## Tracking the data from the page

To get the exact data we want, we need to use the devtools of Chrome to track the data. Select the particular line from the web on Chrome, right click, and choose "inspect". Then we will enter the web source code. Right click the choosen line, choose "copy->copy full Xpath". Then we will get the path of the line we choose from the web.

Take the State Mexico as an example. The names and Xpathes of each line can be listed as follow:  


```
##                                                                Linename
## 1                                                                Mexico
## 2                                   Doses distributed to state: 862,495
## 3                                           Doses administered: 743,904
## 4 Percentage of distributed vaccines that have been administered: 86.25
##                                                        Linepath
## 1    /html/body/div/div[2]/div[5]/div[1]/div[2]/ol/li[1]/strong
## 2 /html/body/div/div[2]/div[5]/div[1]/div[2]/ol/li[1]/text()[1]
## 3 /html/body/div/div[2]/div[5]/div[1]/div[2]/ol/li[1]/text()[2]
## 4 /html/body/div/div[2]/div[5]/div[1]/div[2]/ol/li[1]/text()[3]
```

## Extracting data from the page

In order to capture the text, we need to use the html_nodes() and html_text() functions respectively to search for this tag and retrieve the text. But be careful, when we will use xpath for a selected line, we should use function html_nodes as html_nodes(xpath = ...) The code below does this:


```r
page %>%
  html_nodes(xpath = "/html/body/div/div[2]/div[5]/div[1]/div[2]/ol/li[1]/strong") %>%
  html_text
```

```
## [1] "Wisconsin"
```

It's similar to get three other texts.


```r
page %>%
  html_nodes(xpath = "/html/body/div/div[2]/div[5]/div[1]/div[2]/ol/li[1]/text()[1]") %>%
  html_text
```

```
## [1] "Doses distributed to state: 2,923,795"
```

```r
page %>%
  html_nodes(xpath = "/html/body/div/div[2]/div[5]/div[1]/div[2]/ol/li[1]/text()[2]") %>%
  html_text
```

```
## [1] "Doses administered: 2,576,727"
```

```r
page %>%
  html_nodes(xpath = "/html/body/div/div[2]/div[5]/div[1]/div[2]/ol/li[1]/text()[3]") %>%
  html_text
```

```
## [1] "Percentage of distributed vaccines that have been administered: 88.13"
```


For other state, inspect the source code of other lines, we discover that we just need to changes the number in square brackets of li[]. So we can use loop to extract data and to get the number, we should remove the character from the text and turn the data to "int".

## Summary

For the package "rvest", there are four functions:


```
## [1] "read_html()"  "write_html()" "html_nodes()" "html_text()"
```

With devtools of chrome, we can get the exact path of the data we are interested. Then we can use these functions to scrape the data and analyze them. This is an easy access to scape data from web.




