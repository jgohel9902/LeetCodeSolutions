# Problem 35 : Search Insert Position
# Level : Easy
# Given a sorted array of distinct integers and a target value, return the index if the target is found. If not, return the index where it would be if it were inserted in order.
# You must write an algorithm with O(log n) runtime complexity.


 (define/contract (search-insert nums target)
  (-> (listof exact-integer?) exact-integer? exact-integer?)
  (define (binary-search left right)
    (if (>= left right)
        left
        (let* ([mid (quotient (+ left right) 2)]
               [mid-val (list-ref nums mid)])
          (cond
            [(= mid-val target) mid]
            [(< mid-val target) (binary-search (+ mid 1) right)]
            [else (binary-search left mid)]))))
  (binary-search 0 (length nums)))
