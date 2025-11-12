![poster](https://github.com/Dayvsontp/newman_serverest/blob/master/Postman/robot-1.png)

## 🤘 Sobre

Repositório do projeto de testes automatizados Web do blog do Agi " https://blogdoagi.com.br/" , construído com robotframework! O Robotframework é uma ferramenta de código aberto que revoluciona a automação de testes em sistemas web,api e mobile, oferecendo uma abordagem eficaz e altamente confiável.

## 💻 Tecnologias e Requisitos
- VScode
- Windows/Linux
- Robotframework 7.3.2
- Python 3.11.9
- Allure 2.35.1
- Github Actions

## 🤖 Como executar (com os requisitos acima)

1. Clonar o repositório ou fork, instalar o arquivo requirements(existente na raiz do projeto) e instale o python add no path
```
pip install -r requirements.txt 
```

2. Executar testes em Headless no Github Actions

 Existem três gatilhos no arquivo TestRobot.yml, onde pode disparar com ou sem alterações no projeto

 Execuçao local
```
robot REALIZAR_CONSULTA_DE_SEGUROS_NO_BLOG.robot
```

3. Visualizar o relatório dos testes

 Após realizar a execução no github action, é criado uma pasta temporaria allure-results e será
 criado um arquivo .zip com o artefato para consulta no allure. Em:
  Actions > Clique na ultima execução > Passo Upload Allure Results > Artifact download URL:"Gerada uma URL com um arquivo.zip temporario"

 Existe um gatilho "workflow_dispatch:" que podemos disparar o job a qualquer momento no projeto.
 Clique em Action no menu de cima deste projeto
 Selecione RestAssured tesults.
 Escolhe a branch "master"
 Depois valida a execução e relatorios.

 OBS: é necessario realizar a instalação do allure na maquina local, pois na CLI não possivel visualizar

e ai dando o comando "allure serve ." dentro da pasta que foi extraido o arquivo .zip é possivel visuali-
zar os resultados dos testes e o tratamento de erro feito em caso de instabilidade do sistema


<hr>
