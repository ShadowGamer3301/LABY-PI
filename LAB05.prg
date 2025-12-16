//Zerowanie licznika
            POB ST0
            £AD L
//Zerowanie rozmiaru tablicy
            £AD RZM_TAB
//Zerowanie indexu
            £AD INDEX
//Zerowanie liczników X i Z
            £AD L_X
            £AD L_Z
//Pobranie znaku z uk³d. wej.
PÊTLA:      WPR 1
//Sprawdzenie znaku
            ODE ZNAK
            SOZ PROCENT
            DOD ZNAK
//Sprawdzenie dolnej granicy przedzia³u
ZAKRES_MIN: ODE ZNAK_MIN
            SOM PÊTLA
            DOD ZNAK_MIN
//Sprawdzenie górnej granicy przedzia³u
            ODE ZNAK_MAX
            SOM W_ZAKRESIE   //Jeœli znak mniejszy od Z
            SOZ W_ZAKRESIE   //Jeœli znak równy Z
            SOB PÊTLA
//Przywrócenie wartoœci do stanu pocz¹tkowego
W_ZAKRESIE: DOD ZNAK_MAX    
//Zapisywanie znaku w tablicy
ET:         £AD TAB
//Przejœcie do nastêpnego indeksu tablicy
            POB ET
            DOD ST1
            £AD ET
//Zwiêkszenie rozmiaru tablicy
            POB RZM_TAB
            DOD ST1
            £AD RZM_TAB  
            SOB PÊTLA
//Zwiêkszenia licznika o jeden
PROCENT:    DOD ZNAK
            POB L
            DOD ST1
            £AD L
//Sprawdzenie czy licznik osi¹gn¹³ max wartoœæ
            POB MAX_L
            ODE L
            SOZ KONIEC
            SOB PÊTLA
//Wypisanie rozmiaru tablicy przy urzyciu podprogramu
KONIEC:     POB RZM_TAB
            SDP Write //Program wypisze dowolny znak który jest w akumlatorze przed wezwaniem
KONIEC2:    POB RZM_TAB
            ODE INDEX
            SOZ WYJŒCIE
//Sprawdzenie znak jest X lub Z
KON_TAB:    POB TAB
            ODE ZNAK_X
            SOZ JEST_X
            DOD ZNAK_X
            ODE ZNAK_MAX
            SOZ JEST_Z
            DOD ZNAK_MAX
//Inkrementacja indeksu i przejœcie do nast. elem. tab.
KON_INK:    POB INDEX
            DOD ST1
            £AD INDEX
            POB KON_TAB
            DOD ST1
            £AD KON_TAB
            SOB KONIEC2
//Dodaj 1 do licznika X
JEST_X:     POB L_X
            DOD ST1
            £AD L_X
            SOB KON_INK
//Dodaj 1 do licznika Z
JEST_Z:     POB L_Z
            DOD ST1
            £AD L_Z
            SOB KON_INK       
WYJŒCIE:    POB L_X
            SOZ WYP_Z
            SOB WYP_X
//Wypisz X tyle razy ile wynosi L_X
WYP_X:      POB L_X
            SOZ WYP_Z
            ODE ST1
            £AD L_X
            POB ZNAK_X
            WYP 2
            SOB WYP_X
//Wypisz Z tyle razy ile wynosi L_Z
WYP_Z:      POB L_Z
            SOZ STOP
            ODE ST1
            £AD L_Z
            POB ZNAK_MAX
            WYP 2
            SOB WYP_Z
//Ostateczne zakoñczenie programu
STOP:       STP
  
//PODPROGRAM
Write:      £AD liczba
            POB Zero
            DNS
            POB liczba
            SOM Abs
Posit:      DZI St10
            MNO St10
            £AD tmp
            POB liczba
            ODE tmp
            DOD Znak0
            DNS
            POB tmp
            DZI St10
            SOZ Koñcz
            £AD liczba
            SOB Posit
Abs:        POB Minus
            WYP 2
            POB Zero
            ODE liczba
            £AD liczba
            SOB Posit
Koñcz:      PZS
            SOZ Wracaj
            WYP 2
            SOB Koñcz
Wracaj:     PWR

//Zmienne podprogramu
Zero:       RST 0
liczba:     RPA
tmp:        RPA
St10:       RST 10
Znak0:      RST '0'
Minus:      RST '-'

//Zmienne programu g³ównego
L:          RPA
MAX_L:      RST 4
ST0:        RST 0
ST1:        RST 1
ZNAK:       RST '%'
ZNAK_MIN:   RST 'P'
ZNAK_MAX:   RST 'Z'
ZNAK_X:     RST 'X'
ZNAK_ZERO:  RST '0'
L_X:        RPA
L_Z:        RPA
INDEX:      RPA
RZM_TAB:    RPA
TAB:        RPA
