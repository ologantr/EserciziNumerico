      SUBROUTINE SUM(V, W, S)

      REAL V(4), W(10), S

      S = 0
      DO I = 1, 4
         S = S + V(I)
      ENDDO

      DO I = 1, 10, 2
         S = S + W(I)
      ENDDO

      END

********************************************************************************

      PROGRAM MAIN

      REAL X(10), Y(20)
      REAL A(2 ,2), B(3, 10), C(10, 3)
      REAL S1, S2, S3, S4

*     Array memory layout
*
*     |--------|
*     | A(1,1) |
*     | A(2,1) |
*     | A(3,1) |
*     | A(1,2) |
*     | A(2,2) |
*     | A(3,2) |
*     | A(1,3) |
*     | A(2,3) |
*     | A(3,3) |
*     |--------|

      CALL SUM(X, Y, S1)
*     S1 = X(1) + X(2) + X(3) + X(4) + Y(1) + Y(3) + Y(5) + Y(7) + Y(9)

      CALL SUM(Y, X, S2)
*     S2 = Y(1) + Y(2) + Y(3) + Y(4) + X(1) + X(3) + X(5) + X(7) + Y(9)

      CALL SUM(X, Y(6), S3)
*     S3 = X(1) + X(2) + X(3) + X(4) + Y(6) + Y(8) + Y(10) + Y(10) + Y(12)

      CALL SUM(A, B, S4)
*     S4 = A(1,1) + A(2,1) + A(1,2) + A(2,2) + B(1,1) + B(3,1) + B(2,2) + B(1,3) + B(3,3)

      CALL SUM(A, C, S5)
*     S5 = ??

      CALL SUM(A, C(6,2), S6)
*     S6 = ??

      END

