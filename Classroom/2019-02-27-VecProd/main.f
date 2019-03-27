      PROGRAM MAIN

      REAL A(3)
      REAL B(3)
      REAL AxB
      REAL BxA(3, 3)

      WRITE(*,*) 'Inserisci vettore riga (A):'
      READ(*,*) (A(I), I = 1, 3)

      WRITE(*,*) 'Inserisci vettore colonna (B):'
      READ(*,*) (B(I), I = 1, 3)

      AxB = 0
      DO I = 1, 3
         AxB = AxB + A(I) * B(I)
      ENDDO

      DO I = 1, 3
         DO J = 1, 3
            BxA(I, J) = A(I) * B(J)
         ENDDO
      ENDDO

      WRITE(*,*)

      WRITE(*,*) 'AxB:'
      WRITE(*,*) AxB

      WRITE(*,*)

      WRITE(*,*) 'BxA:'
      DO I = 1, 3
         WRITE(*,*) (BxA(I, J), J=1, 3)
      ENDDO

      END
