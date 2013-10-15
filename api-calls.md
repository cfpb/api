---
layout: default
title: API Calls
nav: "api-calls"
---

## API Calls

### Get all datasets
`/data`

For convenience, the root `/` also acts as this endpoint.

#### Get the metadata about a dataset
`/data/:dataset`

This call would give you the [formats](#formats) available for the dataset, its [properties](#properties), [slices](#slices), and [concepts](#concepts).
[See an example here >](#)

#### Get the metadata about a concept
`/data/:dataset/concept/:concept`

This call would give you the [formats](#formats) available for the concept, and its [properties](#properties), which might include a description of the [concepts](#concepts) and any codes that may be associated for all its possible values.

#### Get the metadata about a slice
`/data/:dataset/slice/:slice/metadata`

This call would give you the information about the dataset name, description, all [dimensions](#dimensions), all metrics, types, and all field references for the slice.

#### Query a slice
`/data/:dataset/slice/:slice`

This call allows you to filter a slice on any of its [dimensions](#dimensions), metrics, and clauses. You can specify the [format](#format) in which the data is returned to you.
