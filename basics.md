---
layout: default
title: API Basics
nav: basics
---

### API basics

HMDA is a GET API which supports three main operations, each designed to save you time and allow you to focus only on
the parts of the data you need.

You can query an entire dataset, but you can also take advantage of different pre-loaded views, or perspectives on a dataset. 
When you're ready to get into the weeds, you can query the nitty-gritty details of a dataset you are interested in.

##### Datasets
The endpoint for getting all data begins with ```/data```. Each dataset has an endpoint at ```/data/{dataset-name}```. This endpoint gives 
all information about a dataset needed to query it. These different views of a dataset are called slices. 

<a href="console/#!/data" onclick="Docs.toggleEndpointListForResource('data');" class="action-arrow">See this in action <i class="icon-right"> </i></a>

##### Slices
Think of slices as tables in a relational database. Every dataset has many slices representing different views of it. The endpoint for
every slice is ```/data/{dataset-name}/{slice-name}```. 

<a href="#" class="action-arrow">See this in action <i class="icon-right"> </i></a>

You can even request a slice in HTML, XML, JSON, JSONP, or CSV. Just append the filename extension to the endpoint like so:
```/data/{dataset-name}/{slice-name.extension}```. 

<a href="#" class="action-arrow">See this in action <i class="icon-right"> </i></a>

##### Concepts
Concepts are analogous to variables, or column headers in a spreadsheet. Concepts have properties, which describe all the possible values. You can also specify concepts in any of the supported file formats like so ```/data/{dataset-name}/{contept-name.extension}```. 

<a href="#" class="action-arrow">See this in action <i class="icon-right"> </i></a>

<body id="basics"></body>