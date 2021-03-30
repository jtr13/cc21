# Chinese translation of broom package

Wenjie Wei and Yinqiu Feng


```r
library(broom)
```

## 序言
broom包可以将R语言中内置函数（例如lm，nls或t.test）的混乱输出转换为整齐的tibbel(一种R特有的数据框）。\ 

broom 是一种可以将不整齐的估测结果调整为我们想要的整齐数据的工具。它以3种S3类函数为中心，每种方法都采用R统计函数（lm,t.test,nls等等）产生的对象并转换结果至tibble。设计broom是为了和Hadley的dplyr包一起使用。\ 

broom应与reshape2和tidyr之类的包区分开来,这些包会将数据帧重新排列和重塑为不同的形式。这些软件包在整理好的的数据分析中执行关键任务，但专注于将一种特定格式的数据帧转换为另一种格式。相反，broom被设计为采用非表格数据格式的格式，并将其转换为整洁的数据框。\ 

整理模型输出不是一门精准的学科，它基于数据科学家对于从整洁的数据分析中得出的各种值（例如，估计值，测试统计数据和p值）进行判断的期望。您可能会丢失所需的原始对象中的某些信息，或者保留了比所需更多的信息。如果您认为应该更改模型的整理输出，或者缺少所需的S3类的整理功能，欢迎提出问题或需求。\ 

## 整理函数
这个软件包提供了三种S3类函数，可以进行三种不同的整理：\ 

tidy：绘制tibble，总结该模型的统计结果。这包括回归中每个项的系数和p值，聚类应用中的每个集群信息或多测试功能的每个测试信息。\ 

augment：在建模的原始数据中增加列数。这包括预测，残差和聚类分配。

glance：建立一行关于模型的精简总结。它通常包含诸如R方，调整R方和残余标准误差之类的值，这些值会针对整个模型计算一次。\ 

请注意，某些类可能只定义了其中一种或两种方法。\ 
作为说明性示例，我们来对R内置的mtcars数据集进行线性拟合。\ 

```r
lmfit <- lm(mpg ~ wt, mtcars)
lmfit
```

```
## 
## Call:
## lm(formula = mpg ~ wt, data = mtcars)
## 
## Coefficients:
## (Intercept)           wt  
##      37.285       -5.344
```


```r
summary(lmfit)
```

```
## 
## Call:
## lm(formula = mpg ~ wt, data = mtcars)
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -4.5432 -2.3647 -0.1252  1.4096  6.8727 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)  37.2851     1.8776  19.858  < 2e-16 ***
## wt           -5.3445     0.5591  -9.559 1.29e-10 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 3.046 on 30 degrees of freedom
## Multiple R-squared:  0.7528,	Adjusted R-squared:  0.7446 
## F-statistic: 91.38 on 1 and 30 DF,  p-value: 1.294e-10
```
如果您只想看下总结数据，到这就已足够。但是，将其转换为包含所有相同信息的表格数据，以便您可以将其与其他模型结合或进行进一步的分析并非易事。您必须执行coef（summary（lmfit））以获得系数矩阵，术语仍存储在行名称中，并且列名称与其他包不一致（例如与p.value相比，Pr（> | t |）不一致）。\

现在，您可以在fit上用broom包里的tidy函数：

```r
tidy(lmfit)
```

```
## # A tibble: 2 x 5
##   term        estimate std.error statistic  p.value
##   <chr>          <dbl>     <dbl>     <dbl>    <dbl>
## 1 (Intercept)    37.3      1.88      19.9  8.24e-19
## 2 wt             -5.34     0.559     -9.56 1.29e-10
```
这为您提供了表格数据表示形式。请注意，行名称已移至称为term的列中，并且这些列名称简单且一致（可以使用$进行访问）。\ 

您可能对回归中每个原始点的拟合值和残差感兴趣，而不是查看系数。为此，请使用augment函数，它会使用来自模型的信息来扩充原始数据：

```r
augment(lmfit)
```

```
## # A tibble: 32 x 9
##    .rownames          mpg    wt .fitted .resid   .hat .sigma  .cooksd .std.resid
##    <chr>            <dbl> <dbl>   <dbl>  <dbl>  <dbl>  <dbl>    <dbl>      <dbl>
##  1 Mazda RX4         21    2.62    23.3 -2.28  0.0433   3.07  1.33e-2    -0.766 
##  2 Mazda RX4 Wag     21    2.88    21.9 -0.920 0.0352   3.09  1.72e-3    -0.307 
##  3 Datsun 710        22.8  2.32    24.9 -2.09  0.0584   3.07  1.54e-2    -0.706 
##  4 Hornet 4 Drive    21.4  3.22    20.1  1.30  0.0313   3.09  3.02e-3     0.433 
##  5 Hornet Sportabo…  18.7  3.44    18.9 -0.200 0.0329   3.10  7.60e-5    -0.0668
##  6 Valiant           18.1  3.46    18.8 -0.693 0.0332   3.10  9.21e-4    -0.231 
##  7 Duster 360        14.3  3.57    18.2 -3.91  0.0354   3.01  3.13e-2    -1.31  
##  8 Merc 240D         24.4  3.19    20.2  4.16  0.0313   3.00  3.11e-2     1.39  
##  9 Merc 230          22.8  3.15    20.5  2.35  0.0314   3.07  9.96e-3     0.784 
## 10 Merc 280          19.2  3.44    18.9  0.300 0.0329   3.10  1.71e-4     0.100 
## # … with 22 more rows
```
注意，每个新列都以a开头。 （以避免覆盖任何原始列）\ 

最后，我们为整个回归模型计算了一些汇总统计量，例如R方和F统计量。这些可以通过glance函数访问：

```r
glance(lmfit)
```

```
## # A tibble: 1 x 12
##   r.squared adj.r.squared sigma statistic  p.value    df logLik   AIC   BIC
##       <dbl>         <dbl> <dbl>     <dbl>    <dbl> <dbl>  <dbl> <dbl> <dbl>
## 1     0.753         0.745  3.05      91.4 1.29e-10     1  -80.0  166.  170.
## # … with 3 more variables: deviance <dbl>, df.residual <int>, nobs <int>
```
关于tidy,augment和glance函数的区别，可以指路k-means vignette https://www.tidymodels.org/learn/statistics/k-means/

## 其他案例

### 广义线性模型和非线性模型

这些功能同样适用于glm的输出结果：

```r
glmfit <- glm(am ~ wt, mtcars, family = "binomial")
tidy(glmfit)
```

```
## # A tibble: 2 x 5
##   term        estimate std.error statistic p.value
##   <chr>          <dbl>     <dbl>     <dbl>   <dbl>
## 1 (Intercept)    12.0       4.51      2.67 0.00759
## 2 wt             -4.02      1.44     -2.80 0.00509
```

```r
augment(glmfit)
```

```
## # A tibble: 32 x 9
##    .rownames            am    wt .fitted .resid .std.resid   .hat .sigma .cooksd
##    <chr>             <dbl> <dbl>   <dbl>  <dbl>      <dbl>  <dbl>  <dbl>   <dbl>
##  1 Mazda RX4             1  2.62   1.50   0.635      0.680 0.126   0.803 0.0184 
##  2 Mazda RX4 Wag         1  2.88   0.471  0.985      1.04  0.108   0.790 0.0424 
##  3 Datsun 710            1  2.32   2.70   0.360      0.379 0.0963  0.810 0.00394
##  4 Hornet 4 Drive        0  3.22  -0.897 -0.827     -0.860 0.0744  0.797 0.0177 
##  5 Hornet Sportabout     0  3.44  -1.80  -0.553     -0.572 0.0681  0.806 0.00647
##  6 Valiant               0  3.46  -1.88  -0.532     -0.551 0.0674  0.807 0.00590
##  7 Duster 360            0  3.57  -2.33  -0.432     -0.446 0.0625  0.809 0.00348
##  8 Merc 240D             0  3.19  -0.796 -0.863     -0.897 0.0755  0.796 0.0199 
##  9 Merc 230              0  3.15  -0.635 -0.922     -0.960 0.0776  0.793 0.0242 
## 10 Merc 280              0  3.44  -1.80  -0.553     -0.572 0.0681  0.806 0.00647
## # … with 22 more rows
```

```r
glance(glmfit)
```

```
## # A tibble: 1 x 8
##   null.deviance df.null logLik   AIC   BIC deviance df.residual  nobs
##           <dbl>   <int>  <dbl> <dbl> <dbl>    <dbl>       <int> <int>
## 1          43.2      31  -9.59  23.2  26.1     19.2          30    32
```
注意，通过glance计算的统计信息对于glm模型与lm模型的不同（例如，偏差而不是R方）\ 

这些函数还可以用于其他拟合，例如非线性模型（nls）：

```r
nlsfit <- nls(mpg ~ k / wt + b, mtcars, start = list(k = 1, b = 0))
tidy(nlsfit)
```

```
## # A tibble: 2 x 5
##   term  estimate std.error statistic  p.value
##   <chr>    <dbl>     <dbl>     <dbl>    <dbl>
## 1 k        45.8       4.25     10.8  7.64e-12
## 2 b         4.39      1.54      2.85 7.74e- 3
```

```r
augment(nlsfit, mtcars)
```

```
## # A tibble: 32 x 14
##    .rownames     mpg   cyl  disp    hp  drat    wt  qsec    vs    am  gear  carb
##    <chr>       <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl>
##  1 Mazda RX4    21       6  160    110  3.9   2.62  16.5     0     1     4     4
##  2 Mazda RX4 …  21       6  160    110  3.9   2.88  17.0     0     1     4     4
##  3 Datsun 710   22.8     4  108     93  3.85  2.32  18.6     1     1     4     1
##  4 Hornet 4 D…  21.4     6  258    110  3.08  3.22  19.4     1     0     3     1
##  5 Hornet Spo…  18.7     8  360    175  3.15  3.44  17.0     0     0     3     2
##  6 Valiant      18.1     6  225    105  2.76  3.46  20.2     1     0     3     1
##  7 Duster 360   14.3     8  360    245  3.21  3.57  15.8     0     0     3     4
##  8 Merc 240D    24.4     4  147.    62  3.69  3.19  20       1     0     4     2
##  9 Merc 230     22.8     4  141.    95  3.92  3.15  22.9     1     0     4     2
## 10 Merc 280     19.2     6  168.   123  3.92  3.44  18.3     1     0     4     4
## # … with 22 more rows, and 2 more variables: .fitted <dbl>, .resid <dbl>
```

```r
glance(nlsfit)
```

```
## # A tibble: 1 x 9
##   sigma isConv       finTol logLik   AIC   BIC deviance df.residual  nobs
##   <dbl> <lgl>         <dbl>  <dbl> <dbl> <dbl>    <dbl>       <int> <int>
## 1  2.77 TRUE   0.0000000288  -77.0  160.  164.     231.          30    32
```
### 假设检验

tidy函数也可以应用于htest对象，例如最近很火的内置函数（如t.test，cor.test和wilcox.test）输出的对象。

```r
tt <- t.test(wt ~ am, mtcars)
tidy(tt)
```

```
## # A tibble: 1 x 10
##   estimate estimate1 estimate2 statistic    p.value parameter conf.low conf.high
##      <dbl>     <dbl>     <dbl>     <dbl>      <dbl>     <dbl>    <dbl>     <dbl>
## 1     1.36      3.77      2.41      5.49 0.00000627      29.2    0.853      1.86
## # … with 2 more variables: method <chr>, alternative <chr>
```
在一些情况下，列数可能较少（例如，没有置信区间）：

```r
wt <- wilcox.test(wt ~ am, mtcars)
tidy(wt)
```

```
## # A tibble: 1 x 4
##   statistic   p.value method                                         alternative
##       <dbl>     <dbl> <chr>                                          <chr>      
## 1      230. 0.0000435 Wilcoxon rank sum test with continuity correc… two.sided
```
由于tidy输出结果已经只有一行，因此glance返回相同的输出：

```r
glance(tt)
```

```
## # A tibble: 1 x 10
##   estimate estimate1 estimate2 statistic    p.value parameter conf.low conf.high
##      <dbl>     <dbl>     <dbl>     <dbl>      <dbl>     <dbl>    <dbl>     <dbl>
## 1     1.36      3.77      2.41      5.49 0.00000627      29.2    0.853      1.86
## # … with 2 more variables: method <chr>, alternative <chr>
```

```r
glance(wt)
```

```
## # A tibble: 1 x 4
##   statistic   p.value method                                         alternative
##       <dbl>     <dbl> <chr>                                          <chr>      
## 1      230. 0.0000435 Wilcoxon rank sum test with continuity correc… two.sided
```
因为没有必要，我们仅针对卡方检验定义了扩充方法，对于其他检验，假设检验产生关于每个初始数据点的输出，则没有其他意义。

```r
chit <- chisq.test(xtabs(Freq ~ Sex + Class, 
                         data = as.data.frame(Titanic)))
tidy(chit)
```

```
## # A tibble: 1 x 4
##   statistic  p.value parameter method                    
##       <dbl>    <dbl>     <int> <chr>                     
## 1      350. 1.56e-75         3 Pearson's Chi-squared test
```

```r
augment(chit)
```

```
## # A tibble: 8 x 9
##   Sex    Class .observed  .prop .row.prop .col.prop .expected .resid .std.resid
##   <fct>  <fct>     <dbl>  <dbl>     <dbl>     <dbl>     <dbl>  <dbl>      <dbl>
## 1 Male   1st         180 0.0818    0.104     0.554      256.   -4.73     -11.1 
## 2 Female 1st         145 0.0659    0.309     0.446       69.4   9.07      11.1 
## 3 Male   2nd         179 0.0813    0.103     0.628      224.   -3.02      -6.99
## 4 Female 2nd         106 0.0482    0.226     0.372       60.9   5.79       6.99
## 5 Male   3rd         510 0.232     0.295     0.722      555.   -1.92      -5.04
## 6 Female 3rd         196 0.0891    0.417     0.278      151.    3.68       5.04
## 7 Male   Crew        862 0.392     0.498     0.974      696.    6.29      17.6 
## 8 Female Crew         23 0.0104    0.0489    0.0260     189.  -12.1      -17.6
```
## 规则
为了保持一致性，我们制定了一些有关返回数据结构的规则。

### 全部函数

1.	tidy, augment 和 glance的输出一定是tibble。

2.	所有的输出都没有行名。这样就可以确保用户将输出的tibble与整理好的数据组合在一起，同时不用担心丢失信息（因为R语言里行名不能有重复）。

3.	有一些列的名称保持一致，以便可以在不同模型之间进行组合，从而输出我们所期望的内容（避免R每次都会问“是pval还是PValue？”）。下面这些示例没有包括所有可能的列名，也不是所有的输出都包含所有这些列，有的输出甚至不包含任何这些列。仅供参考。

### tidy函数

1.	Tidy的每一行输出都指代一些定义明确的概念，例如一个线性回归公式，一项测试或一个类别。虽然在不同模型里的含义不同，但可以比较明显地看出。每行输出并不能指代初始数据点（这个可以用augment函数）。

2.	常见的列名称包括：

•	Term：指正在估计的回归或模型中的术语。

•	p.value：用来匹配R的内置统计信息包中的功能（代替pvalue，PValue或pval）

•	statistic：一种测试统计信息，通常是用于计算p值的统计信息。将这些内容组合到许多子组中来执行（例如自举假设测试法）

•	estimate 估计值

•	conf.low ：estimate的置信区间的下限

•	conf.high ：estimate的置信区间的上限

•	df：自由度

### augment函数

1.	augment(model, data)将列添加到原始数据。

•	如果缺少data参数，可以用augment函数从模型中重建数据（有的时候实现不了，而且通常不会包含模型中未使用的列）。

2.	augment输出中的每一行要与原始数据中的对应行匹配。如果原始数据有行名，augment需要将其转换成名为.rownames的列。

3.	新添加的列名以 . 开头。以避免覆盖原始数据中的列。
常见的列名称包括：

•	.fitted 拟合值：与数据相同规模的预测值。

•	.resid 残差：实际y值减去拟合值

•	.cluster 集群：群集分配

### glance函数

1. glance只能返回一个单行tibble。

•	唯一的例外是glance（NULL）返回一个空的tibble。

2. 我们不会在输出里添加建模函数的参数。例如，glm的输出不需要包含family这个词，因为用户调用glm而不是建模函数本身。

3.	常见的列名称包括：

•	r.squared ：由模型解释的方差

•	adj.r.squared：根据自由度调整方差

•	sigma：残差的估计方差的平方根

