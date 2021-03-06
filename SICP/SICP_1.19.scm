;	SICP 1.19

(define (fib n)
	(fib-iter 1 0 0 1 n))
(define (fib-iter a b p q count)
	(cond ((= count 0) b)
	  ((even? count)
	   (fib-iter a
      				 b
      				(+ (* p p) (* q q))		; compute p'  <<-- code goes here
      				(+ (* 2 p q) (* q q))	; compute q'  <<-- code goes here
      				(/ count 2)))
  (else (fib-iter (+ (* b q) (* a q) (* a p))
      					  (+ (* b p) (* a q))
      					  p
      					  q
      					  (- count 1)))))
;
a <-- bq + aq + ap
b <-- bp + aq

a <-- b(1) + a(1) + a(0)
a <-- b + a

b <-- b(0) + a(1)
b <-- a

Apply T_pq twice by def new vars & using subst.
  a1, b1 = reselts of transformation T_pq once
  
    a1 = bq + aq + ap
    b1 = bp + aq
    
Next step: define a2 & b2 & apply transf 2nd time, this time using a1 & b1:
    
    a2 = b1q + a1q + a1p
    b2 = b1p + a1q
    
With a system of equations defined, use substitution to simplify:

  a2 = (bp _ aq)q + (bq + aq + ap)q + (bq + aq + ap)p
  b2 = (bp + aq)p + (bq + aq + ap)q
  
  >> we want to rewrite 2nd eqn (it's shorter) to fit form: b2 = bp' + aq'
  
  b2 = (bp + aq)p + (bq + aq + ap)q = (bpp + apq) + (bqq + aqq + apq) = 
     = bpp + apq + bqq + aqq + apq  = (bpp + bqq) + (2apq + aqq) = 
     = b(pp + qq) + a(2pq + qq)
     
 Цундела: we can see that p' & q' can be computed thusly:
 
    p' = p^2 + q^2    q' = 2pq + q^2
    
>>  We can verify by checking a2, to make sure it fits the form:
    a2 = bq' + aq' + ap'


;
-*- mode: scheme;-*-
