(defmodule lsci-np
  (export all))

(include-lib "lsci/include/np.lfe")

(defun version ()
  (lsci-py:const 'numpy 'version.version 'str))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Array Attributes
;;;

;; Memory layout
;;
(defun flags (array)
  (lsci-py:attr array 'flags))

(defun shape (array)
  (lsci-py:attr array 'shape))

(defun strides (array)
  (lsci-py:attr array 'strides))

(defun ndim (array)
  (lsci-py:attr array 'ndim))

(defun data (array)
  (lsci-py:attr array 'data))

(defun size (array)
  (lsci-py:attr array 'size))

(defun itemsize (array)
  (lsci-py:attr array 'itemsize))

(defun nbytes (array)
  (lsci-py:attr array 'nbytes))

(defun base (array)
  (lsci-py:attr array 'base))

;; Data type
;;
(defun dtype (array)
  (lsci-py:attr array 'dtype))

;; Other attributes
;;
(defun real (array)
  (lsci-py:attr array 'real))

(defun imag (array)
  (lsci-py:attr array 'imag))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Array Methods
;;;

;; LFE-only
;;
(defun get (array key)
  "This provides LFE support for the Python syntax `array[key]`."
  (lsci-py:method array '__getitem__ `(,key)))

(defun ->float (np-float)
  (lsci-py:func 'builtins 'float `(,np-float) '()))

(defun ->int (np-int)
  (lsci-py:func 'builtins 'int `(,np-int) '()))

(defun norm1d (array)
  (lsci-py:func 'lsci.numpysupl 'norm1d `(,array) '()))

(defun scale1d (array)
  (lsci-py:func 'lsci.numpysupl 'scale1d `(,array) '()))

(defun scale1d (array kwargs)
  (lsci-py:func 'lsci.numpysupl 'scale1d `(,array) kwargs))

(defun poly-linear-model (xs ys degree)
  (lsci-py:instantiate
    'lsci.numpysupl
    'PolynomialLinearModel
    `(,xs ,ys ,degree)))

;; Array conversion
;;
(defun item (array args)
  (lsci-py:method array 'item args))

(defun tolist (array)
  (lsci-py:method array 'tolist))

(defun ->list (array)
  (lsci-py:method array 'tolist))

(defun tostring (array)
  (tobytes array))

(defun tostring (array order)
  "order may be either the string C or F."
  (tobytes array order))

(defun ->str (array)
  (tobytes array))

(defun ->str (array order)
  (tobytes array order))

(defun tobytes (array)
  (lsci-py:method array 'tobytes))

(defun tobytes (array order)
  "order may be either the string C or F."
  (lsci-py:method
    array
    'tostring
    '()
    `(#(order ,(list_to_binary order)))))

(defun ->bytes (array)
  (lsci-py:method array 'tobytes))

(defun ->bytes (array order)
  (lsci-py:method
    array
    'tostring
    '()
    `(#(order ,(list_to_binary order)))))

(defun dump (array filename)
  (lsci-py:method array 'dump `(,(list_to_binary filename)))
  'ok)

(defun dumps (array)
  (lsci-py:method array 'dumps))

(defun getfield (array dtype)
  (lsci-py:method array 'getfield `(,(list_to_binary dtype))))

(defun getfield (array dtype offset)
  (lsci-py:method
    array
    'tostring
    `(,(list_to_binary dtype))
    `(#(offset , offset))))

;; Shape manipulation
;;
(defun reshape (array shape)
  (lsci-py:method array 'reshape `(,shape)))

(defun reshape (array shape kwargs)
  (lsci-py:method array 'reshape `(,shape) kwargs))

(defun resize (array shape)
  (lsci-py:method array 'resize `(,shape)))

(defun resize (array shape kwargs)
  (lsci-py:method array 'resize `(,shape) kwargs))

(defun transpose (array)
  (lsci-py:method array 'transpose))

(defun transpose (array axes)
  (lsci-py:method array 'transpose axes))

(defun swapaxes (array axis-1 axis-2)
  (lsci-py:method array 'swapaxes `(,axis-1 ,axis-2)))

(defun flatten (array kwargs)
  (lsci-py:method array 'flatten '() kwargs))

(defun ravel (array order)
  (lsci-py:method array 'ravel `(,order)))

(defun squeeze (array kwargs)
  (lsci-py:method array 'squeeze '() kwargs))

;; Item selection and manipulation
;;
;; TBD

;; Calculation
;;
(defun max (array)
  (lsci-py:method array 'max))

(defun max (array kwargs)
  (lsci-py:method array 'max '() kwargs))

(defun argmax (array)
  (lsci-py:method array 'argmax))

(defun argmax (array kwargs)
  (lsci-py:method array 'argmax '() kwargs))

(defun min (array)
  (lsci-py:method array 'min))

(defun min (array kwargs)
  (lsci-py:method array 'min '() kwargs))

(defun argmin (array)
  (lsci-py:method array 'argmin))

(defun argmin (array kwargs)
  (lsci-py:method array 'argmin '() kwargs))

(defun ptp (array)
  (lsci-py:method array 'ptp))

(defun ptp (array kwargs)
  (lsci-py:method array 'ptp '() kwargs))

(defun clip (array min max)
  (lsci-py:method array 'clip `(,min ,max)))

(defun clip (array min max kwargs)
  (lsci-py:method array 'clip `(,min ,max) kwargs))

(defun conj (array)
  (lsci-py:method array 'conj))

(defun round (array)
  (lsci-py:method array 'round))

(defun round (array kwargs)
  (lsci-py:method array 'round '() kwargs))

(defun trace (array)
  (lsci-py:method array 'trace))

(defun trace (array kwargs)
  (lsci-py:method array 'trace '() kwargs))

(defun sum (array)
  (lsci-py:method array 'sum))

(defun sum (array kwargs)
  (lsci-py:method array 'sum '() kwargs))

(defun cumsum (array)
  (lsci-py:method array 'cumsum))

(defun cumsum (array kwargs)
  (lsci-py:method array 'cumsum '() kwargs))

(defun prod (array)
  (lsci-py:method array 'prod))

(defun prod (array kwargs)
  (lsci-py:method array 'prod '() kwargs))

(defun cumprod (array)
  (lsci-py:method array 'cumprod))

(defun cumprod (array kwargs)
  (lsci-py:method array 'cumprod '() kwargs))

(defun dot (array other-array)
  (lsci-py:method array 'dot `(,other-array)))

(defun dot (array other-array kwargs)
  (lsci-py:method array 'dot `(,other-array) kwargs))

(defun mean (array)
  (lsci-py:method array 'mean))

(defun mean (array kwargs)
  (lsci-py:method array 'mean '() kwargs))

(defun var (array)
  (lsci-py:method array 'var))

(defun var (array kwargs)
  (lsci-py:method array 'var '() kwargs))

(defun std (array)
  (lsci-py:method array 'std))

(defun std (array kwargs)
  (lsci-py:method array 'std '() kwargs))

(defun all (array)
  (lsci-py:method array 'all))

(defun all (array kwargs)
  (lsci-py:method array 'all '() kwargs))

(defun any (array)
  (lsci-py:method array 'any))

(defun any (array kwargs)
  (lsci-py:method array 'any '() kwargs))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Wrappers - the following functions couldn't be simply wrapped with the
;;;            same macros that wrap most of the other NumPy functions due to
;;;            the fact that these needed some sort of special handling.
;;;

;; Numerical ranges
;;
(defun linspace (start stop kwargs)
  (lsci-py:func 'numpy 'linspace `(,start ,stop) kwargs))

(defun meshgrid (coords)
  (lsci-py:func 'numpy 'meshgrid coords))

(defun meshgrid (coords kwargs)
  (lsci-py:func 'numpy 'meshgrid coords kwargs))

;; Mathematical functions
;;
(defun + (a b)
  (add a b))

(defun * (a b)
  (multiply a b))

(defun / (a b)
  (divide a b))

(defun ** (a b)
  (power a b))

(defun ^ (a b)
  (power a b))

(defun - (a b)
  (subtract a b))

(defun % (a b)
  (mod a b))

;; I/O
;;
(defun genfromtxt (filename)
  (genfromtxt filename '()))

(defun genfromtxt (filename kwargs)
  (lsci-py:func 'numpy 'genfromtxt `(,(list_to_binary filename)) kwargs))

;; Polynomials
;;
(defun polyfit (x y degree kwargs)
  (lsci-py:func 'numpy 'polyfit `(,x ,y ,degree) kwargs))

(defun poly1d (c-or-r kwargs)
  (lsci-py:func 'numpy 'poly1d `(,c-or-r) kwargs))
