(defsystem "level-of-tree-max-sum"
  :name "level-of-tree-max-sum"
  :version "0.0.1"
  :author "Maris Orbidans"
  :licence "Public Domain"
  :depends-on (:iterate)
  :serial t
  :components ((:module "src"
		:serial t
		:components ((:file "level-of-tree-max-sum"))))
  :in-order-to ((test-op (test-op "level-of-tree-max-sum/tests"))))

(defsystem "level-of-tree-max-sum/tests"
  :licence "Public Domain"
  :depends-on (:level-of-tree-max-sum
	       :cacau
	       :assert-p)
  :serial t
  :components ((:module "tests"
		:components ((:file "level-of-tree-max-sum-tests"))))
  :perform (test-op (o c) (symbol-call 'cacau 'run :colorful t :reporter :list)))
