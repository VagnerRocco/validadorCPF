set scoreboard off

clear

// moldura
@ 01,01 to 03,60 double // cabecalho
@ 04,01 to 10,60 double // corpo
@ 11,01 to 13,60 double // rodape
// variaveis
nContador     := 16
nCpf          := 0
nConstanteA   := 10
nConstanteB   := 11
nAcumuladorA  := 0
nAcumuladorB  := 0
nVerificadorA := 0
nVerificadorB := 0
//say
@ 02,02 say padc("VALIDADOR DE CPF",58)
@ 05,02 say "DIGITE O CPF:          -  "
@ 07,02 say "SITUACAO....:"
@ 12,30 say "@MoonlightSyndicate V.01"

// get e laco para encontrar os dig. verificadores
do while nContador <= 24
   @ 05,nContador get nCpf picture "9"
   read
   nMultiA      := nCpf * nConstanteA
   nAcumuladorA := nAcumuladorA + nMultiA

      if nContador = 16
         nMultiB  := 0
      else
      nMultiB     := nCpf * nConstanteB
      endif

   nAcumuladorB := nAcumuladorB + nMultiB

   nContador++
   nConstanteA--
   nConstanteB--

enddo

// get verificadores
@ 05,26 get nVerificadorA picture "9"
@ 05,27 get nVerificadorB picture "9"
read

nRestoA   := nAcumuladorA % 11

// se verificador for menor que 2
   if nRestoA < 2
      nDigitoX := 0
   else
      nDigitoX := 11 - nRestoA
   endif

nTeste := nDigitoX * 2
nRestoB := (nTeste + nAcumuladorB) % 11

   if nRestoB < 2
      nDigitoY := 0
   else
      nDigitoY := 11 - nRestoB
   endif

// comparando verificador com o digito
   if nDigitoX = nVerificadorA .and. nDigitoY = nVerificadorB
      cMensagem := "CPF VALIDO!"
      cCor      := "G/N"
   else
      cMensagem := "CPF INVALIDO!"
      cCor      := "R/N"
   endif

@ 07,16 say cMensagem color(cCor)

Inkey(0)
