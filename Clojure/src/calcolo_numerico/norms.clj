(ns calcolo-numerico.norms
  (:require [clojure.core.matrix :as matrix]
            [clojure.math.numeric-tower :as math]))

(defmulti norm (fn [p _] p))

(defmethod norm 1 [_ m]
  (->> m
       matrix/columns
       (map #(apply + %))
       (apply max)))

(defmethod norm 2 [_ m]
  (->> m
       flatten
       (map #(math/expt % 2))
       (apply +)
       math/sqrt))

(defmethod norm :inf [_ m]
  (->> m
       ;; map over rows
       (map #(apply + %))
       (apply max)))
