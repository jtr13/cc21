# (PART) Topical Discussions {-}

# Zoom session in Finance and Data-Science

Minwoo Choi

This Zoom session was held on Wed (Mar 18) at 4:00 EST

(Food for thought) Systemic approach and its application in finance has a very long history.
Systemic trading, ML driven factor / alpha engine has been around quite a while even though no
one really knows what is actually going on in the industry, it is a very secretive world !
Financial industry, especially trading and investment management business, is an extremely
closed community that is entirely competition driven. Hence, it is very rare to experience other
company's in-house research and models. Also, in my opinion, there is a huge gap between
what we learn in school and cutting-edge models being used in secretive quantitative trading
firms.

This is one reason I am not a big fan of finance anymore. Based on my short experience outside
of the financial industry, I feel that other data science communities are more open and
collaboration based. (e.g. think about Stackoverflow… and TensorFlow is free, but Bloomberg
terminal costs 30k per year)

Second big difference is, data in finance is not static and much more vulnerable to a sudden
regime change. For example, global macro situations, market liquidity can be purely driven by
sudden change in central bank policy. Unlike natural phenomena, the market is man-made and
driven by unnatural forces. Market intervention, manipulation is more often than outsiders
believe.

So, I hear many times (even though mine is at best second hand opinions) that looking into
‘mean-reversion’, ‘overbought, oversold’ indicators will provide a better opportunity than just
looking at ‘static’ price data.

Darko Matovski, CEO of CausaLens, explained two major pitfalls of applying ML in finance data
during the AI and DS in Trading event held this week.
‘Let’s imagine applying deep-learning to US mortgage data that had never failed for 100 years,
and make a prediction. And recall what happened during a financial crisis in a sudden shift in
price dynamics.’ He also emphasized that finance data frequently shows sudden regime
change, and having a proper ‘state status’ setup is crucial for reinforcement learning. (Of
course, he did not reveal his way of building a better simulator, his proprietary models are
reserved for clients only !)
Also, another common problem in ML in finance is people tend to confuse ‘correlation’ to
‘causality’.

Jeff Wecker, CTO of TwoSigma, made another good point during the conference about financial
data. What is special about financial data and its usefulness? In a typical ML or data-science
problem, we strive to make a better prediction using our data. One major problem of using data
for solving financial problems in pursuit of maximizing profit is decaying value of data. First user
who developed a fancy data model takes the most benefit, and then naturally the industry is
being crowded as other users jump in and make a similar prediction based on the same data.
Therefore, the benefit of making a similar prediction and solving a similar financial problem is
rapidly decaying. This is not always the case in other technology fields.

Of course, there’s lots of areas where we can apply data-science, ML techniques in finance.
Any classification, NLP can help operations perform better and save costs. Document sorting,
classification, or making credit decisions, providing a financial planning solution can be rather
easily automated using ML techniques.

One other interesting area could be using K-mean clustering for categorizing financial assets
into multiple groups. This simple technique could be used for liquidity monitoring based on daily
trading volume or volatility, also for categorizing assets into different risk groups for better
portfolio management as well.
