(defproject cfpb/api "0.1.0-SNAPSHOT"
  :description "FIXME: write description"
  :url "http://example.com/FIXME"
  :license {:name "Eclipse Public License"
            :url "http://www.eclipse.org/legal/epl-v10.html"}
  :dependencies [[org.clojure/clojure "1.5.1"]
                 [qu/qu-core "1.1.0-SNAPSHOT"]]
  :main ^:skip-aot cfpb.api.core
  :target-path "target/%s"
  :jar-exclusions [#"(^|/)\." #"datasets/.*" ]
  :uberjar-exclusions [#"(^|/)\." #"datasets/.*"
                       #"META-INF/.*\.SF" #"META-INF/.*\.[RD]SA"]  
  :profiles {:uberjar {:aot :all}
             :dev {:dependencies [[factual/drake "0.1.3-SNAPSHOT"]]}})
