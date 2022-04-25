film = eye(212);
pg_action_matrix = pg_movies.Action;
hold on
hold off

for i = 1:212
    if (pg_action_matrix(i,1) == 1)
        for j = 1:212
            if (pg_action_matrix(j,1) == 1)
                film(i,j) = 1;
            end
        end
    end
end

spy(film)
A = eig(film);
B = sort(film)



