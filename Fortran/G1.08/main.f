*     Ordinamento di un insieme di numeri, stampare insieme ordinato

      SUBROUTINE SWAP(A, B)
      INTEGER A, B, TEMP
      TEMP = A
      A = B
      B = TEMP
      WRITE(*,*) 'Swap ', A, B
      END

      SUBROUTINE VECMIN(J, IIN, IEND, IMIN, IPOS)
      INTEGER J(IEND), IIN, IEND, IPOS, IMIN
      IMIN = J(IIN)
      IPOS = 1
      DO I = IIN, IEND
         IF (J(I) .LT. IMIN) THEN
            IMIN = J(I)
            IPOS = I
         ENDIF
      ENDDO

      END

      SUBROUTINE SORT(X, N)
      INTEGER X(N), VMIN, VPOS
      DO I = 1, N
         CALL VECMIN(X, I, N, VMIN, VPOS)
         IF (VMIN .LT. X(I)) THEN
            CALL SWAP(X(VPOS), X(I))
            WRITE(*,*) (X(K), K = 1, N)
         ENDIF
      ENDDO

      END

      PROGRAM MAIN
      PARAMETER (N = 5)
      INTEGER X(N)
      WRITE(*,*) 'Insert ', N, 'numbers to order'
      READ(*,*) (X(I), I = 1, N)
      WRITE(*,*) (X(I), I = 1, N)
      CALL SORT(X, N)
      END
