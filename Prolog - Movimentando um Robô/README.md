# Trabalho2-de-CLP-UFPel
Trabalho Prolog: Movimentando um robo
Data de entrega: 7/dez (sem possibilidade de postergação)
Grupo: de até 3 alunos
Fazer um robô se deslocar em um plano composto de NxM células. Esta células descrevem um mapa da superfície, podendo representar uma parede ou um obstáculo qualquer. Uma representação deste plano pode ser dada pelo seguinte trecho de programa Prolog:
eixoX(100).   % Dimensao horizontal da matriz
eixoY(100).   % Dimensão vertical da matriz
celula(1,_,preto)
celula(Dim,_,preto) :- eixoX(Dim).
celula(_,1,preto).
celula(_,Dim,preto) :- eixoY(Dim).
celula(X,Y,preto) :- eixoX(DimX) , eixoY(DimY) , X is DimX/2 , Y < DimY/2.
celula(_,_,branco).
Neste programa, preto corresponde a uma parede e branco a uma zona livre. Existe um plano 100x100 (o valor 100 é um exemplo, dado nos fatos eixoX e eixoY), circundado por paredes. Também devem existir paredes internas e, pelo menos, uma parede vertical no centro do plano, descendo até a metade do plano.
O objetivo é fazer um robô responder ordens de movimento sobre este plano. Estas ordens deve vir sob a forma de listas representando sentenças simples, cada palavra em uma posição da lista. Exemplos:
[Ande 5 células em frente]
[Ande cinco celulas]
[Ande cinco células a esquerda]
[Vire ao norte]
[Ande 5 celulas ao sul]
Nestes exemplos, nos dois primeiros casos o robô avança 5 células. No terceiro, vira para a esquerda e anda 5 células. No quarto vira para o norte (topo da plana) e no quinto vira em direção ao sul (base da planta) e anda 5 casas. Sempre que o movimento não puder ser completado (o robô bater em uma parede), o usuário deve ser informado. ao final de cada movimento, bem sucedido ou não, informar em que posição o robô se encontra e para que lado (norte, sul, leste ou oeste) está virado.
Dicas:
- crie um fato robo(X,Y,Face). em que X é Y indicam a posição do robô e face o lado para o qual está virado (norte, sul, leste, oeste).
- use retract e assert para remover e inserir respectivamente regras no programa. Notadamente, retirar a posição atual do robô e colocar a nova após o movimento. Nota: asserta insere uma regra/fato no início, assertz, no final.
- deve ser informado ":- dynamic robo/3" (sem aspas, para dizer que robo sera inserido é retirado dinativamente da base.
- Deve ser criada uma base de dados que reconheça um conjunto mínimo de palavras para reconhecer as ordens.
Entregar um PDF contendo:
- O fonte do programa desenvolvido, com comentários sobre cada conjunto de regras que o compõe
- Um exemplo da execução, mostrando uma imagem da matriz/plano (desenho das paredes) e as ordens e o caminho percorrido.
