(defpackage :level-of-tree-max-sum-tests
  (:use :cl :level-of-tree-max-sum :cacau :assert-p))

(in-package :level-of-tree-max-sum-tests)

(defparameter *tree-1* (make-node :value 1
				  :left (make-node :value 4 :left (make-node :value 3) :right (make-node :value 2))
				  :right (make-node :value 5 :left (make-node :value 4) :right (make-node :value -1))))

(defparameter *tree-2* (make-node :value 10
				  :left (make-node :value 4 :left (make-node :value 3) :right (make-node :value 2))
				  :right (make-node :value 5 :left (make-node :value 4) :right (make-node :value -1))))

(defparameter *tree-3* (make-node :value 1
				  :left (make-node :value 4 :left (make-node :value 3) :right (make-node :value 2))
				  :right (make-node :value 5 :left (make-node :value 4) :right (make-node :value 1))))

(deftest "level-of-tree-max-sum-test" ()
  (eql-p 1 (level-of-max-sum *tree-1*))
  (eql-p 0 (level-of-max-sum *tree-2*))
  (eql-p 2 (level-of-max-sum *tree-3*)))
