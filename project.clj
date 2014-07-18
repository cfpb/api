(defproject cfpb/api "0.1.0-SNAPSHOT"
  :description "Public Data Platform for the Consumer Financial Protection Bureau"
  :url "http://api.consumerfinance.gov/"
  :license {:name "Public Domain"}
  :dependencies [[org.clojure/clojure "1.5.1"]
                 [qu/qu-core "1.1.3-SNAPSHOT"]]
  :main ^:skip-aot cfpb.api.core
  :target-path "target/%s"
  :jar-exclusions [#"(^|/)\." #"datasets/.*" ]
  :uberjar-exclusions [#"(^|/)\." #"datasets/.*"
                       #"META-INF/.*\.SF" #"META-INF/.*\.[RD]SA"]  
  :profiles {:uberjar {:aot :all}
             :dev {:dependencies [[factual/drake "0.1.3-SNAPSHOT"]]}})
