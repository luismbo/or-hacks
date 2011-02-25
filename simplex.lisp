;;;; -*- indent-tabs-mode: nil -*-
;;;
;;; Naive Simplex Implementation
;;;
;;; The datastructure used for the tableau is silly: a single matrix
;;; that includes row and column labels. Partly due to that choice of
;;; datastructure, the code's got too many magic constants. The upside
;;; is that it closely matches the matrix in Ch. 4 of POaGI.
;;;
;;; Next steps:
;;;   * clean up / pick a better datastructure
;;;   * address UPDATE-TABLEAU's TODOs
;;;   * validate with larger LPs
;;;
;;; Re: performance. We /could/ use BLAS/LAPACK via GSLL for gaussian
;;; elimination and such, but that would probably be overkill for our
;;; educational purposes.
;;;
;;; Re: dependencies. Quicklisp!
;;;

(defpackage :simplex (:use :cl :iterate)
  (:import-from :alexandria #:copy-array #:when-let))
(in-package :simplex)

(defun simplex (tableau)
  "Solve a TABLEAU in proper form."
  (if (optimal? tableau)
      tableau
      (let* ((evar (select-entering-basic-variable tableau))
             (lvar (select-leaving-basic-variable tableau evar)))
        (simplex (update-tableau tableau evar lvar)))))

;; Ew.
(defun restriction-count (tableau)
  (- (array-dimension tableau 0) 2))

;; Ew.
(defun variable-count (tableau)
  (- (array-dimension tableau 1)        ; total # of columns
     3                                  ; BV, Z, RHS columns
     (restriction-count tableau)))

(defun z-coefficient (tableau var)
  (aref tableau 1 (1+ var)))

;; EW!
(defun rhs (tableau restriction)
  (aref tableau
        (1+ restriction)
        (+ 2
           (variable-count tableau)
           (restriction-count tableau))))

;; We're optimal when there aren't any negative coefficients in the
;; objective function row.
(defun optimal? (tableau)
  (iter (for var :from 1 :to (variable-count tableau))
        (never (minusp (z-coefficient tableau var)))))

(defun select-entering-basic-variable (tableau)
  (iter (for var :from 1 :to (variable-count tableau))
        (finding var :minimizing (z-coefficient tableau var))))

(defun mrt (tableau basic-variable pivot)
  (let ((coefficient (aref tableau (1+ basic-variable) (1+ pivot))))
    (and (plusp coefficient)
         (/ (rhs tableau basic-variable)
            coefficient))))

(defun select-leaving-basic-variable (tableau pivot)
  (iter (for r :from 1 :to (restriction-count tableau))
        (when-let ((ratio (mrt tableau r pivot)))
          (finding r :minimizing ratio))))

;; TODO: handle degenerate LPs, unbounded LPs, and LPs with multiple
;; optimum solutions.
(defun update-tableau (previous-tableau entering-bv leaving-bv)
  (let* ((tableau (copy-array previous-tableau))
         (pivot (aref tableau (1+ leaving-bv) (1+ entering-bv))))
    ;; update basic variable symbol
    (setf (aref tableau (1+ leaving-bv) 0)
          (aref tableau 0 (1+ entering-bv)))
    ;; normalize pivot row
    (iter (for c :from 1 :below (array-dimension tableau 1))
          (setf (aref tableau (1+ leaving-bv) c)
                (/ (aref tableau (1+ leaving-bv) c) pivot)))
    ;; eliminate pivot column coefficients
    (iter (for r :from 1 :below (array-dimension tableau 0))
          (let ((pcc (aref tableau r (1+ entering-bv))))
            (iter (for c :from 1 :below (array-dimension tableau 1))
                  (unless (eql r (1+ leaving-bv))
                    (setf (aref tableau r c)
                          (- (aref tableau r c)
                             (* pcc (aref tableau (1+ leaving-bv) c))))))))
    tableau))

;;;; The ABC Example

;;; Z = -15x1 - 10x2
;;; x1 + x2 < 4
;;; x1 < 2
;;; x2 < 3

(defparameter *abc*
  #2A((-   Z  X1  X2  S1  S2  S3 RHS)
      (Z   1 -15 -10   0   0   0   0)
      (S1  0   1   0   1   0   0   2)
      (S2  0   0   1   0   1   0   3)
      (S3  0   1   1   0   0   1   4))
  "The ABC tableau at the origin.")

#+#:test
(prog2
    (trace update-tableau)
    (simplex *abc*)
  (untrace update-tableau))

(defun sanity-check ()
  (assert (= 1 (select-entering-basic-variable *abc*)))
  (assert (= 1 (select-leaving-basic-variable *abc* 1)))
  (assert (= 2 (rhs *abc* 1)))
  (assert (= 3 (rhs *abc* 2)))
  (assert (= 4 (rhs *abc* 3)))
  (assert (= 2 (mrt *abc* 1 1)))
  (assert (null (mrt *abc* 1 2)))
  (assert (= 4 (mrt *abc* 1 3)))
  (assert (equalp #2A((-  Z X1 X2 S1 S2 S3 RHS)
                      (Z  1  0  0  5  0 10  50)
                      (X1 0  1  0  1  0  0   2)
                      (S2 0  0  0  1  1 -1   1)
                      (X2 0  0  1 -1  0  1   2))
                  (simplex *abc*))))
