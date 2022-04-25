%% Section 2.1

% Summarizes the data from pg_movies
summary(pg_movies);

%% Section 2.2

% Forms the given matrix
A = [1 1 0 1 1; 1 1 0 0 0; 0 0 1 1 1; 1 0 1 1 1; 1 0 1 1 1];

% Computes the eigenvalues of A
E = eig(A);

% Produces matrix 'D' with eigenvalues and matrix 'V' whose columns are the
% corresponding eigenvectors from matrix A
[V,D] = eig(A);

%% Section 2.4

% Creates 212x212 identity matrices to be used for the action film matrix
% and the comedy film matrix (each movie is related to itself).
film_a = eye(212);
film_c = eye(212);

% Creates a 212x1 matrix from the respective genre column from pg_movies
pg_action_matrix = pg_movies.Action;
pg_comedy_matrix = pg_movies.Comedy;

% Fills in a value of '1' in the 'film_a' matrix and/or the 'film_c' matrix
% if the movies is related to the respective genre.
for i = 1:212 % row
    if (pg_action_matrix(i, 1) == 1)
        for j = 1:212 % column  
            if (pg_action_matrix(j, 1) == 1)
                film_a(i, j) = 1;
            end
        end
    end
    if (pg_comedy_matrix(i, 1) == 1)
        for j = 1:212 % column  
            if (pg_comedy_matrix(j, 1) == 1)
                film_c(i, j) = 1;
            end
        end
    end
end

% Plots the sparsity pattern for the action film matrix
spy(film_a)

% Plots the sparsity pattern for the comedy film matrix
spy(film_c)


%% Section 2.5

% Creates 212x212 identity matrix to be used for all genres (each movie is
% related to itself).
film = eye(212);

% Creates a 212x1 matrix from the respective genre column from pg_movies
pg_animation_matrix = pg_movies.Animation;
pg_documentary_matrix = pg_movies.Documentary;
pg_drama_matrix = pg_movies.Drama;
pg_romance_matrix = pg_movies.Romance;
pg_short_matrix = pg_movies.Short;

% Fills in a value of '1' in the 'film' matrix if the movie is related
% to the respective genre.
for i = 1:212 % row
    if (pg_action_matrix(i, 1) == 1)
        for j = 1:212 % column  
            if (pg_action_matrix(j, 1) == 1)
                film(i, j) = 1;
            end
        end
    end
    if (pg_animation_matrix(i, 1) == 1)
        for j = 1:212 % column
            if (pg_animation_matrix(j, 1) == 1)
                film(i, j)= 1;
            end
        end
    end
    if (pg_comedy_matrix(i, 1) == 1)
        for j = 1:212 % column
            if (pg_comedy_matrix(j, 1) == 1)
                film(i, j)= 1;
            end
        end
    end
    if (pg_documentary_matrix(i, 1) == 1)
        for j = 1:212 % column
            if (pg_documentary_matrix(j, 1) == 1)
                film(i, j)= 1;
            end
        end
    end
    if (pg_drama_matrix(i, 1) == 1)
        for j = 1:212 % column
            if (pg_drama_matrix(j, 1) == 1)
                film(i, j)= 1;
            end
        end
    end
    if (pg_romance_matrix(i, 1) == 1)
        for j = 1:212 % column
            if (pg_romance_matrix(j, 1) == 1)
                film(i, j)= 1;
            end
        end
    end
    if (pg_short_matrix(i, 1) == 1)
        for j = 1:212 % column
            if (pg_short_matrix(j, 1) == 1)
                film(i, j)= 1;
            end
        end
    end
end

% Eigenvalues of the 'film' matrix
B = eig(film);

% Y is a diagonal matrix of the eigenvalues of the 'film' matrix. 'X' is the
% corresponding eigenvectors.
[X,Y] = eig(film);

% Finds the row from 'Y' with the greatest eigenvalue.
[P,R] = max(diag(Y));

% Isolates the eigenvector corresponding with the greatest eigenvalue.
TT = X(:,R);

% 'Q' contains the absolute values of the eigenvector in ascending order. 
% 'I' contains the indices of the eigenvector corresponding to the rows in
% pg_movies
[Q,I] = sort(abs(TT));

% This indicates that Lilo & Stitch is the most strongly correlated movie
% to all genres.


%% Section 2.7

% Creates 212x212 identity matrix to be used for the action, drama, and
% romance genres (each movie is related to itself).
film_2 = eye(212);

% Creates a 212x1 matrix from the respective genre column from pg_movies
pg_action_matrix = pg_movies.Action;
pg_drama_matrix = pg_movies.Drama;
pg_romance_matrix = pg_movies.Romance;


% Fills in a value of '1' in the 'film_2' matrix if the movie is related
% to the respective genre.
for i = 1:212 % row
    if (pg_action_matrix(i, 1) == 1)
        for j = 1:212 % column  
            if (pg_action_matrix(j, 1) == 1)
                film_2(i, j) = 1;
            end
        end
    end
    if (pg_drama_matrix(i, 1) == 1)
        for j = 1:212 % column
            if (pg_drama_matrix(j, 1) == 1)
                film_2(i, j)= 1;
            end
        end
    end
    if (pg_romance_matrix(i, 1) == 1)
        for j = 1:212 % column
            if (pg_romance_matrix(j, 1) == 1)
                film_2(i, j)= 1;
            end
        end
    end
end

% Eigenvalues of the film matrix for action, drama, and romance
B2 = eig(film_2);

% 'Y2' is a diagonal matrix of the eigenvalues of the film matrix. 'X2' is the
% corresponding eigenvectors.
[X2,Y2] = eig(film_2);

% Finds the row from 'Y2' with the greatest eigenvalue.
[P2,R2] = max(diag(Y2));

% Isolates the eigenvector corresponding with the greatest eigenvalue.
TT2 = X2(:,R2);

% 'Q2' contains the absolute values of the eigenvector in ascending order. 
% 'I2' contains the indices of the eigenvector corresponding to the rows in
% pg_movies
[Q2,I2] = sort(abs(TT2));

% This indicates that 'Star Trek: Insurrection' is the most related movie,
% 'The Work and the Glory' is the second most related movie, and 'What a
% Girl Wants' is the third most related movie to the action, drama, and
% romance genres.