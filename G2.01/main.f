*     Verificare il Teorema di equivalenza tra le norme vettoriali.
*     In particolare le relazioni le tre norme vettoriali studiate.

*     * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

*     Print the values of the components indexed from 1 to N
*     of the vector V.
      SUBROUTINE VECPRINT(V, N)
      REAL V(N)
      WRITE(*,*) (V(I), I = 1, N)
      END

*     * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

*     .   MAX     | V  |
*     .I=1,...,N  |  I |
      REAL FUNCTION RMAXABS(V, N)
      REAL V(N)

      RMAXABS = ABS(V(1))

      DO I = 2, N
         IF (ABS(V(I)) .GT. RMAXABS) THEN
            RMAXABS = ABS(V(I))
         ENDIF
      ENDDO

      END

*     * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

*     .  N
*     . ===
*     . \    | X  |
*     . /    |  I |
*     . ===
*     .I = 1
      REAL FUNCTION RNORM1(V, N)
      REAL V(N)

      RNORM1 = 0

      DO I = 1, N
         RNORM1 = RNORM1 + ABS(V(I))
      ENDDO

      END

*     * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

*     .         _________
*     .        /  N
*     .       / ====
*     .      /  \
*     .     /    \     2
*     .    /     /    X
*     .   /     /      I
*     .  /      ====
*     .\/       I = 1
      REAL FUNCTION RNORM2(V, N)
      REAL V(N)

      RNORM2 = 0

      DO I = 1, N
         RNORM2 = RNORM2 + V(I) ** 2
      ENDDO

      RNORM2 = SQRT(RNORM2)

      END

*     * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

*     An helper function just for clarity calling RMAXABS.
      REAL FUNCTION RNORMINF(V, N)
      REAL V(N)
      RNORMINF = RMAXABS(V, N)
      END

*     * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

      PROGRAM MAIN

      PARAMETER (N = 4)

      REAL V(N)
      REAL NORM1, NORM2, NORMINF
      REAL TERM1, TERM2, TERM3

      V(1) = -1.0
      V(2) = 1.0
      V(3) = -1.0
      V(4) = 1.0

      NORM1 = RNORM1(V, N)
      NORM2 = RNORM2(V, N)
      NORMINF = RNORMINF(V, N)

      WRITE(*,*) 'Vettore:'
      CALL VECPRINT(V, N)

      WRITE(*,*) 'Norma 1  :', NORM1
      WRITE(*,*) 'Norma 2  :', NORM2
      WRITE(*,*) 'Norma inf:', NORMINF

*     .                                  _
*     .|| X ||     <=   || X ||   <=   \/n || X ||
*     .      inf              2                  inf
      TERM1 = NORMINF
      TERM2 = NORM2
      TERM3 = SQRT(REAL(N)) * NORMINF

      WRITE(*,*) 'Th. 1:', TERM1, '<=', TERM2, '<=', TERM3

*     .                                _
*     .|| X ||   <=   || X ||   <=   \/n || X ||
*     .      2              1                  2
      TERM1 = TERM2
      TERM2 = TERM1
      TERM3 = SQRT(REAL(N)) * TERM2

      WRITE(*,*) 'Th. 2:', TERM1, '<=', TERM2, '<=', TERM3

*     .
*     .|| X ||     <=   || X ||   <=   n || X ||
*     .      inf              1                inf
      TERM1 = NORMINF
      TERM2 = NORM1
      TERM3 = N * NORMINF

      WRITE(*,*) 'Th. 3:', TERM1, '<=', TERM2, '<=', TERM3

      END
