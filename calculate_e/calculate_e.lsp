(defun fact (a) (
    if (< a 2) 1 (* a (fact (- a 1)))
))
(defun calculate_e (n) (
    if (= n 0) 1 (+ (/ 1 (fact n)) (calculate_e (- n 1)))
))

