%Convergência
ec= 0.0001; % erro de convergência

%Associando as recompensas adicionadas na descrição do trabalho
rec1=3;
rec2=-1;

% Gama disponibilizado pelo trabalho
gamma=0.5;

%Atribuindo probabilidades
matriz_prob = [0.5 , 0.5 ; 0.5, 1 ; 1, 0 ; 0, 1]; %matriz de probabilidade

v_main = [0, 0];
v_aux = v_main;

iteracao=0;
while ~ verify_error(v_main,v_aux,ec)
    disp('---------------------------')
    iteracao = iteracao + 1; 
    v_aux = v_main;
   
    v_main(1) = rec1 + gamma*max( sum( matriz_prob(1,:).*v_aux) ,  sum( matriz_prob(2,:).*v_aux));
    v_main(2) = rec2 + gamma*max( sum( matriz_prob(3,:).*v_aux) ,  sum( matriz_prob(4,:).*v_aux));

    disp(strcat('Iteração=',num2str(iteracao),' s1= ', num2str(round(v_main(1),2)),' s2 =',num2str(round(v_main(2),2))));
    pause();

end 

function aux= verify_error(v1,v0,ec)
    termo1 = (v1*v1') - (v0-v0');
    parada = abs(termo1 / (v0*v0'));
    if parada < ec
        aux = true;  
    else
        aux= false;
    end
end 


