# Managing Data Frames with dplyr Package in Chinese

Haoyue Qi




```r
library(dplyr)
```

## Short Description of My Contribution
The dplyr package is a very useful package in R for manipulating data frame, and there are many students in China interested in data science and R. However, it is difficult to find a good tutorial for dplyr package in Chinese online. Therefore, my community contribution is that I translate book "R Programming for Data Science"'s 13th chapter "Managing Data Frames with the dplyr package" into Chinese.


## 数据表

数据表在统计学和R中是一个核心的数据结构。一个数据表的基础结构是：每一行代表一个观测数据，每一列代表一个变量或观测数据的一个特征。R对数据表有一个内部实现，并且这会是你最常用的。然而，CRAN上会有一些其他实现数据表的包，这些包通过使用关系型数据库的概念可以允许你操作非常非常大的数据表(但是我们在这里不会讨论)。

因为管理数据表的重要性，有好的工具去管理数据表非常重要。在之前的章节中我们已经讨论过了一些工具如subset()函数，还有使用操作符[和$去提取部分数据表。然而，还有一些其他的操作，如过滤，排序，折叠，这些操作在R中非常繁琐，并且语法不是很直观。dplyr包被设计的目的就是去减轻这些问题，并提供一组高度优化过的函数，专门用于操作数据表。

## dplyr包

dplyr包由Rstudio的Hadley Wickham开发，并且dplyr包是他开发的另一个包plyr包的优化精简版本。dplyr包并没有为R提供新的功能。换句话来说就是，dplyr包能做的所有事情base R都可以做，但dplyr包大幅度简化了base R的繁琐操作。

dplyr包的一个重要贡献是它为数据操作和操作数据表提供了一种“语法”(特别是动词)。通过这种语法，你可以与其他懂这种语法的人轻松地交流你对数据表做了什么。这很有用因为它为数据操作提供了一种抽象，这种抽象是之前不存在的。另一个有用的贡献是dolyr函数非常的快，因为其中很多核心操作使用C++编码的。

## dplyr语法

dplyr包提供的一些核心“动词”有：

1. select: 返回数据表的一部分列。
2. filter: 基于逻辑条件提取数据表的一部分行。
3. arrange: 重新排列数据表的行。
4. rename: 重新命名数据表的变量。
5. mutate: 添加一个新变量/列。或改变一个现有的变量。
6. summarise/summarize: 生成数据表中不同变量的统计数据。
7. %>%: 管道操作符，用于连接多个动词操作形成一个管道。

dplyr包有一些它可以利用的自己的数据类型。例如，有一个方便的print函数可以防止你打印很多的数据在控制台里。大多数时间里，这些额外的数据类型对用户是透明的，所以用户不需要去担心。

### 通用dplyr函数属性

所有我们这章讨论的函数都有一些共同的特点。例如:

1. 第一个参数是数据表。
2. 后续的参数描述了对数据表做什么，并且你可以直接指定数据表中的列，不需要使用$操作符(直接用列名即可)。
3. 函数的返回结果是一个新的数据表。
4. 数据表必须有正确的格式和注释。特别是，数据必须是整洁的(<http://www.jstatsoft.org/v59/i10/paper>)。简短来说，整洁的意思是必须每行一个观测数据，并且每列代表一个特征。

## 安装dplyr包

dplyr包可以通过CRAN安装，也可以使用devtools包和install_github()函数通过GitHub安装。GitHub仓库通常有包的最新版本。

通过CRAN安装，可运行如下代码

install.packages("dplyr")

通过GitHub安装，可运行如下代码

install_github("hadley/dplyr")

安装完包之后，你需要使用library()函数把它载入到R会话中。

library(dplyr)

你有可能会看到一些警告当包被载入的时候因为dplyr包中有一些函数的名字跟其他包中的一些函数的名字一样。目前为止你可以忽略这些警告。

## select()

这一章节的例子我们用的是一组数据包含芝加哥的空气污染和温度数据。数据网址是<http://www.biostat.jhsph.edu/~rpeng/leanpub/rprog/chicago_data.zip>。

解压文件后，你可以把数据加载到R中通过readRDS()函数。

```r
rds <- tempfile()
download.file("http://www.biostat.jhsph.edu/~rpeng/leanpub/rprog/chicago_data.zip",rds)
chicago <- readRDS(gzcon(unz(rds, "chicago.rds")))
```

你可以看到数据集的一些基础特点通过dim()和str()函数。

```r
dim(chicago)
```

```
## [1] 6940    8
```


```r
str(chicago)
```

```
## 'data.frame':	6940 obs. of  8 variables:
##  $ city      : chr  "chic" "chic" "chic" "chic" ...
##  $ tmpd      : num  31.5 33 33 29 32 40 34.5 29 26.5 32.5 ...
##  $ dptp      : num  31.5 29.9 27.4 28.6 28.9 ...
##  $ date      : Date, format: "1987-01-01" "1987-01-02" ...
##  $ pm25tmean2: num  NA NA NA NA NA NA NA NA NA NA ...
##  $ pm10tmean2: num  34 NA 34.2 47 NA ...
##  $ o3tmean2  : num  4.25 3.3 3.33 4.38 4.75 ...
##  $ no2tmean2 : num  20 23.2 23.8 30.4 30.3 ...
```

select()函数可以被用作去选择你想关注的数据表的列。通常来说，你会有一个很大的数据表包含所有的数据，但是分析只需要一部分变量或观测数据。select()函数允许你获得一些你需要的列。

假设我们只想要前3列。有几个方法可以做到。例如我们可以用数值索引。但是我们也可以直接用列名。

```r
names(chicago)[1:3]
```

```
## [1] "city" "tmpd" "dptp"
```


```r
subset <- select(chicago, city:dptp)
head(subset)
```

```
##   city tmpd   dptp
## 1 chic 31.5 31.500
## 2 chic 33.0 29.875
## 3 chic 33.0 27.375
## 4 chic 29.0 28.625
## 5 chic 32.0 28.875
## 6 chic 40.0 35.125
```
注意，一般来说:不可以用于名字或字符串，但在select()函数里面，你可以把它用于指定一个范围的变量名。

你也可以不要一些变量通过使用负号在select()函数中。通过select()你可以做

```r
select(chicago, -(city:dptp))
```
这句话的意思是包含所有变量除了变量city到dptp。同样意思的代码用base R编写为

```r
i <- match("city", names(chicago)) 
j <- match("dptp", names(chicago)) 
head(chicago[, -(i:j)])
```

```
##         date pm25tmean2 pm10tmean2 o3tmean2 no2tmean2
## 1 1987-01-01         NA   34.00000 4.250000  19.98810
## 2 1987-01-02         NA         NA 3.304348  23.19099
## 3 1987-01-03         NA   34.16667 3.333333  23.81548
## 4 1987-01-04         NA   47.00000 4.375000  30.43452
## 5 1987-01-05         NA         NA 4.750000  30.33333
## 6 1987-01-06         NA   48.00000 5.833333  25.77233
```
这种写法并不直观。

select()函数也允许一个特殊的语法，这种语法可以允许你指定列名通过模式。例如，你想要所有的变量结尾是“2”，我们可以做

```r
subset <- select(chicago, ends_with("2"))
str(subset)
```

```
## 'data.frame':	6940 obs. of  4 variables:
##  $ pm25tmean2: num  NA NA NA NA NA NA NA NA NA NA ...
##  $ pm10tmean2: num  34 NA 34.2 47 NA ...
##  $ o3tmean2  : num  4.25 3.3 3.33 4.38 4.75 ...
##  $ no2tmean2 : num  20 23.2 23.8 30.4 30.3 ...
```

或者我们想要所有的变量开头是“d”，我们可以做

```r
subset <- select(chicago, starts_with("d"))
str(subset)
```

```
## 'data.frame':	6940 obs. of  2 variables:
##  $ dptp: num  31.5 29.9 27.4 28.6 28.9 ...
##  $ date: Date, format: "1987-01-01" "1987-01-02" ...
```
你也可以用正则表达式。请看帮助文档(?select)获取更多细节。

## filter()

filter()函数可以被用作获取数据表的一部分行。这个函数跟base R中的subset()函数一样，但比subset()函数快。

假设我们想要去获取chicago数据表的一些行，这些行的PM2.5大于30，我们可以做

```r
chic.f <- filter(chicago, pm25tmean2 > 30)
str(chic.f)
```

```
## 'data.frame':	194 obs. of  8 variables:
##  $ city      : chr  "chic" "chic" "chic" "chic" ...
##  $ tmpd      : num  23 28 55 59 57 57 75 61 73 78 ...
##  $ dptp      : num  21.9 25.8 51.3 53.7 52 56 65.8 59 60.3 67.1 ...
##  $ date      : Date, format: "1998-01-17" "1998-01-23" ...
##  $ pm25tmean2: num  38.1 34 39.4 35.4 33.3 ...
##  $ pm10tmean2: num  32.5 38.7 34 28.5 35 ...
##  $ o3tmean2  : num  3.18 1.75 10.79 14.3 20.66 ...
##  $ no2tmean2 : num  25.3 29.4 25.3 31.4 26.8 ...
```

你可以看到返回的数据表只有194行。pm25tmean2变量的分布是

```r
summary(chic.f$pm25tmean2)
```

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##   30.05   32.12   35.04   36.63   39.53   61.50
```

我们可以放很复杂的逻辑链在filter()函数里。这样我们就可以得到PM2.5大于30并且温度大于80华氏度的行。

```r
chic.f <- filter(chicago, pm25tmean2 > 30 & tmpd > 80)
select(chic.f, date, tmpd, pm25tmean2)
```

```
##          date tmpd pm25tmean2
## 1  1998-08-23   81   39.60000
## 2  1998-09-06   81   31.50000
## 3  2001-07-20   82   32.30000
## 4  2001-08-01   84   43.70000
## 5  2001-08-08   85   38.83750
## 6  2001-08-09   84   38.20000
## 7  2002-06-20   82   33.00000
## 8  2002-06-23   82   42.50000
## 9  2002-07-08   81   33.10000
## 10 2002-07-18   82   38.85000
## 11 2003-06-25   82   33.90000
## 12 2003-07-04   84   32.90000
## 13 2005-06-24   86   31.85714
## 14 2005-06-27   82   51.53750
## 15 2005-06-28   85   31.20000
## 16 2005-07-17   84   32.70000
## 17 2005-08-03   84   37.90000
```
只有17个观测数据两个条件都满足。

## arrange()

arrange()函数被用于根据一个变量重新排序数据表的行。重新排列数据表的行的同时保持其他列的顺序对于R来说是很难的。arrange()函数极大简化了这一过程。

这里我们可以通过date变量排序数据表，所以第一行是最早的观测数据，最后一行是最迟的观测数据。

```r
chicago <- arrange(chicago, date)
```

现在我们可以检查前几行

```r
head(select(chicago, date, pm25tmean2), 3)
```

```
##         date pm25tmean2
## 1 1987-01-01         NA
## 2 1987-01-02         NA
## 3 1987-01-03         NA
```
和最后几行

```r
tail(select(chicago, date, pm25tmean2), 3)
```

```
##            date pm25tmean2
## 6938 2005-12-29    7.45000
## 6939 2005-12-30   15.05714
## 6940 2005-12-31   15.00000
```

列也可以以降序重新排序通过用desc()操作符。

```r
chicago <- arrange(chicago, desc(date))
```

看看降序排序的前三行和后三行。

```r
head(select(chicago, date, pm25tmean2), 3)
```

```
##         date pm25tmean2
## 1 2005-12-31   15.00000
## 2 2005-12-30   15.05714
## 3 2005-12-29    7.45000
```

```r
tail(select(chicago, date, pm25tmean2), 3)
```

```
##            date pm25tmean2
## 6938 1987-01-03         NA
## 6939 1987-01-02         NA
## 6940 1987-01-01         NA
```
## rename()

重新命名数据表的一个变量是非常难得在R中。rename()函数被设计让这个过程变得简单。

这里你可以看到chicago数据表的前5个变量名。

```r
head(chicago[, 1:5], 3)
```

```
##   city tmpd dptp       date pm25tmean2
## 1 chic   35 30.1 2005-12-31   15.00000
## 2 chic   36 31.0 2005-12-30   15.05714
## 3 chic   35 29.4 2005-12-29    7.45000
```

dptp列应该代表露点温度，pm25tmean2列提供了PM2.5数据。然而，这些名字非常模糊，所以它们应该被重新命名让它们更容易被理解。

```r
chicago <- rename(chicago, dewpoint = dptp, pm25 = pm25tmean2)
head(chicago[, 1:5], 3)
```

```
##   city tmpd dewpoint       date     pm25
## 1 chic   35     30.1 2005-12-31 15.00000
## 2 chic   36     31.0 2005-12-30 15.05714
## 3 chic   35     29.4 2005-12-29  7.45000
```
rename()函数里的语法是把新名字放在等号的左边，把旧名字放在等号的右边。

你可以尝试如何用base R完成重命名任务。

## mutate()

mutate()函数存在的目的是计算数据表中变量的转换。通常来说，你想要根据一个存在的变量创造一个新变量。mutate()可以简洁的帮你完成这个任务。

例如，对于空气污染数据，我们经常想减去平均数从而减小数据。这样我们就可以看出某天的空气污染是高于还是低于平均值。

这里我们创造一个pm25detrend变量通过从pm25变量里减去平均数。

```r
chicago <- mutate(chicago, pm25detrend = pm25 - mean(pm25, na.rm = TRUE))
head(chicago)
```

```
##   city tmpd dewpoint       date     pm25 pm10tmean2  o3tmean2 no2tmean2
## 1 chic   35     30.1 2005-12-31 15.00000       23.5  2.531250  13.25000
## 2 chic   36     31.0 2005-12-30 15.05714       19.2  3.034420  22.80556
## 3 chic   35     29.4 2005-12-29  7.45000       23.5  6.794837  19.97222
## 4 chic   37     34.5 2005-12-28 17.75000       27.5  3.260417  19.28563
## 5 chic   40     33.6 2005-12-27 23.56000       27.0  4.468750  23.50000
## 6 chic   35     29.6 2005-12-26  8.40000        8.5 14.041667  16.81944
##   pm25detrend
## 1   -1.230958
## 2   -1.173815
## 3   -8.780958
## 4    1.519042
## 5    7.329042
## 6   -7.830958
```

还有一个transmute()函数，所做的事情跟mutate()函数一样，但是会去掉所有没有转换的变量。

这里我们减小了PM10和ozone变量。

```r
head(transmute(chicago,
    pm10detrend = pm10tmean2 - mean(pm10tmean2, na.rm = TRUE), 
    o3detrend = o3tmean2 - mean(o3tmean2, na.rm = TRUE)))
```

```
##   pm10detrend  o3detrend
## 1  -10.395206 -16.904263
## 2  -14.695206 -16.401093
## 3  -10.395206 -12.640676
## 4   -6.395206 -16.175096
## 5   -6.895206 -14.966763
## 6  -25.395206  -5.393846
```
注意返回表只有2列。

## group_by()

group_by()函数用于从数据表中根据一个变量生成统计数据。例如，在这个空气污染数据集中，你想要知道每年平均PM2.5值是多少。所以层是year，year可以从date变量里获得。在与group_by()函数结合使用时，我们经常使用summarize()函数。

这里基本的操作是通过group_by()根据一个变量分割数据表，然后再应用一个summary函数在这些子集上。

首先，你可以创造一个year变量通过as.POSIXlt()。

```r
chicago <- mutate(chicago, year = as.POSIXlt(date)$year + 1900)
```

现在你可以创建一个新表，新表根据year分割了原数据表。

```r
years <- group_by(chicago, year)
```

最终，你可以用summarize()函数计算数据表中每一年的统计数据。

```r
summarize(years, pm25 = mean(pm25, na.rm = TRUE),
    o3 = max(o3tmean2, na.rm = TRUE),
    no2 = median(no2tmean2, na.rm = TRUE),
             .groups = "drop")
```

```
## # A tibble: 19 x 4
##     year  pm25    o3   no2
##    <dbl> <dbl> <dbl> <dbl>
##  1  1987 NaN    63.0  23.5
##  2  1988 NaN    61.7  24.5
##  3  1989 NaN    59.7  26.1
##  4  1990 NaN    52.2  22.6
##  5  1991 NaN    63.1  21.4
##  6  1992 NaN    50.8  24.8
##  7  1993 NaN    44.3  25.8
##  8  1994 NaN    52.2  28.5
##  9  1995 NaN    66.6  27.3
## 10  1996 NaN    58.4  26.4
## 11  1997 NaN    56.5  25.5
## 12  1998  18.3  50.7  24.6
## 13  1999  18.5  57.5  24.7
## 14  2000  16.9  55.8  23.5
## 15  2001  16.9  51.8  25.1
## 16  2002  15.3  54.9  22.7
## 17  2003  15.2  56.2  24.6
## 18  2004  14.6  44.5  23.4
## 19  2005  16.2  58.8  22.6
```
summarize()返回了一个数据表，year是第一列，然后是pm25, o3, 和no2的年平均数。

在一个更复杂的例子里，我们想要知道在各个pm25分位数的区间里，o3和no2的平均是是多少。一个更简便的方法是通过回归模型，但是我们也可以用group_by()和summarize()很快的实现。

首先，我们可以创造一个pm25的类别变量，把PM25分成5等份。

```r
qq <- quantile(chicago$pm25, seq(0, 1, 0.2), na.rm = TRUE)
chicago <- mutate(chicago, pm25.quint = cut(pm25, qq))
```

现在我们可以通过pm25.quint变量聚合数据表。

```r
quint <- group_by(chicago, pm25.quint)
```

最终，我们可以计算o3和no2的平均值。

```r
summarize(quint, o3 = mean(o3tmean2, na.rm = TRUE),
    no2 = mean(no2tmean2, na.rm = TRUE),
    .groups = "drop")
```

```
## # A tibble: 6 x 3
##   pm25.quint     o3   no2
##   <fct>       <dbl> <dbl>
## 1 (1.7,8.7]    21.7  18.0
## 2 (8.7,12.4]   20.4  22.1
## 3 (12.4,16.7]  20.7  24.4
## 4 (16.7,22.6]  19.9  27.3
## 5 (22.6,61.5]  20.3  29.6
## 6 <NA>         18.8  25.8
```

根据表，看上去pm25和o3没有什么关系，但pm25和no2正相关。更复杂的统计模型可以帮助你给出更准确的答案，但用dplyr函数也可以给出一个还不错的答案。

## %>%

管道操作符%>%可以非常方便的连接多个dplyr函数。注意上文中每次我们想要应用多于一个函数的时候，代码会有一系列嵌套函数，非常难以阅读，例如: third(second(first(x)))

嵌套不是一个自然的方法去思考一系列操作。%>%操作符允许你去从左到右连接操作。
例如: first(x) %>% second %>% third

拿上一章节我们计算o3和no2平均数的例子为例。我们需要做:
1. 创造一个新变量pm25.quint
2. 根据新变量分割数据表
3. 在每个分割组中计算o3和no2的平均数

这可以用如下的单个R表达式做到

```r
mutate(chicago, pm25.quint = cut(pm25, qq)) %>%
         group_by(pm25.quint) %>%
    summarize(o3 = mean(o3tmean2, na.rm = TRUE),
    no2 = mean(no2tmean2, na.rm = TRUE), .groups = "drop")
```

```
## # A tibble: 6 x 3
##   pm25.quint     o3   no2
##   <fct>       <dbl> <dbl>
## 1 (1.7,8.7]    21.7  18.0
## 2 (8.7,12.4]   20.4  22.1
## 3 (12.4,16.7]  20.7  24.4
## 4 (16.7,22.6]  19.9  27.3
## 5 (22.6,61.5]  20.3  29.6
## 6 <NA>         18.8  25.8
```

用这种方式我们不需要创造一堆暂时变量，也不需要用一堆嵌套函数。

注意到在上面代码中，我们把chicago数据表放在了mutate()的第一个参数上，之后我们不再需要把数据表放在group_by()和summarize()的第一个参数上。当我们用%>%的时候，管道中之前元素的输出值会成为第一个参数。

另一个例子是计算每月的平均污染水平。这对查看数据是否有季节性趋势很有用。

```r
mutate(chicago, month = as.POSIXlt(date)$mon + 1) %>%
    group_by(month) %>%
    summarize(pm25 = mean(pm25, na.rm = TRUE),
    o3 = max(o3tmean2, na.rm = TRUE),
    no2 = median(no2tmean2, na.rm = TRUE), .groups = "drop")
```

```
## # A tibble: 12 x 4
##    month  pm25    o3   no2
##    <dbl> <dbl> <dbl> <dbl>
##  1     1  17.8  28.2  25.4
##  2     2  20.4  37.4  26.8
##  3     3  17.4  39.0  26.8
##  4     4  13.9  47.9  25.0
##  5     5  14.1  52.8  24.2
##  6     6  15.9  66.6  25.0
##  7     7  16.6  59.5  22.4
##  8     8  16.9  54.0  23.0
##  9     9  15.9  57.5  24.5
## 10    10  14.2  47.1  24.2
## 11    11  15.2  29.5  23.6
## 12    12  17.5  27.7  24.5
```

这里我们可以看到o3在冬天会少，在夏天会多。然而no2在冬天会多，在夏天会少。

## 总结

dplyr包提供了一些简洁的操作用于管理数据表。用这些函数我们可以做很多复杂的操作用一点点代码。特别是，我们经常可以用group_by()和summarize()函数开始我们的探索性数据分析。

当你学会了dplyr的语法后，还有一些其他好处。

1. dplyr可以和其他数据表后端如SQL数据库一起工作。通过DBI包有一个用于关系型数据库的SQL接口。
2. dplyr可以和data.table包集成用于快速的操作很大的表。

dplyr包可以简单快速的管理数据表。你很少会同时获得这样的组合。

## Cited Resourses

1. Peng, Roger D.. "13. Managing Data Frames with the dplyr package." "R Programming for Data Science", 2020, pp.52-64.
