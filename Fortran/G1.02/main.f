*     Scrivere un programma per la risoluzione delle equazioni di
*     secondo grado.

      FUNCTION DELTA(A, B, C)
      REAL A, B, C
      DELTA = B*B - 4*A*C
      END

      PROGRAM MAIN
      REAL A, B, C, X1, X2, D
      COMPLEX C1, C2, CDELTA
      WRITE(*,*) 'Equations in the form of ax^2 + bx + c = 0'
      WRITE(*,*) 'Insert A: '
      READ(*,*) A
      WRITE(*,*) 'Insert B: '
      READ(*,*) B
      WRITE(*,*) 'Insert C: '
      READ(*,*) C
      D = DELTA(A, B, C)
      IF (D .GT. 0) THEN
         X1 = (SQRT(D) - B)/(2*A)
         X2 = (-SQRT(D) - B)/(2*A)
         WRITE(*,*) X1, X2
      ELSE IF (D .EQ. 0) THEN
         X1 = -B/(2*A)
         WRITE(*,*) X1
      ELSE
         CDELTA = DELTA(A,B,C)
         C1 = (SQRT(CDELTA) - B)/(2*A)
         C2 = (-SQRT(CDELTA) - B)/(2*A)
         WRITE(*,*) C1, C2
      END IF
      END
