---
layout: default
title: Query Language
nav: queries
---

### Query Language

Our query language is based on Socrata's [SoQL language](http://dev.socrata.com/consumers/getting-started#queryingwithsoql). If you're already comfortable with the basics you can
learn how to construct more advanced queries by familiarizing yourself with all the HMDA fields on our [reference page](http://cfpb.github.io/api/hmda/fields), or by using the [metadata endpoints](http://cfpb.github.io/api/hmda/calls) on our console. Otherwise, we have organized this page into two sections to familiarize yourself:

**Querying Data** - An overview of the clauses you can specify what you want returned and what you don't in a slice. If our API was a 
barista at your favorite coffee shop, it could handle even a really complex drink order, no sweat.  
[See this in action](http://cfpb.github.io/api/hmda/calls)

**Summarizing or Aggregating Data** - Once you have the data you need to work with, our API can crunch all the numbers 
for you too. This section explains the ins and outs of how to gain more insight into large and overwhelming data.

##### Querying Data

Use these clauses to filter through millions of records to get only the data you want in a matter of seconds. See the API in action on the [Explore Data](http://consumerfinance.gov/hmda/explore) section of CFPB's HMDA page.

| Clause        | What it does  |
| ------------- | ------------- |
| ```$select``` | Specifies which fields to return, separated by commas. If not specified, all columns will be returned. Use this to [aggregate or summarize data](http://cfpb.github.io/api/hmda/language#aggregating). A list of all fields available is [here](http://cfpb.github.io/api/hmda/fields) or at the [```concept``` endpoint](http://cfpb.github.io/api/hmda/calls). |
| ```$where```  | Filter the results using SQL ```WHERE``` query syntax. If not specified, the results will not be filtered. [Learn more](http://cfpb.github.io/api/hmda/language#where).      |
| ```$orderBy```| Fields to order by, separated by commas, or ASC and DESC. If not specified, the order will be consistent, but unspecified. Used in [aggregating or summarizing data](http://cfpb.github.io/api/hmda/language#orderby).      |
| ```$group```  | Fields to group by, separated by commas. Learn more about [aggregating or summarizing data](http://cfpb.github.io/api/hmda/language#orderby).      |
| ```$limit```  | Maximum number of results to return. If not specified, defaults to ```100```. Enter ```0``` for no limit.      |
| ```$offset``` | Number of records to skip. If not specified, defaults to ```0```.      |
| ```$callback```| The name of the JavaScript callback to invoke in a query. Only used with JSONP.      |

##### More on $where

This clause supports a mini-language for writing queries. It's a subset of SQL WHERE clauses, with the addition of function 
support. A ```$where``` clause is made up of one or more comparisons, joined by boolean operators.

[See a list of possible comparisons]()

|  Operator     | What it means | Example |
| ------------- | ------------- | -------|
| ```=```       | equality      | ```name = "Phillip"```|
| ```!=```      | inequality    | ```state != "Alaska"```|
| ```>```       | greater than  | ```age > 18```|
| ```>=```      | greater than or equal | ```square_miles >= 1000```|
| ```< ``` | less than | ```age < 65```|
| ```<=``` | less than or equal | ```square_miles <= 1000```|
| ```LIKE``` | matches strings | ```name LIKE = "Pete%"``` would match "Pete, "Peter," or anything that starts with "Pete"|
|```ILIKE``` | matches case-insensitive strings | ```name ILIKE = "%rick"``` would match "Rick" as well as "Yorick," "Harrick," or anything else with "rick" in it|
| ```IS NULL``` | existence of a value | ```city is NULL```|
| ```IS NOT NULL``` | non-existence of a value | ```city IS NOT NULL```|

[See a list of possible boolean operators]()

| Operator | What it means | Example |
| -------  | ------------- | ------- |
| ```AND``` | logical AND of two comparisons | ```state = "Alaska" AND age > 18```|
| ```OR``` | logical OR of two comparisons | ```state = "Alaksa" OR state = "Hawaii"``` |
| ```NOT``` | negation of a comparison | ```NOT (state = "Alaska" OR state = "Hawaii"```|
| ```()``` | grouping or order of operations | ```(state = "Alaska" OR state = "Hawaii") AND age > 18```|


### Summarizing and Aggregating Data

In addition to powerful data filtering, you can also aggregate data into summary tables, as seen in the [Summary Tables](https://github.com/pages/data-platform/public-data-platform/explore#summary) section of our HMDA page. The three clauses used in these queries are:

##### $select
This clause takes a list of the fields you want returned, separated by commas.  Unlike the SQL version of ```SELECT```, it does not allow for ```AS``` aliasing, so:

**Right:** ```state_abbr```, ```county```

**Wrong:** ```state_abbr AS state```, ```county```

##### orderBy
This clause determines the order of the results returned. It takes a list of columns, separated by commas, with an optional suffix of ```ASC``` or ```DESC``` to indicate that you want the data in ascending or descending order. For example, if you wanted to see loan applications ordered by gender, and age in descending order, you would use:

```$orderBy = gender, age DESC```

##### $group
This clause lists the fields you want to group results by. For example, if you wanted to see loan applications organized by denial reason, you would use:

```$group = denial_reason```

```$group``` usually requires a ```$select``` clause, where you need to specify the fields you are grouping on, as well as any aggregations you want. 

##### Aggregation Functions
Aggregations are functions run on fields of grouped data in order to reduce them to an associated value. All functions are called with the name of the field to aggregate in parentheses. For example, if you wanted to know the total number of owner-occupied properties per metro area in HMDA, you would use:

```$select: msamd, SUM(numer_of_owner_occupied_units)```

```$group: msamd```

| Function | What it does |
| -------- | ------------ |
| ```SUM``` | Totals the values |
| ```MIN``` | Returns the minimum value in the results |
| ```MAX``` | Returns the maximum value in the results |
| ```COUNT``` | Returns the number of rows in the set, i.e., the number of results. You can use ```COUNT``` for any field |

##### Order matters
When summarizing and aggregating data, take care to know the order in which the clauses and names of the aggregated fields are applied.
 
1. ```$where``` is applied first in order to reduce the amount of data being aggregated
2. The data is then aggregated using ```$group``` and ```$select``` clauses
3. ```$orderBy```
4. ```$limit```, ```$offset```

Then, when you want to use aggregated fields for grouping, name them according to the function you used following
this format:

```function_field_name```

```sum_number_of_owner_occupied_units```

##### That's everything!

You're ready to start building your own queries, and bring HMDA data into your own apps and tools!

Get familiar with the information contained in HMDA on our [field reference page](http://cfpb.github.io/api/hmda/fields) page, and head on over to the [API Calls](http://cfpb.github.io/api/hmda/calls) page to test your queries out in our console.
