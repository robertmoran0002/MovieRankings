film_c = eye(212);
pg_comedy_matrix = pg_movies.Comedy;

for i = 1:212
    if (pg_comedy_matrix(i,1) == 1)
        for j = 1:212
            if (pg_comedy_matrix(j,1) == 1)
                film_c(i,j) = 1;
            end
        end
    end
end

spy(film_c)
eig(film_c)
