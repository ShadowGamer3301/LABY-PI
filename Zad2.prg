SOB PROGRAM
SOB PRZERW1
SOB PRZERW2
SOB PRZERW3
SOB PRZERW4

PROGRAM:
//Pocz¹tkowa inicjalizacja zmiennych
POB ST0
£AD WYS //Wyzeruj nr linii
PÊTLA_WER: POB WYS_MAX
           ODE WYS
           SOZ KONIEC //SprawdŸ czy osi¹gniêto limit kolumn jeœli tak przejdŸ do nastêpnej linii
           SOM KONIEC //Jeœli z jakiegoœ przypadku opuszczono limit równie¿ przejdŸ do nastêpnej linii
           POB ST0
           £AD SZER //Wyzeruj nr kolumny
           PÊTLA_SZER: POB SZER_MAX
                       ODE SZER
                       SOZ NASTÊPNA_LINIA //SprawdŸ czy osi¹gniêto limit kolumn jeœli tak przejdŸ do nastêpnej linii
                       SOM NASTÊPNA_LINIA //Jeœli z jakiegoœ przypadku opuszczono limit równie¿ przejdŸ do nastêpnej linii
                       POB ZNAK
                       WYP 2
                       POB SZER
                       DOD ST1
                       £AD SZER
                       SOB PÊTLA_SZER     

KONIEC: STP

NASTÊPNA_LINIA: POB ENTER
                WYP 2
                POB WYS
                DOD ST1
                £AD WYS
                SOB PÊTLA_WER

PRZERW1: CZM MASKA
         MAS 15
         DNS
         POB ZNAK1
         WYP 2
         PZS
         MSK MASKA
         PWR
PRZERW2: SOB KONIEC
PRZERW3: CZM MASKA
         MAS 15
         DNS
         POB ZNAK3
         WYP 2
         PZS
         MSK MASKA
         PWR
PRZERW4: CZM MASKA
         MAS 15
         DNS
         POB ZNAK4
         WYP 2
         PZS
         MSK MASKA
         PWR

SZER_MAX: RST 10
SZER: RPA
WYS_MAX: RST 10
WYS: RPA
ST0: RST 0
ST1: RST 1
ENTER: RST 10
ZNAK: RST '@'
ZNAK1: RST '1'
ZNAK3: RST '3'
ZNAK4: RST '4'
MASKA: RPA