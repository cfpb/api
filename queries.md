---
layout: default
title: Query Language
nav: queries
---

## Query Language

Our query language is based on Socrata's [SoQL](http://dev.socrata.com/consumers/getting-started#queryingwithsoql) language. Queries are simple GET parameters sent to a slice endpoint.

### Dimensions
Certain fields of a slice are dimensions. Dimensions are usually fields that have one of a series of values, such as a state field having one of the 50 US States, or a marital_status field having Single, Widowed, Divorced, or Separated.

`/data/census/population_estimates?state=Nebraska`

### Clauses

Most queries will involve more than simple equality queries. For these, we have a set of clauses you can use.

<table class="table table-bordered table-striped">
<thead>
<tr>
<th>Clause</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr>
<td><code>$select</code></td>
<td>Which columns to return. If not specified, all columns will be returned.</td>
</tr>
<tr>
<td><code>$where</code></td>
<td>Filter the results. This uses the <a href="#where_in_detail">WHERE query syntax</a>. If not specified, the results will not be filtered.</td>
</tr>
<tr>
<td><code>$orderBy</code></td>
<td>Order to return the results. If not specified, the order will be consistent, but unspecified.</td>
</tr>
<tr>
<td><code>$group</code></td>
<td>Column to group results on.</td>
</tr>
<tr>
<td><code>$limit</code></td>
<td>Maximum number of results to return. If not specified, this defaults to 100. This has a hard limit of 1000.</td>
</tr>
<tr>
<td><code>$offset</code></td>
<td>Offset into the results to start at. If not specified, this defaults to 0.</td>
</tr>
<tr>
<td><code>$page</code></td>
<td>the page of results to return. if not specified, this defaults to 1. If <code>$page</code> is given, <code>$offset</code> is ignored.</td>
</tr>
<tr>
<td><code>$perPage</code></td>
<td>How many results to return per page. This is a synonym for <code>$limit</code>.</td>
</tr>
<tr>
<td><code>$callback</code></td>
<td>The name of the callback function used in a JSONP query. Only used with JSONP.</td>
</tr>
</tbody>
</table>


### $where
This clause supports a mini-language for writing queries. This language is a subset of SQL WHERE clauses, with the addition of function support. A `$where` clause is made up of one or more comparisons, joined by *boolean* operators.

##### Comparisons
#### See a list of comparisons possible

<table class="table table-bordered table-striped"><thead>
<tr>
<th>Operator</th>
<th>Description</th>
<th>Example</th>
</tr>
</thead><tbody>
<tr>
<td><code>=</code></td>
<td>equality</td>
<td><code>name="Phillip"</code></td>
</tr>
<tr>
<td><code>!=</code></td>
<td>inequality</td>
<td><code>state != "Alaska"</code></td>
</tr>
<tr>
<td><code>&gt;</code></td>
<td>greater than</td>
<td><code>age &gt; 18</code></td>
</tr>
<tr>
<td><code>&gt;=</code></td>
<td>greater than or equal</td>
<td><code>square_miles &gt;= 1000</code></td>
</tr>
<tr>
<td><code>&lt;</code></td>
<td>less than</td>
<td><code>age &lt; 18</code></td>
</tr>
<tr>
<td><code>&lt;=</code></td>
<td>less than or equal</td>
<td><code>square_miles &lt;= 1000</code></td>
</tr>
<tr>
<td><code>LIKE</code></td>
<td>string matching</td>
<td><code>name LIKE "Pete%"</code> (would match "Pete", "Peter", or anything that starts with "Pete")</td>
</tr>
<tr>
<td><code>ILIKE</code></td>
<td>case-insensitive string matching</td>
<td><code>name ILIKE "%rick"</code> (would match "Rick" as well as "Yorick", "Harrick", or anything else with "rick" in it)</td>
</tr>
<tr>
<td><code>IS NULL</code></td>
<td>existence of a value</td>
<td><code>city IS NULL</code></td>
</tr>
<tr>
<td><code>IS NOT NULL</code></td>
<td>non-existence of a value</td>
<td><code>city IS NOT NULL</code></td>
</tr>
</tbody></table>

#### See a list of boolean operators possible

<table class="table table-bordered table-striped"><thead>
<tr>
<th>Operator</th>
<th>Description</th>
<th>Example</th>
</tr>
</thead><tbody>
<tr>
<td><code>AND</code></td>
<td>logical AND of two comparisons</td>
<td><code>state = "Alaska" AND age &gt; 18</code></td>
</tr>
<tr>
<td><code>OR</code></td>
<td>logical OR of two comparisons</td>
<td><code>state = "Alaska" OR state = "Hawaii"</code></td>
</tr>
<tr>
<td><code>NOT</code></td>
<td>negation of a comparison</td>
<td><code>NOT (state = "Alaska" OR state = "Hawaii")</code></td>
</tr>
<tr>
<td><code>()</code></td>
<td>grouping for order of operations</td>
<td><code>(state = "Alaska" OR state = "Hawaii") AND age &gt; 18</code></td>
</tr>
</tbody></table>

### Aggregating Data
The content for this section comes directly as is written here: [http://cfpb.github.io/qu/articles/queries.html](http://cfpb.github.io/qu/articles/queries.html).

#### $ select
`$select` is a simple clause: in the normal case, it takes a list of fields you wish returned, separated by commas. Unlike the SQL version of `SELECT`, it does not allow for `AS` aliasing:

- **Right** `state_abbr, county`
- **Wrong** `state_abbr AS state, county`


#### $ group

`$group` lists fields you wish to group results by. For example, if you wanted to see the total number of tax returns by state in the included county taxes dataset, you would set `$group` equal to state_abbr.

#### Running the aggregation

`$group` requires a `$select` clause. In this `$select` clause, you will want to put the fields you are grouping on, as well as any aggregations you want. Aggregations are functions run on fields of the grouped data in order to reduce them to an associated value.

<table class="table table-bordered table-striped"><thead>
<tr>
<th>Aggregation function</th>
<th>Result</th>
</tr>
</thead><tbody>
<tr>
<td><code>SUM</code></td>
<td>Totals the values.</td>
</tr>
<tr>
<td><code>MIN</code></td>
<td>Returns the minimum value in the set.</td>
</tr>
<tr>
<td><code>MAX</code></td>
<td>Returns the maximum value in the set.</td>
</tr>
<tr>
<td><code>COUNT</code></td>
<td>Returns the number of rows in the set. <code>COUNT</code> can be called with any field and will return the same thing.</td>
</tr>
</tbody></table>


#### $ orderBy

The `$orderBy` clause determines the order of the results returned. This takes a list of columns, separated by commas, with an optional suffix of `desc` to indicate that you want the data in descending order.

Examples:


	$orderBy=age
	$orderBy=state, square_miles
	$orderBy=age desc, gender
