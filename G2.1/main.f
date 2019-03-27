*     Verificare il Teorema di equivalenza tra le norme vettoriali.
*     In particolare le relazioni le tre norme vettoriali studiate.

      SUBROUTINE VECPRINT(V, N)
      REAL V(N)
      WRITE(*,*) (V(I), I = 1, N)
      END


      REAL FUNCTION RMAXABS(V, N)

      REAL V(N)

      RMAXABS = ABS(V(1))

      DO I = 2, N
         IF (ABS(V(I)) .GT. RMAXABS) THEN
            RMAXABS = ABS(V(I))
         ENDIF
      ENDDO

      END


      REAL FUNCTION RNORM1(V, N)

      REAL V(N)
      RNORM1 = 0

      DO I = 1, N
         RNORM1 = RNORM1 + ABS(V(I))
      ENDDO

      END


      REAL FUNCTION RNORM2(V, N)

      REAL V(N)
      RNORM2 = 0

      DO I = 1, N
         RNORM2 = RNORM2 + V(I) ** 2
      ENDDO

      RNORM2 = SQRT(RNORM2)

      END


      REAL FUNCTION RNORMINF(V, N)
      REAL V(N)
      RNORMINF = RMAXABS(V, N)
      END


      LOGICAL FUNCTION PROOF1(V, N)

      REAL V(N)
      REAL TERM1, TERM2, TERM3

      TERM1 = RNORMINF(V, N)
      TERM2 = RNORM2(V, N)
      TERM3 = SQRT(REAL(N)) * RNORMINF(V, N)

      IF (TERM1 .LE. TERM2 .AND. TERM2 .LE. TERM3) THEN
         PROOF1 = .TRUE.
      ELSE
         PROOF1 = .FALSE.
      ENDIF

      END


      PROGRAM MAIN

      LOGICAL PROOF1

      INTEGER N
      REAL V(4)

      REAL NORM1
      REAL NORM2
      REAL NORMINF

      N = 4
      V(1) = -1.0
      V(2) = 1.0
      V(3) = -1.0
      V(4) = 1.0

      NORM1 = RNORM1(V, N)
      NORM2 = RNORM2(V, N)
      NORMINF = RNORMINF(V, N)

      WRITE(*,*) 'Vettore:'
      CALL VECPRINT(V, N)

      WRITE(*,*) 'Norma 1: ', NORM1
      WRITE(*,*) 'Norma 2: ', NORM2
      WRITE(*,*) 'Norma inf: ', NORMINF

      WRITE(*,*) 'Th. 1: ', PROOF1(V, N)

      END
