function y = Apartenenta(x, val1, val2)
	% Functia care primeste ca parametrii x, val1, val2 si care calculeaza valoarea functiei membru in punctul x.
	% Stim ca 0 <= x <= 1
  %ideea este ca daca x e pe ramurile extreme nu mai are rost calculul
  if x < val1
    y = 0;
  endif
  if x > val2
    y = 1;
  endif
  %in cazul in care e cuprins intre
  if x >= val1 && x <= val2
    %calcul: a este 1 supra diferente de valoare si b este opusul lui inmultit cu valoarea 1(val1)
    a = 1 / (val2 - val1);
    b = a * val1;
    b = -b;
    y = a * x + b;
  endif
  endfunction
  