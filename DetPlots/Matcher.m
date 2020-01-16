function [score] = Matcher(test, Model)
%score is the final score of the comparison
%test is the feature vector of the query/test signature
%Model is a matrix containing the feature vectors of the signatures
%enrolled in the database. Nx5 values, where N is the number of signatures
%enrolled for the claimed identity

%For loop para comparar test con cada vector de Model. La distancia
%euclidea de test con cada vector de Model, es un score. El score final es
%la media de los scores intermedios.
[N, ~] = size(Model);

finalsum = 0;

for i = 1:N
    diff = test - Model(i,:);
    finalsum = finalsum + norm(diff);
end

score = finalsum/N;
