![poster](https://github.com/Dayvsontp/newman_serverest/blob/master/Postman/robot-1.png)

## 🤘 Sobre

Repositório do projeto de testes automatizados Web do blog do Agi, construído com robotframework! O Robotframework é uma ferramenta de código aberto que revoluciona a automação de testes em sistemas web,api e mobile, oferecendo uma abordagem eficaz e altamente confiável.

## 💻 Tecnologias e Requisitos
- VScode
- Robotframework 7.3.2
- Python 3.11.9
- Allure 2.35.1
- Github Actions

## 🤖 Como executar

1. Clonar o repositório ou fork, instalar o arquivo requirements(existente na raiz do projeto)
```
pip install -r requirements.txt 
```

2. Executar testes em Headless
```
Existem três gatilhos no arquivo TestRobot.yml, onde pode disparar com ou sem alterações no projeto
```

3. Executar ver o relatório dos testes
```
Após realizar a execução no github action, é criado uma pasta temporaria allure-results e será
criado um arquivo .zip com o artefato para consulta no allure.
OBS: é necessario realizar a instalação do allure na maquina local, pois na CLI não possivel visualizar

e ai dando o comando "allure serve ." dentro da pasta que foi extraido o arquivo .zip é possivel visuali-
zar os resultados dos testes e o tratamento de erro feito em caso de instabilidade do sistema

```

<hr>
