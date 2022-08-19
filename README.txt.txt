// Ilinca Sebastian-Ionut
311CA

Tema1

Iterative:
Am initializat matricea de adiacenta fara a lua in calcul atunci cand nodul
 trimite catre
el insusi. De asemenea nici la numarul de trimiteri nu am luat in calcul acest 
lucru.
Am calculat matricea pentru formula lui R(t + 1).
R la pasul 0 este 1 supra numarul de noduri. Dupa care se calculeaza iterativ 
pana cand
eroarea este acceptata de catre calculator.

Algebraic:
Primii pasi sunt la fel ca la iterative.
Initializez o matrice A cu diferenta dintr In si matricea de calcul. Dupa care 
aplic
algoritmul modificat si imbunatatit din laborator. Dupa care se ia pe rand un vector coloana
si fiecare coloana a lui Q. Se rezolva sistemul de ecuatii prin luarea in
 ordine descrescatoare a liniilor.
R = A_t * (((1 - d) / n) * v_un_col) fiind formula la final dupa ce gasim inversa matricei.

Pagerank:
Se iau vectorii coloana din celelalte doua functii, algebraicul apoi se pune in 
ordine descresatoare.
Cu doua for uri se cauta care indici se intalnesc ca valori are celor doua r-uri:
unul algebraic si celalalt sortat descrescator.
Se calculeaza dupa pentru fiecare caz din acesta o apartenenta, aflam a si b ca functia
sa fie continua si calculam y-ul in 3 cazuri.

P.S. Readme facut pe ultimii 10 metri, I tried my best.
