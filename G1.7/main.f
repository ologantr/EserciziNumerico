*     Analizzare quanto vale la precisione di macchina in singola
*     e doppia precisione

      PROGRAM MAIN

      REAL K
      REAL*8 I

      K = 0.1
      I = 0.1

      DO WHILE (K + 1 .GT. 1)
         K = K / 10.0
      ENDDO

      DO WHILE (I + 1 .GT. 1)
         I = I / 10.0
      ENDDO

      WRITE(*,*) 'Machine epsilon:'
      WRITE(*,*) 'Single precision (REAL*4): ', 10 * K
      WRITE(*,*) 'Double precision (REAL*8): ', 10 * I

      END
