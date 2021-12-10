# Investigando relação entre vitória do time mandante e estatísticas de partidas da Premier League

# Introdução

Talvez quem criou o futebol não esperasse que o esporte viesse a ter a relevância de hoje em dia. Criado em 1863, na Inglaterra, o futebol é baseado em um simples objetivo para vencer: marcar mais gols que seu adversário.

Entretanto, não é tão simples assim. Em campo estão 22 jogadores, 11 de cada lado, que podem mudar uma partida com uma simples ação, seja ela uma defesa, ou carrinho ou até mesmo um chute que vai parar na arquibancada. Tudo é relevante no futebol, especialmente na liga mais organizada, famosa e discutivelmente, a mais disputada, do mundo, a Premier League, o Campeonato Inglês.

Embora possua esse nome hoje, o Campeonato Inglês foi criado em 1888 sob o nome de Football League, vindo a se chamar Premier League apenas em 1992, após os clubes se organizarem a fim de buscarem aumentar suas receitas. 

O berço do futebol mundial conta com fãs apaixonados ao redor do mundo, o atual campeão europeu, o Chelsea, e estrelas mundiais como Cristiano Ronaldo, Kanté, Kevin de Bruyne, Virgil Van Dijk e afins. Outras estrelas da liga são os técnicos, que muitas vezes revolucionam o futebol, seja na própria Inglaterra ou em outros países. Muitos destes, apresentam esquemas táticos e formas de jogar diferenciadas, resultando em estatísticas diferentes, mas com um mesmo objetivo: vencer.

Uma das facilidades para se vencer um jogo, ainda que externa, é jogar em casa. Durante a pandemia de COVID-19, ocorreram 190 jogos na Premier League, sendo 37,2% destes vencidos pelo time visitante. Antes da pandemia, em 288 jogos, os visitantes haviam vencido apenas 30,2% das partidas. Uma série de outras estatísticas também foram alteradas devido a não presença de público. 

Nos últimos anos, uma nova pratica está ganhando força: apostas online em jogos esportivos, como o futebol. A aposta mais comum é a de vitória de um certo time e, dependendo do confronto, a aposta é teóricamente fácil, pois o nível técnico dos jogadores de um time ou o poder aquisitivo é muito superior a do adversário. Porém, na principal liga do mundo, há muitos times que podem surpreender, assim como o Leicester, campeão em 2016, o que acaba gerando perda para os apostadores e grande lucro para as casas de apostas, uma vez que ainda que mais apostadores apostam numa odd (chance) baixa, que numa odd alta.

Sites como o bet365, dona de um dos times da Inglaterra, o Stoke City, popularizaram esses tipos de apostas, e já contam com diversas opções, como quantidade de escanteios, cartões, gols, apostas individuais, etc. Mesmo com esse leque de opções, a principal aposta ainda é a aposta em quem vai vencer. Há diversas estatísticas, inclusive ao vivo, que podem ajudar a identificar quem será o vencedor, e saber quais são as mais relevantes e o grau de relevância é de interesse geral dos apostadores.

A análise deste estudo irá verificar 3841 partidas da Premier League entre 2010 e 2021, com o Objetivo sendo identificar se o time mandante venceu o jogo, baseado em estatísticas da própria partida.

# Análises descritivas

Essas análises foram baseadas apenas nas estatísticas do time mandante

Aparenta haver uma pequena diferença, quando observamos as medianas, entre os resultados, onde os mandantes que perderam tendem a dar menos chutões do que os que venceram ou empataram.
![chutões](Imagens/chutoes.PNG)


Quando o mandante perde, os escanteios aparentam ocorrer em menor número.
![corner](Imagens/corners.PNG)


Times mandantes que ganharam, parecem possui uma quantidade de faltas cometidas um pouco menor que os demais resultados.
![faltas](Imagens/faltas.PNG)


Nenhuma diferença pode ser percebida na quantidade de impedimentos.
![offside](Imagens/offside.PNG)


Times mandantes que ganharam, parecem possuir mais passes realizados durante a partida.
![passes](Imagens/passes.PNG)


Posse de bola do mandante vencedor aparenta ser um pouco maior que os demais resultados.
![posse](Imagens/posse.PNG)


Quando há ocorrência de 2 cartões vermelhos, o time mandante tende a perder.
![vermelho](Imagens/vermelho.PNG)


Times que venceram aprentar dar mais chutes.
![chute](Imagens/chutes.PNG)


Dar mais chutes no gol aparenta influenciar positivamente na vitória.
![chute_alvo](Imagens/chute_alvo.PNG)


A quantidade de roubadas de bola não aparenta influenciar no resultado.
![roubadas](Imagens/rouba.PNG)


Times que venceram tendem a possuir maior quantidade de toques na bola durante a partida.
![toque](Imagens/toque.PNG)


Comportamento semelhante entre os resultados, não parece interferir na vitória
![amarelo](Imagens/amarelo.PNG)

# Probabilidades

* ## Clearances
* A cada chutão do time mandante, a chance do time mandante ganhar diminui em 9% em relação ao resultado de empate
* A cada chutão do time mandante, a chance do time mandante ganhar diminui em 5% em relação ao resultado de derrota
* A cada chutão do time visitante, a chance do time mandante ganhar aumenta em 7% em relação ao resultado de empate
* A cada chutão do time visitante, a chance do time mandante ganhar aumenta em 5% em relação ao resultado de derrota
* ## Coners
* A cada escanteio do time mandante, a chance do time mandante ganhar diminui em 7% em relação ao resultado de empate
* A cada escanteio do time mandante, a chance do time mandante ganhar diminui em 2% em relação ao resultado de derrota
* A cada escanteio do time visitante, a chance do time mandante ganhar aumenta em 5%  em relação ao resultado de empate
* A cada escanteio do time visitante, a chance do time mandante ganhar aumenta em 3% em relação ao resultado de derrota
* ## Fouls conceded
* A cada falta cometida pelo time mandante, a chance do time mandante ganhar aumenta em 2%  em relação ao resultado de empate
* A cada falta cometida pelo time mandante, a chance do time mandante ganhar aumenta em 1% em relação ao resultado de derrota
* A cada falta cometida pelo time visitante, a chance do time mandante ganhar diminui em 2%  em relação ao resultado de empate
* A cada falta cometida pelo time visitante, a chance do time mandante ganhar aumenta em 2% em relação ao resultado de derrota
* ## Offsides
* A cada impedimento do time mandante, a chance do time mandante ganhar diminui em 5%  em relação ao resultado de empate
* A cada impedimento do time mandante, a chance do time mandante ganhar diminui em 7% em relação ao resultado de derrota
* A cada impedimento do time visitante, a chance do time mandante ganhar aumenta em 1%  em relação ao resultado de empate
* A cada impedimento do time visitante, a chance do time mandante ganhar aumenta em 2% em relação ao resultado de derrota
* ## Passes
* A cada passe do time mandante, a chance do time mandante ganhar diminui em 4%  em relação ao resultado de empate
* A cada impedimento do time mandante, a chance do time mandante ganhar diminui em 3% em relação ao resultado de derrota
* A cada passe do time visitante, a chance do time mandante ganhar aumenta em 3%  em relação ao resultado de empate
* A cada impedimento do time visitante, a chance do time mandante ganhar aumenta em 1% em relação ao resultado de derrota
