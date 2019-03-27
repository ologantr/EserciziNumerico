*     Trovare il massimo (o il minimo) di un insieme di numeri

      SUBROUTINE VECMAXMIN(V, N, VMAX, VMIN)
      REAL V(N), VMAX, VMIN
      VMAX = V(1)
      VMIN = V(1)
      DO I = 2, N
         IF (V(I) .GT. VMAX) THEN
            VMAX = V(I)
         ENDIF
         IF (V(I) .LT. VMIN) THEN
            VMIN = V(I)
         ENDIF
      ENDDO
      END

      PROGRAM MAIN
      PARAMETER (MAX = 10)
      REAL V(MAX), VMAX, VMIN
      WRITE(*,*) 'Insert 10 numbers: '
      READ(*,*) (V(I), I = 1, MAX)
      CALL VECMAXMIN(V, MAX, VMAX, VMIN)
      WRITE(*,*) 'The maximum is: ', VMAX, 'and the minimum is: ', VMIN
      END
