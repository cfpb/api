---
layout: default
title: API Basics
nav: basics
---

## API Basics

### What is a dataset?
The API endpoint for getting all datasets is `/data`.

Each dataset has an endpoint at `/data/<dataset-name>`. This endpoint gives all information about a dataset needed to query it. Each dataset has several slices representing views of the dataset. These are analogous to tables in a relational database.

[See the HMDA datasets and their formats here >](http://mortgages.demo.cfpb.gov/learn-more.html)

### What is a slice?
Each dataset has several slices representing views of the dataset. These are like tables in a relational database. Each slice has an
endpoint at `/data/<dataset-name>/<slice-name>`. All endpoints can have an optional filename extension, so accessing a slice
could use any of the following example URLs:

```
/data/census/population_estimates
/data/census/population_estimates.html
/data/census/population_estimates.csv
```

If the MIME type corresponding to the extension is available, it will be served. If an extension is not used, the request's Accept header will be used to determine what MIME type to serve.

[See a list of all the HMDA slices here >](http://qu.demo.cfpb.gov/data/hmda)

### What is a concept?
Each dataset has defined concepts, which are analogous to variables, or column headers in a spreadsheet. Concepts have properties,
which describe all the possible values.

[See a list of all the HMDA concepts here >](http://qu.demo.cfpb.gov/data/hmda)

### Specifying content type?
You can use a file extension to specify content type. For example, to specify for JSON, you would use:
`/data/hmda/slice/incomes.json`.

### Response format
We support HTML, XML, and JSON data formats. To get a particular format, set your request's Accept header, or suffix the request with the correct file extension. Slices also support the CSV and JSONP data formats. To receive JSONP, use the `.jsonp` file extension and the `$callback` clause.
