function R = Iterative(nume, d, eps)
	% Functia care calculeaza matricea R folosind algoritmul iterativ.
	% Intrari:
	%	-> nume: numele fisierului din care se citeste;
	%	-> d: coeficentul d, adica probabilitatea ca un anumit navigator sa continue navigarea (0.85 in cele mai multe cazuri)
	%	-> eps: eruarea care apare in algoritm.
	% Iesiri:
    
    fid = fopen(nume, "r");
    n = fscanf(fid, '%d', 1);
    mat = zeros(n);
    l = zeros(1, n);
    for index = 1:n
        node = fscanf(fid, '%d', 1);
        second_for = fscanf(fid, '%d', 1);
        l(1, [node]) = second_for;
        for index2 = 1:second_for
            neighbour = fscanf(fid, '%d', 1);
            mat([node], [neighbour]) = 1;
            if node == neighbour
              l(1, [node]) = l(1, [node]) - 1;
            endif
        endfor
    endfor
    for i = 1:n
      mat(i, i) = 0;
    endfor
    matrix_for_calculus = zeros(n);
    for i = 1:n
        for j = 1:n
            if mat(j, i) == 1
                matrix_for_calculus(i, j) = 1 / l(1, j);
            endif
        endfor
    endfor
    R_first = zeros(n,1);
    R_second = zeros(n,1);
    for i = 1:n
      R_first(i, 1) = 1 / n;
    endfor
    line_one = zeros(n, 1);
    for i = 1:n
      line_one(i, 1) = 1;
    endfor
    R_second = d * matrix_for_calculus * R_first + ((1 - d) / n)*line_one;
    acceptance = zeros(n, 1);
    while 1 != 0
      acceptance = R_second - R_first;
      sum = 0;
      for j = 1:n
        sum = sum + (acceptance(j, 1) * acceptance(j, 1));
      endfor
      is_enough = sqrt(sum);
      disp(is_enough)
      if is_enough <= eps
        break;
      endif
      R_first = R_second;
      R_second = d * matrix_for_calculus * R_first + ((1 - d) / n)*line_one;
    endwhile
    fclose(fid);
    R = R_first;
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina.
endfunction