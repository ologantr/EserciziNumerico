*     * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
*     Stampare, dopo il primo passo della fattorizzazione di Gauss, la matrice
*     freccia che ha sulla diagonale tutti elementi uguali a 2 i restanti
*     elementi della prima riga uguali a -1 e i restanti elementi della prima
*     colonna uguali ad 1. Analizzare il risultato.
*     * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

      SUBROUTINE ARROWMATRIX(A, N)
      REAL A(N, N)

      DO I = 1, N
         DO J = 1, N
            IF (I .EQ. J) THEN
               A(I, J) = 2
            ELSE IF (I .EQ. 1) THEN
               A(I, J) = -1
            ELSE IF (J .EQ. 1) THEN
               A(I, J) = 1
            ELSE
               A(I, J) = 0
            ENDIF
         ENDDO
      ENDDO
      END

*     * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

      SUBROUTINE MATPRINT(A, N)
      REAL A(N, N)

      DO I = 1, N
         WRITE(*,*) (A(I, J), J = 1, N)
      ENDDO

      END

*     * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

      SUBROUTINE TOZERO(A, B, N)

      REAL A(N, N), B(N), R, TEMP, PIVOT
      INTEGER Y, P_POS

*     A is the complete matrix of the linear system

      DO K = 1, N-1
         PIVOT = 0.0
         DO I = K, N
            IF (ABS(A(I, K)) .GT. PIVOT) THEN
               PIVOT = A(I, K)
               P_POS = I
            ENDIF
         ENDDO

         IF (PIVOT .EQ. 0) THEN
            STOP
         ELSE
            IF (K .NE. P_POS) THEN
               DO Y = 1, N+1
*                 Swap row k with row
                  TEMP = A(K, Y)
                  A(K, Y) = A(P_POS, Y)
                  A(P_POS, Y) = TEMP
               ENDDO
            ENDIF

            DO I = K+1, N
               R = A(I, K)/A(K, K)
               DO J = K, N
                  A(I, J) = A(I, J) - R*A(K, J)
               ENDDO
               B(I) = B(I) - R*B(K)
            ENDDO
         ENDIF
      ENDDO

      IF (A(N, N) .EQ. 0) THEN
         STOP
      ENDIF

      END

*     * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

      REAL FUNCTION RNORM1(V, N)
      REAL V(N)

      RNORM1 = 0

      DO I = 1, N
         RNORM1 = RNORM1 + ABS(V(I))
      ENDDO

      END

*     * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

      REAL FUNCTION SOLERROR(X, N)
      REAL X(N), ERRX(N), SOL(N), NORMERRX, NORMSOL

      DO I = 1, N
         SOL(I) = 1
         ERRX(I) = SOL(I) - X(I)
      ENDDO

      NORMSOL = RNORM1(SOL, N)
      NORMERRX = RNORM1(ERRX, N)
      SOLERROR = NORMERRX/NORMSOL

      END

*     * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

*     Multiplies two matrices of order N and stores the result in C
      SUBROUTINE MATRIXPRODUCT(A, B, C, N)
      REAL A(N, N), B(N, N), C(N, N)
      REAL TEMP

      TEMP = 0

      DO I = 1, N
         DO J = 1, N
            DO K = 1, N
               TEMP = TEMP + (A(I, K) * B(K, J))
            ENDDO
            C(I, J) = TEMP
            TEMP = 0
         ENDDO
      ENDDO

      END

*     * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

      SUBROUTINE CROUTDECOMP(A, N)
      REAL A(N ,N), TEMP

      TEMP = 0

      DO I = 1, N
         DO K = J, N
            TEMP = A(I, J)
            DO J = 1, I - 1
               TEMP = TEMP - (A(I, J)*A(J, K))
            ENDDO
            A(I, K) = A(I, K) - TEMP
         ENDDO
         DO L = J + 1, N
            TEMP = A(I, L)
            DO K = 1, I - 1
               TEMP = TEMP - (A(L, K)*A(K, I))
            ENDDO
            A(L, I) = TEMP/A(L, I)
         ENDDO
      ENDDO

      END

*     * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
*     Generate a Toeplitz matrix of N components in the space referenced
*     by A
      SUBROUTINE MATTOEPLITZ(A, N)
      REAL A(N, N)

      DO I = 1, N
         DO J = N, I, -1
            A(I, J) = J - I + 1
         ENDDO
      ENDDO

      DO I = 2, N
         DO J = 1, I - 1
            A(I, J) = I - J + 1
         ENDDO
      ENDDO

      END

*     * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

*     Set to zero every element of the matrix
      SUBROUTINE ZEROMATRIX(A, N)

      REAL A(N, N)

      DO I = 1, N
         DO J = 1, N
            A(I, J) = 0
         ENDDO
      ENDDO

      END

*     * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
*     Utility to get L and U after Crout Decomposition (TESTING ONLY)
*     If it works, it will use only one matrix
      SUBROUTINE GETLU(A, L, U, N)

      REAL A(N, N), L(N, N), U(N, N)

      CALL ZEROMATRIX(L, N)
      CALL ZEROMATRIX(U, N)

*     Upper Matrix
      DO I = 1, N
         DO J = I, N
            U(I, J) = A(I, J)
         ENDDO
      ENDDO

*     Lower Matrix
      DO I = N, 1, -1
         DO J = 1, I
            L(I, J) = A(I, J)
         ENDDO
      ENDDO

      END

*     * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

      PROGRAM MAIN
      PARAMETER (N = 5)
      REAL A(N, N)
      REAL L(N, N), U(N, N), RES(N, N)

      CALL MATTOEPLITZ(A, N)
      CALL MATPRINT(A, N)
      WRITE(*,*) ''
      CALL CROUTDECOMP(A, N)


      CALL GETLU(A, L, U, N)

      CALL MATRIXPRODUCT(L, U, RES, N)

      CALL MATPRINT(L, N)
      WRITE(*,*) ''
      CALL MATPRINT(U, N)
      WRITE(*,*) ''
      CALL MATPRINT(RES, N)

      END
