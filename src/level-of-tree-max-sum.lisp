(defpackage :level-of-tree-max-sum
  (:use cl iterate)
  (:export make-node value left right level-of-max-sum))

(in-package :level-of-tree-max-sum)


(defstruct (node (:conc-name nil)) value left right)

(defparameter *tree* (make-node :value 1
				:left (make-node :value 4 :left (make-node :value 3) :right (make-node :value 2))
				:right (make-node :value 5 :left (make-node :value 4) :right (make-node :value -1))))


(defun level-values (root &optional (level 0))
  (when root
    (cons (cons level (value root))
	  (mapcan (lambda (node)
		    (level-values node (1+ level)))
		  (list (left root) (right root))))))

(defun level-of-max-sum (tree)
  (let* ((lvals (level-values tree))
	 (lsums (reduce (lambda (a e)
			  (acons (car e) (+ (cdr e) (or (cdr (assoc (car e) a :test #'eql)) 0)) a)) lvals :initial-value nil)))
    (loop :for i :upfrom 0
	  :for lv = (assoc i lsums :test #'eql)
	  :with max = (cons nil nil)
	  :while lv
	  :when (or (null (cdr max)) (< (cdr max) (cdr lv)))
	    :do (setf max lv)
	  :finally (return (car max)))))
