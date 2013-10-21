---
layout: default
title: Data Formats
nav: formats
---

## Publishing data with Qu

Before the definition of a dataset is loaded, Qu attempts to retrieve the needed data files and manipulate them however necessary. This is done using [Drake](https://github.com/Factual/drake), a processing language for data, much like the `make` language for Unix program compilation. Drake will attempt to execute every task in a `Drakefile` in the same directory as your dataset definition. See the Drake README and wiki for more information on writing a `Drakefile`, or view [a sample one used for HMDA data](https://github.com/cfpb/qu/blob/eee6d9ed895705cb6e84d521aa3998798e7c67ed/resources/datasets/hmda/Drakefile).

**NOTE:** For people modifying Qu, be aware that Drake allows for arbitrary code to be executed on your computer. Do not accept Drakefiles from untrusted sources.

[Skip down to publishing formats >](#supported-data-formats)

### Supported data formats

We support HTML, XML, and JSON data formats. To get a particular format, set your request's Accept header, or suffix the request with the correct file extension.

Slices also support the CSV and JSONP data formats. To receive JSONP, use the .jsonp file extension and the $callback clause.

### CSV

CSV is a simple format to receive data, but a more difficult format for sending metadata.

Links to other resources are given with a `Link` header in the response. Metadata is not currently sent with CSV.

### REST

Qu has a [REST](https://en.wikipedia.org/wiki/Representational_state_transfer) API, which means three things:

- All resources in the system -- datasets, slices, and views of those slices -- have unique URLs that will always correspond to them.
- All resources in the system should have enough metadata attached to them that you can figure out how to process them without consulting external documentation.
- All resources in the system use hypermedia to point to related resources and more specific views of the currently viewed resource. This concept is often called "Hypermedia as the engine of application state" or [HATEOAS](https://en.wikipedia.org/wiki/HATEOAS).


### HTML

The HTML format is used mainly for exploring the API. It not only returns query data, but presents query forms for digging into the data. The text of the page should contain links to all other resources available from a page.

In addition to the page text indicating links to all other resources available from a page, the `<head>` element should contain `<link>` elements with appropriate `rel` attributes pointing to other resources.

### JSON

JSON uses the [Hypertext Application Language (HAL)](http://stateless.co/hal_specification.html) format to convey links to related resources. Links are found under the `_links` key and linked resources are found under the `_embedded` key.

#### Here is an example of the format for the URL `/data/county_taxes/incomes.json`:


    {
      "_links": {
        "self": { "href": "/data/county_taxes/incomes.json" }
        "next": { "href": "/data/county_taxes/incomes.json?$page=2" },
        "last": { "href": "/data/county_taxes/incomes.json?$page=12" },
        "up": { "href": "/data/county_taxes.json" },
        "query": {
          "href": "/data/county_taxes/incomes.{?format}?$where={?where}&$orderBy={?orderBy}&$select={?select}",
          "templated": true
        }
      },
      "total": 1149,
      "size": 100,
      "page": 1,
      "metadata": {
        // TODO - not yet determined
      },
      "results": [
    {"interest_income":12695,"dividend_income":3802,"wages_and_salaries_income":885899,"adjusted_gross_income":1063207,"exceptions":53353,"tax_returns":20563,"county":"Tooele County","state_abbr":"UT"},
    {"interest_income":215544,"dividend_income":82411,"wages_and_salaries_income":6475118,"adjusted_gross_income":8655581,"exceptions":435704,"tax_returns":157947,"county":"Utah County","state_abbr":"UT"},
    {"interest_income":1642,"dividend_income":741,"wages_and_salaries_income":27261,"adjusted_gross_income":41007,"exceptions":2450,"tax_returns":1050,"county":"Wayne County","state_abbr":"UT"},
    // ...
      ]
    }

### XML

XML uses the [Hypertext Application Language (HAL)](http://stateless.co/hal_specification.html) format to convey links to related resources. Links are found under the `_links` key and individual datums are found under the `_embedded` key.

#### Here is an example of the format for the URL `/data/county_taxes/incomes.xml`:

    <resource href="/data/county_taxes/incomes.xml">
      <link rel="self" href="/data/county_taxes/incomes.xml" />
      <link rel="next" href="/data/county_taxes/incomes.xml?$page=2" />
      <link rel="last" href="/data/county_taxes/incomes.xml?$page=12" />
      <link rel="up" href="/data/county_taxes.xml" />
      <link rel="query"
            href="/data/county_taxes/incomes.{?format}?$where={?where}&$orderBy={?orderBy}&$select={?select}"
            templated="true" />
      <total>1149</total>
      <size>100</size>
      <page>1</page>
      <metadata>
        <!-- TODO not yet determined -->
      </metadata>
      <results>
        <result>
          <interest_income>12695</interest_income>
          <dividend_income>3802</dividend_income>
          <wages_and_salaries_income>885899</wages_and_salaries_income>
          <adjusted_gross_income>1063207</adjusted_gross_income>
          <exceptions>53353</exceptions>
          <tax_returns>20563</tax_returns>
          <county>Tooele County</county>
          <state_abbr>UT</state_abbr>
        </result>
        <!-- more results -->
      </results>
    </resource>

### Dataset publishing format
The format datasets are published and loaded in is highly influenced by [Google's Dataset Publishing Language](https://developers.google.com/public-data/overview) (DSPL). DSPL uses XML to define a dataset and CSV to hold the data; we instead use JSON and CSV, and we use a subset of the definition that Google does, but otherwise the format is the same. Note that you can include any information inside the dataset definition as long as it is valid JSON. This data could be used later by new features.

#### Here is an example, broken up into sections. [See the full definition here >](#)

    "info": {
      "name": "Tax Year 2007 County Income Data",
      "description": "Contains selected individual income tax return data items classified by state and county.",
      "url": "https://explore.data.gov/Population/Tax-Year-2007-County-Income-Data/wvps-imhx"
    }

#### Specifying information about the dataset

Here we specify general information about the dataset: the name and description we want to display for it, and the URL you can get more information from.

The `info` section is **required**. Within this section, `name` is **required**, while `description` and `url` are **optional, but recommended**.

#### Specifying information about a concept

    "concepts": {
        "state": {
          "name": "State Abbreviation",
          "type": "string",
          "table": "states",
          "properties": {
            "name": {
              "name": "Name",
              "description": "The name of the state",
              "type": "string"
            }
          }
        },
        "county": {
          "name": "County"
        },
        "tax_returns": {
          "name": "Total Number of Tax Returns"
        },
        "adjusted_gross_income": {
          "name": "Adjusted Gross Income (In Thousands)"
        },
        "wages_and_salaries_income": {
          "name": "Wages and Salaries (In Thousands)"
        },
        "dividend_income": {
          "name": "Dividend Income (In Thousands)"
        },
        "interest_income": {
          "name": "Interest Income (In Thousands)"
        }
      }

Currently, *concepts* are not full-featured. Within each concept, you can specify information about that concept. `name` will be displayed in place of the field short name within the user interface. `type`, `table`, and `properties` will be used in the future.

The `concepts` section is **recommended**, as is `name` within each concept.

#### Specifying information about a slice

    "slices": {
      "incomes": {
        "type": "table",
        "table": "incomes",
        "dimensions": [
          "state", "county"
        ],
        "metrics": [
          "tax_returns",
          "adjusted_gross_income",
          "wages_and_salaries_income",
          "dividend_income",
          "interest_income"
        ]
      },
      "incomes_by_state": {
        "type": "derived",
        "slice": "incomes",
        "dimensions": [
          "state"
        ],
        "metrics": [
          "tax_returns",
          "adjusted_gross_income",
          "wages_and_salaries_income",
          "dividend_income",
          "interest_income"
        ],
        "aggregations": {
          "tax_returns": ["sum", "tax_returns"],
          "adjusted_gross_income": ["sum", "adjusted_gross_income"],
          "wages_and_salaries_income": ["sum", "wages_and_salaries_income"],
          "dividend_income": ["sum", "dividend_income"],
          "interest_income": ["sum", "interest_income"]
        }
      }
    }

*Slices* are sections of the dataset. (Google refers to them as "a combination of concepts for which data exist.")

There are two types of slices currently: *table-backed* slices and *derived* slices, determined by the value of `type`.

A table-backed slice (with a `type` of `table`) is backed by a database table, specified by table. Within each slice, there are *dimensions*, which are concepts used to filter and query your data, and *metrics*, observed values associated with a data point. All dimensions will be indexed.

A derived slice contains aggregated data from another slice, specified by `slice`. The dimensions specified are taken from the referenced slice and are used to aggregate the data. All the data for each unique collection of dimension values from the referenced slice are collected and "rolled up" under that collection of values. The `aggregations` section specifies how to aggregate that rolled-up data, being an array with the first value being an aggregation function (`count`, `sum`, `min`, and `max`) and the second value being a metric or dimension in the original slice. Lastly, the `metrics` section is used to specify what the metrics of the derived slice are and will usually be a collection of the keys from the `aggregations` section. (**TODO**: Is `metrics` necessary for derived slices?)

The `slices` section is **required**. Within each slice, `type`, `dimensions`, and `metrics` are **required**. Within slices with a `type` of `table`, `table` is **required**. Within slices with a `type` of `derived`, `slice` is **required**.


#### Tables

    "tables": {
      "incomes": {
        "sources": [
          "Tax_Year_2007_County_Income_Data.csv"
        ],
        "columns": {
          "County Code": {
            "skip": true
          },
          "State Abbreviation": {
            "name": "state_abbr",
            "type": "string"
          },
          "County Name": {
            "name": "county",
            "type": "string"
          },
          "Total Number of Tax Returns": {
            "name": "tax_returns",
            "type": "integer"
          },
          "Total Number of Exemptions": {
            "name": "exceptions",
            "type": "integer"
          },
          "Adjusted Gross Income (In Thousands)": {
            "name": "adjusted_gross_income",
            "type": "dollars"
          }
          // ...
        }
      }
    }

Tables are storage for a dataset. Each table has one or more sources, which are CSV files. Each table also has one or more columns, which define the transformation of data from the CSV files to the database. Within the `columns` section, each key is the name of a column in the CSV file. The dictionary associated with each column contains a name, which is what the concept name for that column will be (and is the name used when storing the data) and a type, which tells the importer how to translate the information in the CSV, which is all strings, into a data value. The column can also contain `skip`, which if true, tells the importer to throw away that column.

The `tables` section is **required**. Within each table, the `sources` and `columns` sections are **required**. Within each column, `name` and `type` are **recommended** if `skip` is not true. If `name` is left out, the column name will be used. If `type` is left out, `string` will be used. Current supported types are:

- string
- integer
- date
- dollars (strips off leading dollar sign and converts to an integer)
- lookup (looks up the value in a dictionary provided, see this [definition](https://github.com/cfpb/qu/blob/a80370b83407f726f9a550e5067a1f87178aa74e/resources/datasets/census/definition.json#L73) for more details)

If `date` is used, a `format` should be specified, using "YYYY" to represent the year, "MM" the month, and "dd" the day. If a format is not specified, "YYYY/MM/dd" and "YYYY-MM-dd" are both valid formats.


