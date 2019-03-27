*     Trovare il massimo (o il minimo) di un insieme di numeri

      SUBROUTINE VECMAX(V, N, VMAX)
      REAL V(N), VMAX
      VMAX = V(1)
      DO I = 2, N
         IF (V(I) .GT. VMAX) THEN
            VMAX = V(I)
         ENDIF
      ENDDO
      END

      SUBROUTINE VECMIN(V, N, VMIN)
      REAL V(N), VMIN
      VMIN = V(1)
      DO I = 2, N
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
      CALL VECMAX(V, MAX, VMAX)
      CALL VECMIN(V, MAX, VMIN)
      WRITE(*,*) 'The maximum is: ', VMAX, 'and the minimum is: ', VMIN
      END
