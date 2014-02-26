CFPB Public Data API
====================

This is the source project for the CFPB public data API at http://api.consumerfinance.gov.

## Loading data

To load the HMDA dataset, run `lein repl` and enter the following:

```clj
(require 'qu.loader)
(in-ns 'qu.loader)
(mongo/connect!)
(load-dataset "county_taxes")
(load-dataset "census") ; Takes quite a while to run; can skip.
(mongo/disconnect!)
```
