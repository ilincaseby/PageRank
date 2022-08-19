function [R1 R2] = PageRank(nume, d, eps)
	% Calculeaza indicii PageRank pentru cele 3 cerinte
	% Scrie fisierul de iesire nume.out
  %Vectorii cu algebraic si iterative
  R_first = Iterative(nume, d, eps);
  R_second = Algebraic(nume, d);
  fid_r = fopen(nume, 'r');
  out_n = strcat(nume, '.out');
  %fid_w = fopen(out_n, 'w');
  n = fscanf(fid_r, '%d', 1);
  matrix = zeros(n, n);
  for i = 1:n
    node = fscanf(fid_r, '%d', 1);
    no_of_con = fscanf(fid_r, '%d', 1);
    for j = 1:no_of_con
      pointing = fscanf(fid_r, '%d', 1);
      matrix(node, pointing) = 1;
    endfor
  endfor
  for i = 1:n
    matrix(i, i) = 0;
  endfor
  value1 = fscanf(fid_r, '%f', 1);
  value2 = fscanf(fid_r, '%f', 1);
  fclose(fid_r);
  fid_w = fopen(out_n, 'w');
  for_print = fprintf(fid_w, '%d\n', n);
  for i = 1:(2 * n + 2)
    if i <= n
      for_print = fprintf(fid_w, '%f\n', R_first(i));
    endif
    if i == (n + 1)
      for_print = fprintf(fid_w, '\n');
    endif
    if i > (n + 1) && i < (2 * n + 2)
      for_print = fprintf(fid_w, '%f\n', R_second(i - n - 1));
    endif
    if i == (2 * n + 2)
      for_print = fprintf(fid_w, '\n');
    endif
  endfor
  PR1 = R_second;
  for i = 1:(n - 1)
    for j = (i + 1):n
      if (PR1(i) < PR1(j))
        tmp = PR1(i);
        PR1(i) = PR1(j);
        PR1(j) = tmp;
      endif
    endfor
  endfor
  
  %print in the form: i j F
  for i = 1:n
    for j = 1:n
      a = PR1(i);
      b = R_second(j);
      if a==b
        for_print = fprintf(fid_w, '%d %d ', i, j);
        break
      endif
    endfor
    for_print = fprintf(fid_w, '%f\n', Apartenenta(PR1(i), value1, value2));
  endfor
  fclose(fid_w);
  R1 = R_first;
  R2 = R_second;
  endfunction
