(defproject calcolo-numerico "0.1.0-SNAPSHOT"

  :plugins [[reifyhealth/lein-git-down "0.3.2"]]

  :repositories [["github" {:url "git://github.com"}]]

  :dependencies [[org.clojure/clojure "1.10.0"]
                 [org.clojure/math.numeric-tower "0.0.4"]
                 [turlando/core.matrix "28a1939018df81f93c66fb1fff357e39d0ff8925"]]


  :repl-options {:init-ns calcolo-numerico.core}

  :profiles
  {:dev {:dependencies [[org.clojure/tools.namespace "0.2.11"]]}})
