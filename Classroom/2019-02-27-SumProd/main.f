      PROGRAM MAIN

      REAL V(10)
      REAL S
      REAL P

      READ(*,*) (V(I), I = 1, 10)

      S = 0
      P = 1

      DO I = 1, 10
         S = S + V(I)
         P = P * V(I)
      ENDDO

      WRITE(*,*) 'Sum: ', S
      WRITE(*,*) 'Prod: ', P

      END
