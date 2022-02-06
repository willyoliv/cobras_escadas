# Cobras e Escadas

![badge](https://img.shields.io/github/languages/top/willyoliv/cobras_escadas)
<img alt="Flutter" src="https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white" />

Tabela de conteúdos
=================
<!--ts-->
   * [Sobre o Projeto](#-sobre-o-projeto)
   * [Objetivos](#-objetivos)
   * [Como Executar o Projeto](#-como-executar-o-projeto)
     * [Pré-requisitos](#-pré-requisitos)
     * [Rodando o Aplicativo](#-rodando-o-aplicativo)
   * [Recursos](#-recursos)
   * [Autor](#-Autor)
<!--te-->

---
## 💻 Sobre o Projeto

Este projeto consiste em uma implementação para o Teste Técnico 02 para o seletivo de desenvolvedor de software júnior lançado pela empresa Escribo.

---
## 📝 Objetivos
 - [x] Implemente a parte lógica e a interface do jogo indiano “Cobras e Escadas”.
 - [x] Na sua aplicação é necessário ter uma classe chamada "CobrasEscadas".
 - [x] Essa classe deve ter um método "jogar" que recebe as variáveis "dado1" e "dado2",
e que pode ser chamado independente do estado do jogo ou qual dos jogadores
está na vez.
 - [x] As variáveis "dado1" e "dado2" são os valores dos dados jogados pelo jogador
naquele momento e ambos são inteiros entre 1 e 6. O jogador irá se mover
"dado1+dado2" casas na sua vez.
 - [x] Retorne a frase "Jogador X Venceu!" quando um jogador for vitorioso. Onde X é um
jogador vitorioso que chegou na casa 100 sem nenhum movimento sobrando.
 - [x] Retorne a frase "O jogo acabou!" se algum jogador já tiver vencido o jogo e o outro
jogador tentar chamar o método "jogar".
 - [x] Em qualquer outro caso, retorne "Jogador X está na casa Y". Onde X é o jogador
atual e Y é a casa em que ele estará ao finalizar sua jogada.
 - [x] interface deve ser feita com um aplicativo que rode num dispositivo Android. Ela
deve obrigatoriamente exibir o board do jogo e as representações dos jogadores.

---
## 🚀 Como Executar o Projeto
Os testes foram realizados nos emuladores Pixel 3A e Nexus 4. Abaixo são apresentados os passos necessários para que o App funcione. 

### 📃 Pré-requisitos

Antes de começar, você vai precisar ter instalado em sua máquina as seguintes ferramentas:
[Git](https://git-scm.com), [Flutter](https://flutter.dev/docs/get-started/install). 
Além disto é bom ter um editor para trabalhar com o código como [VSCode](https://code.visualstudio.com/).<br/>

### 🎲 Rodando o Aplicativo

```bash

# Clone este repositório
$ git clone https://github.com/willyoliv/cobras_escadas.git

# Acesse a pasta do projeto no terminal/cmd
$ cd cobras_escadas

# Instale as dependências
$ flutter pub get

# Execute a aplicação 
$ flutter run


```
---

## 🛠 Recursos

- [Flutter](https://flutter.dev): 2.8.1
- [font_awesome_flutter](https://pub.dev/packages/font_awesome_flutter): 9.2.0
- [lottie](https://pub.dev/packages/lottie): 1.2.1

---

## ✏ Autor

Willy Oliveira - [Linkedin](https://www.linkedin.com/in/willy-oliveira-6b02731a0/)
