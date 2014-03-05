(ns cfpb.api.core
  (:gen-class)
  (:require
   [qu.app :refer [new-qu-system]]
   [com.stuartsierra.component :as component]))

(defn qu-config
  "Return a configuration map for Qu. You can find a schema for the
  configuration map in cfpb.qu.app.options/OptionsS."
  []
  {:dev true
   :http {:ip "0.0.0.0"
          :port 3000
          :threads 4
          :queue-size 20480
          :view {:base_url ""
                 :api_name "CFPB Public Data API"}}
   :mongo {:conn {:host "127.0.0.1"
                  :port 27017}
           :options {:connect-timeout 2000}}
   :log {:level :info}})

(defn load-config
  "Load configuration from an outside file."
  [config-file]
  (binding [*read-eval* false]
    (read-string (slurp config-file))))

(defn -main
  "Start the Qu system."
  [& args]
  (let [config (if (= (count args) 1)
                 (load-config (first args))
                 (qu-config))]
    (component/start (new-qu-system config))))

