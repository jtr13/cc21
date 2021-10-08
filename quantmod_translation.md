
# R Quantmod Package Tutorial & Translation

Jiashu Xia 


From my other courses at Columbia, we have used the package Quantmod in R to access & analyze financial data. I found that this package was not only useful but also convenient in a sense that we do not have to go to other sources and load the data into R. The source that I found below introduces some basic applications and functions of Quantmod, which would be very helpful for those using R in the financial industry. I decided to do a translation of the blog so that it could benefit Chinese people who are not familiar with Quantmod or English.

Source: https://blog.quantinsti.com/a-guide-on-r-quantmod-package-how-to-get-started/



## “R的quantmod软件包旨在帮助定量交易者开发，测试和部署基于统计交易的模型。”

这是一个快速的原型制作环境，发烧友可以轻松地探索各种技术指标。它提供了R中其他地方没有地制图工具。Quantmod软件包使建模更加容易，分析也变得简单。本文旨在使用样本市场数据介绍Quantmod一些功能。分三部分介绍了Quantmod地功能：下载数据，绘制图表，技术指标和其他功能。

事不迟疑，我们将看到quantmod软件包地用法。

### 下载资料
一旦安装了Quantmod软件包并加载了库，请运行以下命令以将Apple.Inc股票地数据获取到R控制台中。

```r
library(quantmod)
getSymbols('AAPL')
```

```
## [1] "AAPL"
```

要查看数据的起点，请输入以下命令。

```r
head(AAPL) # 您应该看到以下结果。
```

```
##            AAPL.Open AAPL.High AAPL.Low AAPL.Close AAPL.Volume AAPL.Adjusted
## 2007-01-03  3.081786  3.092143 2.925000   2.992857  1238319600      2.569716
## 2007-01-04  3.001786  3.069643 2.993571   3.059286   847260400      2.626754
## 2007-01-05  3.063214  3.078571 3.014286   3.037500   834741600      2.608047
## 2007-01-08  3.070000  3.090357 3.045714   3.052500   797106800      2.620926
## 2007-01-09  3.087500  3.320714 3.041071   3.306071  3349298400      2.838647
## 2007-01-10  3.383929  3.492857 3.337500   3.464286  2952880000      2.974493
```

### 可视化图表
Quantmod的优点在于它可以可视化图表。输入以下命令。

```r
chartSeries(AAPL, TA = NULL) # 这将产生以下图表。
```

<img src="quantmod_translation_files/figure-html/unnamed-chunk-3-1.png" width="672" style="display: block; margin: auto;" />

可以看到，x轴显示时间段，而y轴显示AAPL股票的价格范围。在上面的命令中，我们设置TA="Null"。这意味着不包括任何“技术分析”参数。以下命令将生产与音量参数相同的图形。

```r
barChart(AAPL)
```

<img src="quantmod_translation_files/figure-html/unnamed-chunk-4-1.png" width="672" style="display: block; margin: auto;" />

该图形与上一个图之间的显著差异是AAPL的体积表示。其术语法旨在装饰图表外观。

我们将选择收盘价作为参考，并据此计算各种技术指标。以下命令选择苹果公司的收盘价。

```r
Apple_closeprice = Cl(AAPL)  #我们将收盘价分配给名为Apple_closeprice的新变量。
plot(Apple_closeprice) # 绘制收盘价
```

<img src="quantmod_translation_files/figure-html/unnamed-chunk-5-1.png" width="672" style="display: block; margin: auto;" />

绘制直方图很简单。


```r
hist(AAPL[,4]) # 此命令绘制了苹果股票收盘价的直方图
```

<img src="quantmod_translation_files/figure-html/unnamed-chunk-6-1.png" width="672" style="display: block; margin: auto;" />


```r
hist(AAPL[,4], main = "Apple Close") #标题为"Apple Close" 的苹果股票收盘价直方图。
```

<img src="quantmod_translation_files/figure-html/unnamed-chunk-7-1.png" width="672" style="display: block; margin: auto;" />

```r
hist(AAPL[,4], main = "Apple Close", breaks =25) #引入更多价格范围。
```

<img src="quantmod_translation_files/figure-html/unnamed-chunk-7-2.png" width="672" style="display: block; margin: auto;" />

### 技术指标


```r
chartSeries(AAPL)
```

<img src="quantmod_translation_files/figure-html/unnamed-chunk-8-1.png" width="672" style="display: block; margin: auto;" />

```r
addMACD() #将移动平均收益散度信号添加到苹果股票中
```

<img src="quantmod_translation_files/figure-html/unnamed-chunk-8-2.png" width="672" style="display: block; margin: auto;" />

```r
addBBands() #将布林带添加到苹果股票中。
```

<img src="quantmod_translation_files/figure-html/unnamed-chunk-8-3.png" width="672" style="display: block; margin: auto;" />

```r
addCCI() #添加商品渠道索引。
```

<img src="quantmod_translation_files/figure-html/unnamed-chunk-8-4.png" width="672" style="display: block; margin: auto;" />

```r
addADX() #添加方向运动指示器
```

<img src="quantmod_translation_files/figure-html/unnamed-chunk-8-5.png" width="672" style="display: block; margin: auto;" />

```r
addCMF() #添加Chaiken资金流
```

<img src="quantmod_translation_files/figure-html/unnamed-chunk-8-6.png" width="672" style="display: block; margin: auto;" />

同样，可以计算其他技术指标。以下是quantmod支持的技术指标列表。

```r
addCMO # Add Chaiken Money Flow

addDEMA # Add Double Exponential Moving Average

addDPO # Add Detrended Price Oscillator

addEMA # Add Exponential Moving Average

addEnvelope # Add Price Envelope

addEVWMA # Add Exponential Volume Weigthed Moving Average

addMACD # Add Moving Average Convergence Divergence

addMomentum # Add Momentum

addROC # Add Rate of Change

addRSI # Add Relative Strength Indicator

addSAR # Add Parabolic Stop and Reverse

addSMA # Add Simple Moving Average

addSMI # Add Stocastic Momentum Index

addTRIX # Add Triple Smoothed Exponential Oscillator

addVo # Add Volume

addWMA # Add Weighted Moving Average
```

我们将看看quantmod的数据处理功能。前面我们看到下载的Apple数据具有以下结构。

```
##            AAPL.Open AAPL.High AAPL.Low AAPL.Close AAPL.Volume AAPL.Adjusted
## 2007-01-03  3.081786  3.092143 2.925000   2.992857  1238319600      2.569716
## 2007-01-04  3.001786  3.069643 2.993571   3.059286   847260400      2.626754
## 2007-01-05  3.063214  3.078571 3.014286   3.037500   834741600      2.608047
## 2007-01-08  3.070000  3.090357 3.045714   3.052500   797106800      2.620926
## 2007-01-09  3.087500  3.320714 3.041071   3.306071  3349298400      2.838647
## 2007-01-10  3.383929  3.492857 3.337500   3.464286  2952880000      2.974493
```

### 有用的功能

Quantmod提供了探索数据框特征的功能。以下命令显示保存苹果数据的对象类型是xts和zoo。

```r
class(AAPL)
```

```
## [1] "xts" "zoo"
```

人们可能想探索提取的数据是否包含开盘价，交易量等。看一下以下命令。

```r
is.OHLC(AAPL) #检查xts对象数据是否具有开盘价，最高价，最低价和收盘价？
```

```
## [1] TRUE
```

输出为TRUE，表示数据对象包含开盘，高，低，和收盘价。


```r
has.Vo(AAPL) # Checks whether the data object has volume

seriesHi(AAPL) # To check the highest point of price.

Lag(Cl(AAPL)) #One period lag of the closing price

Next(OpCl(AAPL)) #The next periods open to close - today!

AAPL ['2007'] #Fetches all Apple’s 2007 OHLC

AAPL ['2008::'] # Apple data, from 2008 onward

dailyReturn(AAPL) # Returns by day

weeklyReturn(AAPL) # Returns by week

monthlyReturn(AAPL) # month, indexed by yearmon  daily,weekly,monthly,quarterly, and yearly

allReturns(AAPL) # note the plural
```

### 下一步

如果您是新手，但不能掌握本文的所有技术知识，则不妨查看几篇文章，其中介绍了一些基本概念，例如在R中设计量化交易策略。您还可以看一下用R编码的交易策略的基本示例。

#### 免责声明：股票中的所有投资和交易均涉及风险。在金融市场进行交易的任何决定（包括股票或期权或其他金融工具的交易）都是个人决定，只有在进行全面研究后才能做出，包括个人风险和财务评估以及在您所能及的范围内寻求业务协助是很有必要的。本文中提到的交易策略或相关信息仅供参考。


