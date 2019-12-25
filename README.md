# daily-coding-level-of-tree-max-sum

> Given a binary tree, find the level in the tree where the sum of all nodes on that level is the greatest.

```
    1          Level 0 - Sum: 1
   / \
  4   5        Level 1 - Sum: 9
 / \ / \
3  2 4 -1      Level 2 - Sum: 8

```

### Test

    ccl -e "(ql:quickload :level-of-tree-max-sum/tests)" -e "(asdf:test-system :level-of-tree-max-sum)" -e "(quit)"
