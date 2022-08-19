function R = Algebraic(nume, d)
	% Functia care calculeaza vectorul PageRank folosind varianta algebrica de calcul.
	% Intrari: 
	%	-> nume: numele fisierului in care se scrie;
	%	-> d: probabilitatea ca un anumit utilizator sa continue navigarea la o pagina urmatoare.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina.
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
            if (node == neighbour)
              l(1, [node]) = l(1, [node]) - 1;
            endif
        endfor
    endfor
    for i=1:n
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
    matrix_for_calculus = d * matrix_for_calculus;
    A = zeros(n);
    i_n = zeros(n);
    for i = 1:n
      i_n(i, i) = 1;
    endfor
    A = (i_n - matrix_for_calculus);
    [o p] = size(A);
    Q = zeros(o, p);
    RG = zeros(p);
    
    for i = 1:p
      RG(i, i) = norm(A(:, i), 2);
      Q(:, i) = A(:, i) / RG(i, i);
      for j = i + 1:n
        RG(i, j) = Q(:, i)' * A(:, j);
        A(:, j) = A(:, j) - Q(:, i) * RG(i, j);
      endfor
    endfor
    
    A_t = zeros(n);
    
    Q = Q';
    
    for steps = 1:n
      %for calculus of every column of A_t
      v_col = zeros(n, 1);
      res = Q(:,steps);
      for i = n:-1:1
        total = 0;
        for j = 1:n
          total = total + RG(i, j) * v_col(j);
        endfor
        v_col(i) = (res(i, 1) - total) / RG(i, i);
      endfor
      A_t(:, steps) = v_col;
    endfor
    v_un_col(1:n, 1) = 1;
    R = A_t * (((1 - d) / n) * v_un_col);
    fclose(fid);
    endfunction
    