      PROGRAM MAIN
      INTEGER N
      REAL FACT

      WRITE(*,*) 'FACT(N). N?'
      READ(*,*) N

      FACT = 1
      DO I = 1, N
         FACT = FACT * I
         WRITE(*,*) 'FACT(',I,') = ', FACT
      ENDDO

      END
