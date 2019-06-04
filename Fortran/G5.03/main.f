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

*     Doolittle decomposition
      SUBROUTINE DOOLITTLEDECOMP(A, L, U, N)
      REAL A(N ,N), U(N, N), L(N, N)

      CALL IDENTITYMATRIX(L, N)
      CALL MATRIXCPY(U, A, N)

      DO K = 1, N - 1
         DO J = K + 1, N
            L(J, K) = U(J, K)/U(K, K)
            DO M = K, N
               U(J, M) = U(J, M) - L(J, K)*U(K, M)
            ENDDO
         ENDDO
      ENDDO

      END

*     * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

*     Build an identity matrix of order N
      SUBROUTINE IDENTITYMATRIX(A, N)
      REAL A(N, N)

      DO I = 1, N
         DO J = 1, N
            IF (I .EQ. J) THEN
               A(I, J) = 1
            ELSE
               A(I, J) = 0
            ENDIF
         ENDDO
      ENDDO

      END

*     * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

*     Copies B into A
      SUBROUTINE MATRIXCPY(A, B, N)
      REAL A(N, N), B(N, N)

      DO I = 1, N
         DO J = 1, N
            A(I, J) = B(I, J)
         ENDDO
      ENDDO

      END

*     * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

      PROGRAM MAIN
      PARAMETER (N = 5)
      REAL A(N, N), L(N, N), U(N, N)
      REAL RES(N, N)

      CALL ARROWMATRIX(A, N)
      WRITE(*,*) 'Original matrix: '
      CALL MATPRINT(A, N)
      WRITE(*,*) ''
      CALL DOOLITTLEDECOMP(A, L, U, N)

      WRITE(*,*) 'Lower triangular: '
      CALL MATPRINT(L, N)
      WRITE(*,*) ''
      WRITE(*,*) 'Upper triangular: '
      CALL MATPRINT(U, N)
      WRITE(*,*) ''

      WRITE(*,*) 'Product LU: '
      CALL MATRIXPRODUCT(L, U, RES, N)
      CALL MATPRINT(RES, N)
      WRITE(*,*) ''

      END
