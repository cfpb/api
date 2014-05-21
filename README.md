CFPB Public Data API
====================

This is the source project for the CFPB public data API at http://api.consumerfinance.gov.

## Create a config file

```sh
cp sample_config.edn config.edn
```

Edit that file with appropriate values, including MongoDB connection information.

## Loading data

To load the HMDA dataset, run `lein repl` and enter the following:

```clj
(-main "config.edn") ;; use the name of your config file. config.edn is an example
(require 'qu.loader)
(in-ns 'qu.loader)
(load-dataset "hmda")
```

Then close your REPL, using `Ctrl-D`.

This does start the web server, so you may want to use a different configuration that starts it on an unpublished port.
