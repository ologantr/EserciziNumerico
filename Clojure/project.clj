(defproject calcolo-numerico "0.1.0-SNAPSHOT"
  :dependencies [[org.clojure/clojure "1.10.0"]
                 [org.clojure/math.numeric-tower "0.0.4"]
                 [net.mikera/core.matrix "0.62.0"]]

  :repl-options {:init-ns calcolo-numerico.core}

  :profiles
  {:dev {:dependencies [[org.clojure/tools.namespace "0.2.11"]]}})
