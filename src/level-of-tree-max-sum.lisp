(defpackage :level-of-tree-max-sum
  (:use cl iterate)
  (:export make-node value left right level-of-max-sum))

(in-package :level-of-tree-max-sum)

(defstruct (node (:conc-name nil)) value left right)

(defun level-values (root &optional (level 0))
  (when root
    (cons (cons level (value root))
	  (mapcan (lambda (node)
		    (level-values node (1+ level)))
		  (list (left root) (right root))))))

(defun level-of-max-sum (tree)
  (let* ((lvals (level-values tree))
	 (lsums (reduce (lambda (a e)
			  (acons (car e) (+ (cdr e) (or (cdr (assoc (car e) a)) 0)) a)) lvals :initial-value nil)))
    (iterate
      (for i :upfrom 0)
      (for level-value = (assoc i lsums))
      (while level-value)
      (finding (car level-value) :maximizing (cdr level-value)))))
