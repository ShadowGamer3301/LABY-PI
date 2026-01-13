SOB PROGRAM
SOB PRZERW1
SOB PRZERW2
SOB PRZERW3
SOB PRZERW4

PROGRAM: POB ST0
         //Reset zmiennych do wartoœci pocz¹tkowych
         £AD P1_ITER
         £AD P2_ITER
         £AD P3_ITER
         £AD P4_ITER
         //Nieskoñczona pêtla
         PÊTLA:   POB ZNAK
                  WYP 2
                  SOB PÊTLA
KONIEC: STP
         
PRZERW1: CZM MASKA
         MAS 15
         DNS
         POB ZNAK_P1
         WYP 2
         WYP 2
         POB P1_ITER
         DOD ST1
         £AD P1_ITER
         POB MAX_P1_P2
         ODE P1_ITER
         SOZ KONIEC
         SOM KONIEC
         PZS
         MSK MASKA
         PWR         
PRZERW2: CZM MASKA
         MAS 7
         DNS
         POB ZNAK_P2
         WYP 2
         WYP 2
         POB P2_ITER
         DOD ST1
         £AD P2_ITER
         POB MAX_P1_P2
         ODE P2_ITER
         SOZ KONIEC
         SOM KONIEC
         PZS
         MSK MASKA
         PWR
PRZERW3: CZM MASKA
         MAS 3
         DNS
         POB ZNAK_P3
         WYP 2
         WYP 2
         POB P3_ITER
         DOD ST1
         £AD P3_ITER
         POB MAX_P3_P4
         ODE P3_ITER
         SOZ KONIEC
         SOM KONIEC
         PZS
         MSK MASKA
         PWR
PRZERW4: CZM MASKA
         MAS 1  
         DNS    
         POB ZNAK_P4
         WYP 2
         WYP 2   
         POB P4_ITER
         DOD ST1
         £AD P4_ITER
         POB MAX_P3_P4
         ODE P4_ITER
         SOZ KONIEC
         SOM KONIEC
         PZS
         MSK MASKA
         PWR

ZNAK: RST '@'
MAX_P1_P2: RST 4
MAX_P3_P4: RST 8
ZNAK_P1: RST '1'
ZNAK_P2: RST '2'
ZNAK_P3: RST '3'
ZNAK_P4: RST '4'
ST0: RST 0
ST1: RST 1
P1_ITER: RPA
P2_ITER: RPA
P3_ITER: RPA
P4_ITER: RPA
MASKA: RPA