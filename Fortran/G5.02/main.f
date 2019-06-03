*     * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
*     Risolvere  un sistema  lineare  Ax=b con il metodo  di Gauss.
*     Perturbare  almeno  un elemento di A e risolvere nuovamente il sistema
*     mantenendo lo stesso vettore dei termini noti. Confrontare la
*     soluzione ottenuta con quella del sistema non perturbato e spiegare
*     quello che accade, evidenziando la relazione tra l’errore relativo
*     sui dati e quello sulla soluzione.
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

*     Generate an Hilbert matrix of N components in the space referenced
*     by A.
      SUBROUTINE MATHILBERT(A, N)
      REAL A(N, N)

      DO I = 1, N
         DO J = 1, N
            A(I, J) = 1.0 / (I + J - 1)
         ENDDO
      ENDDO

      END

*     * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

*     Generate a Wilkinson matrix of N components in the space referenced
*     by A.
      SUBROUTINE MATWILKINSON(A, N)
      REAL A(N, N), S

*     Start value for the main diagonal of the matrix (A(1, 1))
      S = -(N-1)/2.0

      DO I = 1, N
         DO J = 1, N
            A(I, J) = 0
         ENDDO
      ENDDO

      DO I = 2, N
*        Upper diagonal
         A(I-1, I) = 1

*        Lower diagonal
         A(I, I-1) = 1

*        Element of the main diagonal starting from A(1, 1)
*        I - 2 is the offset for each element starting from S
*        Absolute value is needed so all values are positive
         A(I-1, I-1) = ABS(S + I - 2)
      ENDDO

*     To avoid an out-of-range assignment (A(N+1,N+1)), it is
*     better to stop the DO cycle one element earlier and manually
*     assign the A(N, N) element to -S (ABS(S))
      A(N, N) = -S

      END

*     * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

      SUBROUTINE MATPRINT(A, N)
      REAL A(N, N)

      DO I = 1, N
         WRITE(*,*) (A(I, J), J = 1, N)
      ENDDO

      END

*     * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

*     Computes the B vector so that the X vector is made up of ones.
      SUBROUTINE COMPUTEBVECTOR(A, B, N)

      REAL A(N, N), B(N), STEMP

      STEMP = 0

      DO I = 1, N
         DO J = 1, N
            STEMP = STEMP + A(I, J)
         ENDDO
         B(I) = STEMP
         STEMP = 0
      ENDDO

      END

*     * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

      SUBROUTINE TOZERO(A, B, N)

      REAL A(N, N), B(N), R, TEMP, PIVOT
      INTEGER Y, P_POS

*     A is the matrix of the linear system
*     B is the constant vector

      DO K = 1, N-1
         PIVOT = 0
         DO I = K, N
            IF (ABS(A(I, K)) .GT. PIVOT) THEN
               PIVOT = A(I, K)
               P_POS = I
            ENDIF
         ENDDO

*        This equality comparison can give errors, it may be better to see if
*        PIVOT is less or equal than epsilon (machine precision), but in this case
*        it is unnecessary
         IF (PIVOT .EQ. 0) THEN
            STOP
         ELSE
            IF (K .NE. P_POS) THEN
               DO Y = 1, N
*                 Swap row k with row p_pos
                  TEMP = A(K, Y)
                  A(K, Y) = A(P_POS, Y)
                  A(P_POS, Y) = TEMP
                  TEMP = B(K)
                  B(K) = B(P_POS)
                  B(P_POS) = TEMP
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

*     Same thing here for equality comparison
      IF (A(N, N) .EQ. 0) THEN
         STOP
      ENDIF

      END

*     * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

      SUBROUTINE BACKSUB(A, B, N, X)

      REAL A(N, N), X(N), B(N)

      DO I = 1, N-1
         X(I) = 0
      ENDDO

      X(N) = B(N)/A(N, N)

      DO I = N-1, 1, -1
         X(I) = B(I)
         DO J = I + 1, N
            X(I) = X(I) - A(I, J)*X(J)
         ENDDO
         X(I) = X(I)/A(I, I)
      ENDDO

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

*     Perturbates the A(N, N) element of the matrix with the offset
*     argument. Note that the offset can be positive or negative

      SUBROUTINE PERTURBATEMATRIX(A, N, OFFSET)

      REAL A(N, N), OFFSET

      A(N, N) = A(N, N) + OFFSET

      END

*     * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

      SUBROUTINE PRINTVECTOR(V, N)

      REAL V(N)

      WRITE(*,*) (V(I), I = 1, N)

      END

*     * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
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

      REAL FUNCTION NORM_1(A, N)
      REAL A(N, N)
      REAL TMP

      NORM_1 = 0

      DO J = 1, N
         TMP = 0

*        Sum each element in a column and store the result in TMP.
         DO I = 1, N
            TMP = TMP + A(I, J)
         ENDDO

*        NORM_1 is the greatest TMP we got.
         IF (TMP .GT. NORM_1) THEN
            NORM_1 = TMP
         ENDIF
      ENDDO

      END

*     * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
*     Calculate the inverse matrix of A with the Gauss-Jordan algorithm
*     A is the matrix, ID is the identity matrix
*     At the end of this algorithm, ID will be
*     the inverse matrix of A

      SUBROUTINE GAUSSJORDAN(A, ID, N)

      REAL A(N, N), ID(N, N), COPY(N, N)
      REAL MAX_VAL, TEMP, Q
      INTEGER L

      CALL MATRIXCPY(COPY, A, N)

      DO K = 1, N - 1
         MAX_VAL = A(K, K)
         L = K
         DO I = K, N
            TEMP = ABS(A(I, K))
            IF (MAX_VAL .LT. TEMP) THEN
               MAX_VAL = TEMP
               L = I
            ENDIF
         ENDDO
         IF (MAX_VAL .EQ. 0) THEN
            STOP
         ENDIF
         IF (K .NE. L) THEN
            DO J = 1, N
               TEMP = COPY(K, J)
               COPY(K, J) = COPY(L, J)
               COPY(L, J) = TEMP
               TEMP = ID(K, J)
               ID(K, J) = ID(L, J)
               ID(L, J) = TEMP
            ENDDO
         ENDIF
         DO I = K + 1, N
            Q = COPY(I, K) / COPY(K, K)
            DO J = K, N
               COPY(I, J) = (COPY(I, J)-(Q*COPY(K, J)))
            ENDDO
            DO J = 1, N
               ID(I, J) = (ID(I, J)-(Q*ID(K, J)))
            ENDDO
         ENDDO
      ENDDO
      IF (COPY(N, N) .EQ. 0) THEN
         STOP
      ENDIF
      DO K = N, 1, -1
         DO I = 1, K - 1
            Q = COPY(I, K) / COPY(K, K)
            DO J = 1, K
               COPY(I, J) = (COPY(I, J)-Q*COPY(K, J))
            ENDDO
            DO J = 1, N
               ID(I, J) = (ID(I, J) - Q*ID(K, J))
            ENDDO
         ENDDO
         DO J = 1, N
            ID(K, J) = (ID(K, J)/COPY(K, K))
         ENDDO
      ENDDO
      END

*     * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

*     Wrapper function to compute the condition number
      REAL FUNCTION CONDNUMBER(A, N)
      REAL NORM_1
      REAL A(N, N), INV(N, N), A_NORM, INV_NORM

*     We need to compute the identity matrix to use Gauss-Jordan
      CALL IDENTITYMATRIX(INV, N)

*     Compute the inverse matrix of A, stored in INV
      CALL GAUSSJORDAN(A, INV, N)

*     Compute the norm 1 of A and the norm 1 of the inverse of A
      A_NORM = NORM_1(A, N)
      INV_NORM = NORM_1(INV, N)

*     At this point we can compute the cond number by multiplying
*     the two norms
      CONDNUMBER = A_NORM * INV_NORM
      END

*     * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
*     Function that takes the original matrix A, the perturbated
*     matrix A_OFF and gives in output the relative error with the 1-norm

      REAL FUNCTION RELERROR(A, A_OFF, N)

      REAL A(N, N), A_OFF(N, N)
      REAL NORM_1, NORMA, NORMA_OFF

      NORMA_OFF = NORM_1(A_OFF, N)
      NORMA = NORM_1(A, N)

      RELERROR = NORMA_OFF/NORMA

      END

*     * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

      PROGRAM MAIN

*     Ordine della matrice
      PARAMETER (N = 5)
      PARAMETER (OFFSET = 0.01)

      REAL A(N, N), B(N), SOLERROR
      REAL X_BEFORE(N), X_AFTER(N)
      REAL ERR_BEFORE, ERR_AFTER
      REAL COND_BEFORE, COND_AFTER
      REAL RELERROR, DATAERROR
      REAL Z(N, N)

      WRITE(*,*) 'Original matrix:'
      CALL MATTOEPLITZ(A, N)
      CALL MATPRINT(A, N)
      WRITE(*,*) ''

      CALL COMPUTEBVECTOR(A, B, N)
      COND_BEFORE = CONDNUMBER(A, N)
      CALL MATTOEPLITZ(A, N)
      CALL TOZERO(A, B, N)
      CALL BACKSUB(A, B, N, X_BEFORE)
      ERR_BEFORE = SOLERROR(X_BEFORE, N)

*     X_BEFORE is now the solution to the initial matrix
*     We will now perturbate the A(N, N) element
*     NOTE: the A matrix has been altered by the
*     		Gauss algorithm, so we have to compute
*     		the matrix and the B vector again

      CALL MATTOEPLITZ(A, N)
      CALL COMPUTEBVECTOR(A, B, N)
      CALL PERTURBATEMATRIX(A, N, OFFSET)
      COND_AFTER = CONDNUMBER(A, N)
      CALL MATTOEPLITZ(A, N)
      CALL PERTURBATEMATRIX(A, N, OFFSET)
      CALL TOZERO(A, B, N)
      CALL BACKSUB(A, B, N, X_AFTER)
      ERR_AFTER = SOLERROR(X_AFTER, N)


*     Solution to the original matrix
      WRITE(*,*) 'Solution before the perturbation: '
      CALL PRINTVECTOR(X_BEFORE, N)

*     Blank
      WRITE(*,*) ''

*     Solution to the perturbated matrix
      WRITE(*,*) 'Solution after the perturbation: '
      CALL PRINTVECTOR(X_AFTER, N)

*     Blank
      WRITE(*,*) ''

      WRITE(*,*) 'Error before/after'
      WRITE(*,*) ERR_BEFORE, ERR_AFTER
      WRITE(*,*) ''
      WRITE(*,*) 'Condition number before/after'
      WRITE(*,*) COND_BEFORE, COND_AFTER

      CALL MATTOEPLITZ(A, N)
      CALL MATTOEPLITZ(Z, N)
      CALL PERTURBATEMATRIX(Z, N, OFFSET)

      DATAERROR = RELERROR(A, Z, N)

      WRITE(*,*) ''
      WRITE(*,*) 'Data error:', DATAERROR

      END
