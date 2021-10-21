#lendo arquivo
library(readr)
base <- read_csv("df_full_premierleague.csv")

#Exlcuindo dados faltantes
base2 <- base
base2 <- na.omit(base2)
sum(is.na(base2))


#Criando variável resposta
library(dplyr)

base2$M_G <- 0

for(i in 1:3841){
 if(base2$goal_home_ft[i] > base2$goal_away_ft[i]){
   base2$M_G[i] <- 1
 }else if(base2$goal_home_ft[i] < base2$goal_away_ft[i]){
   base2$M_G[i] <- 0
   }else base2$M_G[i] <- 2
}
table(base2$M_G)


#Variáveis de interesse
#home_clearances		: home team clearances in the match
#home_corners		: home team corners in the match
#home_fouls_conceded	: home team fouls conceded in the match
#home_offsides		: home team offsides in the match
#home_passes		: home team passes in the match
#home_possession		: home team possession in the match
#home_red_cards		: home team red cards in the match
#home_shots		: home team shots in the match
#home_shots_on_target	: home team shots on target in the match
#home_tackles		: home team tackles in the match
#home_touches		: home team touches in the match
#home_yellow_cards	: home team yellow cards in the match
#away_clearances		: away team clearances in the match
#away_corners		: away team corners in the match
#away_fouls_conceded	: away team fouls conceded in the match
#away_offsides		: away team offsides in the match
#away_passes		: away team passes in the match
#away_possession		: away team possession in the match
#away_red_cards		: away team red cards in the match
#away_shots		: away team shots in the match
#away_shots_on_target	: away team shots on target in the match
#away_tackles		: away team tackles in the match
#away_touches		: away team touches in the match
#away_yellow_cards	: away team yellow cards in the match


base2 <- base2[,c(9:25,27:32,115)]
base3 <- base2[,c(1:12,24)]

#Mudando classe da variável de interesse
base2$M_G <- as.factor(base2$M_G)
base3$M_G <- as.factor(base3$M_G)

##Definindo classe de referência
base2$M_G <- relevel(base2$M_G, ref="1")
base3$M_G <- relevel(base3$M_G, ref="1")

#Criando amostras treino e teste
library(caret)
set.seed(100)
treino <- createDataPartition(y=base2$M_G,p = 0.8, list = FALSE)

treinando <- base2[treino, ]
testando <- base2[-treino, ]

treino2 <- createDataPartition(y=base3$M_G,p = 0.8, list = FALSE)

treinando2 <- base3[treino, ]
testando2 <- base3[-treino, ]


## Modelo completo
library(nnet)

modelo <- multinom(M_G ~., data = treinando)
summary(modelo)
deviance(modelo)
#4706

AIC <- modelo$aic
AIC

#Aplicando o modelo na amostra Teste
preditor <- predict(modelo, testando)

#Estimando o erro fora da amostra
caret::confusionMatrix(preditor,testando$M_G)
#Accuracy : 0.6597 

lista <- data.frame(testando$M_G, preditor)


## Modelo com estatísticas apenas do mandante
modelo2 <- multinom(M_G ~., data = treinando2)
summary(modelo2)
deviance(modelo2)

AIC <- modelo2$aic
AIC

#Aplicando o modelo na amostra Teste
preditor2 <- predict(modelo2, testando2)

#Estimando o erro fora da amostra
caret::confusionMatrix(preditor2,testando2$M_G)

lista2 <- data.frame(testando2$M_G, preditor2)


#Machine learning
controle <- trainControl(method = "repeatedcv", number = 10, repeats= 3)

modelo_xgb <- caret::train(M_G~ ., data=treinando, method="xgbLinear",trControl=controle)

#Aplicando o modelo na amostra Teste
preditor <- predict(modelo_xgb, testando)

#Estimando o erro fora da amostra
caret::confusionMatrix(preditor,testando$M_G)


#O melhor modelo foi o multinomial com todas as estatísticas


## Modelo multinomial apenas com as variáveis que aparentemente são relevantes

#Retirar as seguintes estatísticas
#Possession
#tackles
#yellow cards
#offsides

base4 <- base2[,-c(4,6,10,12,16,21,23)]
set.seed(100)
treino <- createDataPartition(y=base4$M_G,p = 0.8, list = FALSE)

treinando <- base4[treino, ]
testando <- base4[-treino, ]

##Modelo reduzido
modelo_red <- multinom(M_G ~., data = treinando)
summary(modelo_red)
deviance(modelo_red)
#4706

AIC <- modelo_red$aic
AIC
#4908.354

#Aplicando o modelo na amostra Teste
preditor4 <- predict(modelo_red, testando)

#Estimando o erro fora da amostra
caret::confusionMatrix(preditor4,testando$M_G)
#Accuracy : 0.6128
#A acurácia diminuiu de 0.65 para 0.61, porém 7 variáveis foram excluídas,
#esse modelo reduzido parace ser o melhor
lista4 <- data.frame(testando$M_G, preditor4)
