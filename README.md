# GitRepoLabs

## Instruções para executar o projeto:
1) Faça o clone deste repositório;
2) Após efetuar o clone, abra o arquivo GitRepoLabs.xcodeproj na pasta GitRepoLabs;
3) Aguarde o projeto ser buildado;
4) Selecione o Schema GitRepoLans e rode o projeto;

## Observações: 
A API do GIT tem Limites de taxa a API REST.
"Todas essas solicitações contam para seu limite de taxa pessoal de 5.000 solicitações por hora. Solicitações feitas em seu nome por um aplicativo GitHub que é de propriedade de uma organização do GitHub Enterprise Cloud têm um limite de taxa maior de 15.000 solicitações por hora. Da mesma forma, solicitações feitas em seu nome por um aplicativo OAuth que é de propriedade ou aprovado por uma organização do GitHub Enterprise Cloud têm um limite de taxa maior de 15.000 solicitações por hora se você for um membro da organização do GitHub Enterprise Cloud."

Caso o app retornar um erro de bad credentials, será necessário você criar um Personal Token para acessar os dados por completo. 

Para isso, gere um token acessando https://github.com/settings/tokens.

Ao gerar o novo token, você vai acessar a pasta GitRepoLabs > GitRepoLabs > Environment > Dev > environment.plist
No campo value da chave PersonalToken, cole sua chave gerada e rode o projeto novamente. 

## Solução adotada:

Para esse projeto, usei a arquitetura MVVMC pelos seguintes motivos:

- Separação de Responsabilidades;
- Gerenciamento de Navegação;
- Reutilização de Código;
- Testabilidade;
- Escalabilidade;
- Facilidade de Manutenção;

## Libs utilizadas:

- SDWebImage;
- JGProgressHUD;
- Quick;
- Nimble;

## Escolhas feitas:

Optei por desenvolver as telas em ViewCode pelos seguintes motivos:

- Controle Total sobre a Interface;
- Consistência e Escalabilidade;
- Reutilização de Componentes;
- Facilidade de Refatoração;
- Melhor Controle sobre a Lógica de Layout;
- Integração com Ferramentas de Versionamento;
- Menos Dependência de Arquivos de Interface;
- Testabilidade;

## O que foi feito de bônus:
- ViewCode;
- Arquitetura com divisão de responsabilidades;
- Uso de Observable; 

 
