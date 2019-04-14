(ns calcolo-numerico.matrices
  (:require [clojure.core.matrix :as matrix]
            [clojure.core.matrix.operators :as mat-op]
            [calcolo-numerico.vectors :as vectors]))

(defn- hilbert-element [i j]
  (/ 1 (inc (+ i j))))

(defn hilbert [n]
  (matrix/compute-matrix [n n] hilbert-element))

(defn wilkinson [n]
  (let [side   (vectors/ones n)
        center (matrix/abs (range (- (/ (dec n) 2))
                                  (+ (/ n 2))))]
    (mat-op/+ (matrix/shift (matrix/diagonal-matrix side) [-1])
              (matrix/diagonal-matrix center)
              (matrix/shift (matrix/diagonal-matrix side) [1]))))
