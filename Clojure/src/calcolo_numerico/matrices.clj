(ns calcolo-numerico.matrices
  (:require [clojure.math.numeric-tower :as math]
            [clojure.core.matrix :as matrix]
            [calcolo-numerico.vectors :as vectors]))

(defn- hilbert-element [i j]
  (/ 1 (inc (+ i j))))

(defn hilbert [n]
  (matrix/compute-matrix [n n] hilbert-element))

(defn wilkinson [n]
  (let [side   (vectors/ones n)
        center (matrix/emap math/abs (range (- (/ (dec n) 2))
                                            (+ (/ n 2))))]
    (matrix/add
     (matrix/shift (matrix/diagonal-matrix side) [-1])
     (matrix/diagonal-matrix center)
     (matrix/shift (matrix/diagonal-matrix side) [1]))))

(defn toeplitz [n]
  (let [xs     (range 1 (inc n))
        diag   (matrix/diagonal-matrix (repeat n (first xs)))
        uppers (for [i (range 1 n)]
                 (matrix/shift (matrix/diagonal-matrix (repeat n (nth xs i))) [i]))
        lowers (map matrix/transpose uppers)]
    (matrix/add (apply matrix/add uppers)
                diag
                (apply matrix/add lowers))))
