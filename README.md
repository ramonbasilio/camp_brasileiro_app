# App_Brasileirão_2023

Projeto pessoal - Desenvolvimento de Aplicativo para acompanhamento dos jogos e times do Brasileirão 2023

## Motivação do projeto

Colocar em prática os conteúdos aprendidos nos últimos meses, unindo um projeto para o portifólio técnico e um gosto pessoal que é o Futebol.

![WhatsApp Image 2023-04-26 at 07 53 32](https://user-images.githubusercontent.com/37743546/234572103-fdd4ef6a-655e-400d-8181-85607ccccfcf.jpeg)

### Caso queira instalar o projeto em seu computador e posteriormente em seu smartphone, segue orientações de como o fazer.

Esse projeto foi (e está) sendo desenvolvido em Flutter, portanto precisa o Flutter precisa estar devidamente instalado em seu computador. Segue link com passo a passo de como instalar, direto do site oficial.

https://docs.flutter.dev/get-started/install


Após essa etapa, faço o clone do projeto, em um diretório de sua preferência.
```diff
git clone https://github.com/ramonbasilio/camp_brasileiro_app.git
```

Entre no diretório do projeto e abra no VS Code ou outro IDE de seu escolha.
```diff
cd camp_brasileiro_app
code ..
```

Execute no terminal dentro do seu projeto o comando para instalar as dependencias.
```diff
flutter pub get
```

Antes de seguir com a excução do aplicativo, você precisa de uma KEY da API para ter acesso aos dados do campeonato. Para tal, entre no link abaixo e faço seu cadastro. 

https://api-futebol.com.br/


De posse da KEY, procure o seguinte arquivo:
#### lib/controlador_api.dart

No método restRequest da classe HttpManager, cole-a no campo Authorization no header. Salve o arquivo.

Por fim, execute o projeto
```diff
flutter run
```

Esse projeto ainda não está finalizado, porém está aberto a melhorias e sugestões. Caso tenham alguma dificuldade ou dúvida, estou disponível.


## Tecnologias Utilizadas

- Flutter
- Dart

## Contribuição

Se você deseja contribuir para o projeto, sinta-se à vontade para enviar um pull request ou abrir uma issue com suas sugestões ou correções.

## Status do Projeto

Este projeto está em desenvolvimento ativo e está aberto a contribuições da comunidade.

## Contato

Se você tiver alguma dúvida ou feedback, entre em contato comigo:

- E-mail: ramon.s.basilio@gmail.com

## Créditos

- https://api-futebol.com.br/ - API utilizada para obter os dados do campeonato.
- [flutter](https://flutter.dev) - Framework de desenvolvimento de aplicativos móveis em Dart.




### Ramon Basilio





