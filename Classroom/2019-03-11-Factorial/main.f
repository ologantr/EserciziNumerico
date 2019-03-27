      INTEGER FUNCTION FACT(N)
      FACT = 1
      DO I = 1, N
         FACT = FACT * I
      ENDDO
      END

      PROGRAM MAIN
      INTEGER N, RESULT, FACT

      WRITE(*,*) "FACT(N). N?"
      READ(*,*) N

      RESULT = FACT(N)

      WRITE(*,*) RESULT
      END
