## Detalhes das Implementações

### 1. TestComplete
Os testes referentes ao TestComplete presentes neste repositório foram gerados inicialmente de forma automática pela própria ferramenta. 
* **Metodologia:** Os testes foram construídos utilizando a abordagem de **Keyword** (Testes Orientados a Palavras-chave).
* **Funcionamento:** A ferramenta realizou a gravação direta das ações executadas na tela (Record & Playback), convertendo as interações (cliques, digitação, etc.) em uma sequência de keywords executáveis.
* **Exportação:** A conversão e exportação dessas keywords para o formato de script foi realizada somente para que fosse possível compartilhar o código aqui no repositório.

### 2. Power Automate Desktop
A automação feita no Power Automate Desktop foi construída baseada em **Fluxos** (Flows), utilizando também o recurso de gravação de tela para mapear as ações do usuário.
* **Como utilizar:** Como o Power Automate Desktop não possui uma forma nativa e simples de exportar o arquivo do projeto, o código do fluxo foi salvo em um arquivo de texto (`.txt`).
* **Para executar:** Basta abrir o arquivo `.txt` do Power Automate disponível neste repositório, copiar todo o conteúdo e **colar diretamente na área de fluxo** do seu Power Automate Desktop. Ele irá reconstruir as ações automaticamente.

### 3. AutoIt
Diferente do TestComplete, o AutoIt não possui a funcionalidade de gravação por palavras-chave (keyword testing). Portanto, os scripts foram feitos da maneira "normal", ou seja, o código foi totalmente escrito de forma manual.
Como não dependem de uma interface de gravação, os scripts originais em código fonte (`.au3`) estão salvos diretamente nas pastas do repositório.
