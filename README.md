CFPB Public Data API
====================

This is the source project for the CFPB public data API at http://api.consumerfinance.gov. It contains up-to-date load scripts for populating data in that API. Note, however, that the `resources/static/` directory is a work in progress; refer to https://github.com/cfpb/qu/tree/master/resources/static for the current static resources.

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

## Speeding up data load
You can take advantage of more CPU and Ram by concurrently loading chunks of data by splitting the large data file 
into smaller files with 1 million records each. 

```./hmda_split_csv.sh hmda_lar_all_2012.csv split_hmda_2012_``` 

Then update the definition.json file to load these split files instead of the single CSV. Edit the hmda_lar sources 
section and replace it with a list of all the split files for the year you're targeting. 

For example, for 2012, it looks like this:
```
   "sources": [
"split_hmda_2012_aa",
"split_hmda_2012_ab",
"split_hmda_2012_ac",
"split_hmda_2012_ad",
"split_hmda_2012_ae"
]
```



