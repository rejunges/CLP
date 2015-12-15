% O robô deve ser declarado como dinâmico para poder atualizar suas posições após movimento %
:- dynamic robo/3. 

eixoX(100).    % Dimensão horizontal da matriz %
eixoY(100).    % Dimensão vertical da matriz %
robo(2,2,norte). % Robô inicializa no Ponto(2,2), virado para a posição norte %

% Definição do plano: Cores das paredes - Preto é obstáculo, branco é livre %

 % Essas 4 primeiras linhas criam as paredes pretas interiores ao plano %
celula(1,_,preto). 
celula(Dim,_,preto) :- eixoX(Dim).
celula(_,1,preto).
celula(_,Dim,preto) :- eixoY(Dim).
 % Parede de (50, Y), onde o Y vai de 100 até 50 %
celula(X,Y,preto) :- eixoX(DimX) , eixoY(DimY) , X is DimX/2 , Y >= DimY/2.
% Parede de (25, Y), onde o Y vai de 1 até 50 %
celula(X,Y,preto) :- eixoX(DimX), eixoY(DimY), X is DimX/4, Y =< DimY/2. 
% Parede de (75, Y), onde o Y vai de 1 até 50 %
celula(X,Y,preto) :- eixoX(DimX), eixoY(DimY), X is DimX-25, Y =< DimY/2. 
% Tudo que não for parede preta, é parede branca(livre) %
celula(X,Y,branco) :- not(celula(X,Y,preto)).

% Para consulta da posição atual do robô %

posicaoatual() :-
  robo(X,Y,Z),
  format('A posição atual do robô é (x,y): (~w,~w) e está virado para o ~w',[X,Y,Z]).

% Printa a mensagem de que não é possivel movimentar %

naopodeandar() :-
 format('O robô não pode andar até o ponto desejado pois existe um obstáculo no caminho. '),posicaoatual().

% Comando para só virar o lado do robô %

vira(Lado) :-
  (Lado = 'nenhum' -> format('Nenhum lado foi especificado para o movimento');
  retract(robo(X,Y,_)),
  assert(robo(X,Y,Lado)),
  format('Robô virou para sentido ~w',[Lado])).

% Função para movimentar o robô %

calcula(Numero, Lado) :-
  robo(X,Y,_),
  ( Lado = 'oeste' -> somaesquerda(X,Y,Numero,Pode), movimenta(Pode,X,Y,Numero), !;
    Lado = 'leste' -> somadireita(X,Y,Numero,Pode), movimenta(Pode,X,Y,Numero), !;
    Lado = 'norte' -> somacima(X,Y,Numero,Pode), movimenta(Pode,X,Y,Numero), !;
    Lado = 'sul' -> somabaixo(X,Y,Numero,Pode), movimenta(Pode,X,Y,Numero), ! ).

movimenta(Pode,X,Y,Numero) :-
  ( Pode = 'nao' -> naopodeandar(), !;
    Pode = 'esquerda' -> H is X-Numero, retract(robo(_,_,_)), asserta(robo(H,Y,oeste)), posicaoatual(), !;
    Pode = 'direita' -> H is X+Numero, retract(robo(_,_,_)), asserta(robo(H,Y,leste)), posicaoatual(), !;
    Pode = 'cima' -> H is Y+Numero, retract(robo(_,_,_)), asserta(robo(X,H,norte)), posicaoatual(), !;
    Pode = 'baixo' -> H is Y-Numero, retract(robo(_,_,_)), asserta(robo(X,H,sul)), posicaoatual(), ! ).

somaesquerda(X,Y,Numero,Pode) :-
  celula(X,Y,Cor),
  ( Cor = preto -> Pode = 'nao', !;
  	Numero is 0 -> Pode = 'esquerda', !;
    Cor = branco -> A is X - 1, B is Numero - 1, somaesquerda(A,Y,B,Pode) ).

somacima(X,Y,Numero,Pode) :-
  celula(X,Y,Cor),
  ( Cor = preto -> Pode = 'nao', !;
  	Numero is 0 -> Pode = 'cima', !;
    Cor = branco -> A is Y + 1, B is Numero - 1, somacima(X,A,B,Pode) ).

somadireita(X,Y,Numero,Pode) :- 
  celula(X,Y,Cor),
  ( Cor = preto -> Pode = 'nao', !;
  	Numero is 0 -> Pode = 'direita', !;
    Cor = branco -> A is X + 1, B is Numero - 1, somadireita(A,Y,B,Pode) ).

somabaixo(X,Y,Numero,Pode) :-
  celula(X,Y,Cor),
  ( Cor = preto -> Pode = 'nao', !;
  	Numero is 0 -> Pode = 'baixo', !;
    Cor = branco -> A is Y - 1, B is Numero - 1, somabaixo(X,A,B,Pode) ).

% Reconhecimento da entrada %

movimento([X|R]) :-
  (X = 'virar' -> pegalado(R, Lado), vira(Lado); X = 'andar' -> pegapassos(R, Numero), pegalado(R, Lado), calcula(Numero, Lado)).

pegalado([], 'nenhum'). % Se a lista está vazia e não achou nenhum dos lados, não há para onde virar %
pegalado([X|R], Lado) :- 
  robo(_,_,Sentido),
  (X = 'frente' -> Lado = Sentido;
   X = 'esquerda' -> Lado = 'oeste';
   X = 'direita' -> Lado = 'leste';
   X = 'baixo' -> Lado = 'sul';
   X = 'cima' -> Lado = 'norte';
   X = 'norte' -> Lado = 'norte';
   X = 'sul' -> Lado = 'sul';
   X = 'oeste' -> Lado = 'oeste';
   X = 'leste' -> Lado = 'leste'; pegalado(R,Lado)).

% Se a lista estiver vazia e não achou nenhum número, não há movimento %
pegapassos([], 0). 
pegapassos([X|R], Numero) :-
  (integer(X) -> Numero is X;
   X = 'zero' -> Numero is 0;
   X = 'um' -> Numero is 1;
   X = 'dois' -> Numero is 2;
   X = 'tres' -> Numero is 3;
   X = 'quatro' -> Numero is 4;
   X = 'cinco' -> Numero is 5;
   X = 'seis' -> Numero is 6;
   X = 'sete' -> Numero is 7;
   X = 'oito' -> Numero is 8;
   X = 'nove' -> Numero is 9;
   X = 'dez' -> Numero is 10;
   X = 'onze' -> Numero is 11;
   X = 'doze' -> Numero is 12;
   X = 'treze' -> Numero is 13;
   X = 'catorze' -> Numero is 14;
   X = 'quatorze' -> Numero is 14;
   X = 'quinze' -> Numero is 15;
   X = 'dezesseis' -> Numero is 16;
   X = 'dezessete' -> Numero is 17;
   X = 'dezoito' -> Numero is 18;
   X = 'dezenove' -> Numero is 19;
   X = 'vinte' -> Numero is 20; pegapassos(R,Numero)).
