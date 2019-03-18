      PROGRAM MAIN
      INTEGER A, B
      WRITE(*,*) 'Insert the first number(A): '
      READ(*,*) A
      WRITE(*,*) 'Insert the second number(B): '
      READ(*,*) B
      IF ((A/B)*B .EQ. A) THEN
         WRITE(*,*) 'A divisibile per B'
      ELSE
         WRITE(*,*) 'A non divisibile per B'
      END IF

      IF ((A/2)*2 .EQ. A) THEN
         WRITE(*,*) 'A is even'
      ELSE
         WRITE(*,*) 'A is odd'
      END IF

      END
