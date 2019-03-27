      PROGRAM MAIN

      REAL K
      K = 0.1

      DO WHILE (K + 1 .GT. 1)
         K = K / 10.0
      ENDDO

      WRITE(*,*) 2 * K

      END
