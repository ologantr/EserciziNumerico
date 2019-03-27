*     Scrivere un programma che calcola la media di n numeri
*     interi (o reali)

      REAL FUNCTION AVGVECTOR(V, N)
      REAL V(N)
      AVGVECTOR = 0
      DO I = 1, N
         AVGVECTOR = AVGVECTOR + V(I)
      ENDDO
      AVGVECTOR = AVGVECTOR / N
      END

      PROGRAM MAIN
      PARAMETER (MAX = 10)
      REAL AVGVECTOR, V(MAX), AVG
      WRITE(*,*) 'Insert 10 numbers: '
      READ(*,*) (V(I), I = 1, MAX)
      AVG = AVGVECTOR(V, MAX)
      WRITE(*,*) AVG
      END
