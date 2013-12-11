---
layout: default
title: API Basics
nav: basics
---

### API basics

HMDA is a GET API which supports three main operations, each designed to save you time and allow you to focus only on
the parts of the data you need. It lives at ```https://api.consumerfinance.gov/data/hmda```.

You can query an entire dataset, but you can also take advantage of different pre-loaded views, or perspectives on a dataset. 
When you're ready to get into the weeds, you can query the nitty-gritty details of a dataset you are interested in.

##### Datasets
The endpoint for getting all data begins with ```/data```. Each dataset has an endpoint at ```/data/{dataset-name}```. This endpoint gives 
all information about a dataset needed to query it. These different views of a dataset are called slices. 

<a href="console/#!/data/getDataset_get_1" class="action-arrow">See this in action <i class="icon-right"> </i></a>

##### Concepts
Concepts are analogous to variables, or column headers in a spreadsheet. Concepts have properties, which describe all the possible values. You can also specify concepts in any of the supported file formats like so ```/data/{dataset-name}/{contept-name.extension}```. 

<a href="console/#!/hmda/getConceptHmda_get_1" class="action-arrow">See this in action <i class="icon-right"> </i></a>

##### Slices
Think of slices as tables in a relational database. Every dataset has many slices representing different views of it, which you can use to <a href="queries.html">construct advanced queries</a>. The endpoint for
every slice is ```/data/{dataset-name}/{slice-name}```. 

You can even request a slice in HTML, XML, JSON, JSONP, or CSV. Just append the filename extension to the endpoint like so:
```/data/{dataset-name}/{slice-name.extension}```. 

<a href="console/#!/hmda/querySliceHmda_get_2" class="action-arrow"> See this in action <i class="icon-right"> </i></a>

##### Putting it all together
Every year, the Federal Reserve finds interesting trends in HMDA data and publishes them in a report. Let's say you want to replicate some of their [2012 highlights](http://www.consumerfinance.gov/hmda/learn-more#highlights). 

To compare refinances and home purchases in 2012, you would send the following query to the API:
<pre>https://api.consumerfinance.gov/data/hmda/slice/hmda_lar.json?%24group=denial_reason_name_1,county_name,applicant_ethnicity_name&amp;%24orderBy=applicant_ethnicity_name,county_name,denial_reason_name_1&amp;%24select=COUNT(),denial_reason_name_1,county_name,applicant_ethnicity_name&amp;%24where=as_of_year=2012+AND+state_code=25+AND+(property_type=1+OR+property_type=2)+AND+owner_occupancy=1+AND+lien_status=1+AND+action_taken=1&amp;%24limit=0&amp;_=1382870699628</pre>
<a href="console/#!/hmda/querySliceHmda_get_2" class="action-arrow"> See this in action <i class="icon-right"> </i></a>

To see changes in the FHA loan market for 2012, you would send the following query to the API:
<pre>https://api.consumerfinance.gov/data/hmda/slice/hmda_lar.json?%24group=denial_reason_name_1,county_name,applicant_ethnicity_name&amp;%24orderBy=applicant_ethnicity_name,county_name,denial_reason_name_1&amp;%24select=COUNT(),denial_reason_name_1,county_name,applicant_ethnicity_name&amp;%24where=as_of_year=2012+AND+state_code=25+AND+(property_type=1+OR+property_type=2)+AND+owner_occupancy=1+AND+lien_status=1+AND+action_taken=1&amp;%24limit=0&amp;_=1382870699628</pre>
<a href="console/#!/hmda/querySliceHmda_get_2" class="action-arrow"> See this in action <i class="icon-right"> </i></a>

<body id="basics"></body>
