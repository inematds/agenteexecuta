# Paralelismo x Execução Sequencial em Agentes de IA: como reduzir custos sem perder velocidade

Quando usamos agentes de inteligência artificial para executar projetos complexos, surge uma dúvida importante: é melhor colocar vários agentes trabalhando ao mesmo tempo ou usar um único agente realizando as tarefas em sequência?

A resposta não é simplesmente “paralelo é caro” e “sequencial é barato”. O custo depende principalmente de quanto contexto, leitura e raciocínio são repetidos durante o processo.

## De onde vem o custo dos agentes de IA

Em um projeto com IA, normalmente existem dois tipos principais de custo.

O primeiro é o custo de preparação. Ele envolve tudo que o agente precisa ler e compreender antes de começar a trabalhar:

- instruções gerais;
- arquivos de referência;
- padrões visuais;
- exemplos anteriores;
- regras do projeto;
- documentação técnica;
- histórico de decisões.

O segundo é o custo de execução. É o trabalho específico que precisa ser realizado, como:

- escrever um roteiro;
- criar uma cena;
- revisar um vídeo;
- corrigir um código;
- gerar uma composição;
- verificar uma entrega.

O maior desperdício acontece quando vários agentes precisam ler novamente o mesmo material antes de realizar tarefas muito parecidas.

Imagine que cada agente precise ler 50 mil tokens de documentação antes de executar uma tarefa de 20 mil tokens.

Se três agentes trabalharem de forma independente, cada um poderá consumir aproximadamente:

- 50 mil tokens de contexto;
- 20 mil tokens de execução.

Nesse cenário, o consumo total seria próximo de 210 mil tokens.

Agora imagine que um único agente leia o contexto uma vez e execute três tarefas em sequência. O consumo poderia ficar próximo de:

- 50 mil tokens de contexto;
- 20 mil tokens para a primeira tarefa;
- 20 mil tokens para a segunda;
- 20 mil tokens para a terceira.

O total seria próximo de 110 mil tokens.

A economia não acontece simplesmente porque o trabalho foi sequencial. Ela acontece porque o contexto foi reaproveitado.

## A vantagem do paralelismo

O paralelismo continua sendo extremamente útil.

Quando várias tarefas independentes são executadas ao mesmo tempo, o projeto termina mais rapidamente. Três renderizações que levariam 20 minutos cada poderiam levar aproximadamente uma hora em sequência, mas apenas 20 minutos se fossem executadas simultaneamente.

Portanto, o paralelismo normalmente reduz o tempo total de entrega.

O problema aparece quando utilizamos vários agentes inteligentes para tarefas que poderiam ser realizadas por scripts, comandos ou processos mecânicos.

Por exemplo, não é necessário usar um novo agente para cada uma destas tarefas:

- renderizar um vídeo;
- converter um arquivo;
- extrair um frame;
- executar testes;
- fazer upload;
- compactar arquivos;
- gerar versões em diferentes resoluções.

Essas operações podem ser executadas diretamente por ferramentas, scripts ou comandos em background.

Nesse caso, é possível manter o paralelismo sem pagar novamente pelo raciocínio de vários agentes.

## Inteligência em sequência e execução em paralelo

Uma boa arquitetura separa as tarefas que exigem inteligência das tarefas que exigem apenas processamento.

As decisões criativas e estratégicas devem, em geral, ser centralizadas:

- definição do conceito;
- criação do padrão;
- elaboração do roteiro;
- construção das regras;
- escolha do estilo;
- aprovação da estrutura;
- definição dos critérios de qualidade.

Depois que essas decisões estiverem registradas, as tarefas mecânicas podem ser distribuídas e executadas em paralelo:

- renderizações;
- exportações;
- conversões;
- testes;
- geração de arquivos;
- processamento de imagens;
- publicação;
- coleta de resultados.

A melhor regra prática é:

**Use inteligência em sequência, automação em paralelo e arquivos para compartilhar contexto.**

## Por que muitos agentes podem aumentar o custo

### Repetição de contexto

Cada agente isolado normalmente precisa reler os documentos do projeto. Se sete agentes lerem o mesmo arquivo de 30 mil tokens, podem ser processados até 210 mil tokens apenas para repetir a mesma informação.

### Repetição de raciocínio

Cada agente precisa compreender novamente:

- qual é o objetivo;
- qual padrão deve seguir;
- quais erros devem ser evitados;
- como deve entregar o resultado;
- o que já foi decidido.

Esse processo inicial é repetido várias vezes.

### Custo de coordenação

Quanto mais agentes existem, maior pode ser a necessidade de:

- comparar respostas;
- consolidar resultados;
- resolver divergências;
- padronizar entregas;
- corrigir interpretações diferentes;
- transferir informações entre agentes.

Esse esforço é conhecido como custo de coordenação.

### Inconsistência entre entregas

Agentes diferentes podem interpretar o mesmo documento de maneiras distintas. Um pode usar determinada estrutura, outro pode seguir outro padrão e um terceiro pode criar uma abordagem completamente diferente.

Depois será necessário utilizar mais tempo e mais tokens para uniformizar tudo.

## Por que um único agente também pode ficar caro

Manter um agente trabalhando durante uma sessão muito longa também pode gerar desperdício.

À medida que a conversa cresce, o agente pode carregar:

- mensagens antigas;
- tentativas descartadas;
- decisões que já não são relevantes;
- arquivos que pertenciam a outra fase;
- erros anteriores;
- discussões que não ajudam na próxima tarefa.

Dependendo da ferramenta, esse contexto pode ser processado novamente a cada nova interação.

Por isso, a solução não é manter um único agente para sempre. A melhor prática é usar um agente por fase coerente do projeto.

Por exemplo:

1. Planejamento e definição.
2. Produção.
3. Revisão.
4. Publicação.

Ao terminar uma fase, deve-se criar um resumo ou arquivo de handoff contendo apenas o que a próxima fase precisa saber.

## O papel do handoff

O handoff é a transferência organizada de informações entre uma fase e outra.

Em vez de carregar toda a conversa anterior, o agente recebe um documento curto com:

- objetivo do projeto;
- decisões aprovadas;
- padrões obrigatórios;
- arquivos relevantes;
- tarefas concluídas;
- tarefas pendentes;
- erros conhecidos;
- próximos passos.

Isso reduz o contexto e evita que o agente precise interpretar novamente todo o histórico.

Arquivos como estes são muito úteis:

```text
PROJECT-STATE.md
SCENES-SPEC.md
STYLE-GUIDE.md
CHECKLIST.md
HANDOFF.md
ERRORS-AND-GOTCHAS.md
```

Esses arquivos funcionam como memória externa do projeto.

## Boas práticas para reduzir custos

### 1. Centralize as informações comuns

Não repita instruções longas em todos os prompts.

Coloque regras, exemplos e padrões em arquivos e informe ao agente onde encontrá-los.

Em vez de enviar novamente toda a identidade visual, use uma instrução como:

```text
Leia STYLE-GUIDE.md e siga todas as regras descritas nele.
```

### 2. Use agentes somente quando houver necessidade de raciocínio

Antes de criar um agente, pergunte:

- essa tarefa exige interpretação?
- exige decisão?
- exige criatividade?
- exige adaptação?
- exige análise?

Se a resposta for não, provavelmente um script ou comando é suficiente.

### 3. Use modelos menores em tarefas previsíveis

Nem toda tarefa precisa do modelo mais poderoso.

Modelos menores podem executar:

- validação de checklist;
- organização de arquivos;
- classificação simples;
- transformação de formatos;
- preenchimento de templates;
- revisão estrutural;
- extração de informações.

Os modelos mais avançados devem ser reservados para:

- estratégia;
- decisões complexas;
- criação;
- análise profunda;
- solução de problemas;
- avaliação de ambiguidades.

### 4. Evite agentes com missões muito abertas

Prompts como “analise tudo e faça o melhor possível” tendem a aumentar o consumo.

É melhor definir:

- entrada;
- objetivo;
- formato de saída;
- limite de tentativas;
- critérios de aprovação;
- arquivos permitidos;
- ações proibidas.

Quanto mais clara for a tarefa, menor a chance de o agente explorar caminhos desnecessários.

### 5. Divida o projeto por fases

Não misture planejamento, criação, renderização, publicação e auditoria na mesma sessão.

Uma estrutura mais eficiente seria:

```text
Fase 1 — Planejamento
Fase 2 — Especificação
Fase 3 — Produção
Fase 4 — Renderização
Fase 5 — Revisão
Fase 6 — Publicação
```

Cada fase deve receber somente o contexto necessário.

### 6. Faça revisão por amostragem

Nem sempre é necessário analisar dez frames de cada vídeo.

Em projetos padronizados, pode ser suficiente verificar:

- um frame inicial;
- um frame intermediário;
- um frame final.

Uma revisão completa deve ser reservada para os materiais reprovados ou para entregas críticas.

### 7. Não interrompa processos quase concluídos

Cancelar uma renderização ou composição que já está em andamento pode gerar mais custo do que deixá-la terminar.

Antes de cancelar, considere:

- quanto já foi processado;
- quanto falta;
- se o resultado ainda pode ser aproveitado;
- quanto custaria iniciar novamente.

O custo já realizado não deve justificar continuar um processo ruim, mas também não faz sentido reiniciar uma tarefa quase pronta sem necessidade.

### 8. Separe custo de tokens de custo computacional

Uma renderização pode ser barata em tokens de IA, mas ainda consumir:

- GPU;
- CPU;
- memória;
- armazenamento;
- tempo de servidor;
- créditos da plataforma.

Dizer que o render é “quase gratuito” pode ser correto em relação ao uso do modelo, mas não necessariamente em relação à infraestrutura.

### 9. Registre erros e aprendizados

Quando um erro for identificado, registre-o em um arquivo compartilhado.

Isso evita que cada agente descubra novamente o mesmo problema.

Exemplo:

```text
ERRORS-AND-GOTCHAS.md
```

O arquivo pode conter:

- erros conhecidos;
- causas;
- soluções;
- configurações corretas;
- ações que devem ser evitadas;
- exemplos aprovados.

### 10. Defina limites operacionais

Um agente deve saber quando parar.

Podem ser definidos limites como:

- máximo de duas tentativas;
- não reescrever arquivos aprovados;
- não reler diretórios inteiros;
- não criar novos agentes sem autorização;
- não realizar renderização por meio de LLM;
- não revisar materiais que já passaram no checklist.

Esses limites evitam ciclos desnecessários.

## Arquitetura recomendada

Uma estrutura econômica e eficiente pode funcionar assim:

### Agente principal

Responsável por:

- compreender o objetivo;
- definir o padrão;
- criar a especificação;
- tomar decisões;
- resolver ambiguidades.

### Arquivos compartilhados

Responsáveis por guardar:

- estilo;
- cenas;
- regras;
- status;
- checklist;
- erros;
- decisões.

### Processos mecânicos

Executados por:

- scripts;
- comandos;
- filas;
- workers;
- ferramentas de renderização;
- automações.

Esses processos podem funcionar em paralelo.

### Agente de revisão

Um agente menor pode verificar:

- frames selecionados;
- nomes de arquivos;
- resolução;
- duração;
- presença de elementos obrigatórios;
- conformidade com o checklist.

Somente os materiais reprovados voltam para correção.

A estrutura pode ser representada assim:

```text
Planejamento inteligente
          ↓
Especificação central
          ↓
Execuções mecânicas em paralelo
          ↓
Revisão centralizada
          ↓
Correção apenas dos reprovados
```

## Quando usar paralelismo

O paralelismo é indicado quando:

- as tarefas são independentes;
- o resultado de uma não altera a outra;
- existe urgência;
- o processamento é mecânico;
- há infraestrutura disponível;
- o contexto de cada tarefa é pequeno;
- o ganho de velocidade compensa o custo adicional.

## Quando usar sequência

A execução sequencial é indicada quando:

- as tarefas compartilham muito contexto;
- uma decisão influencia a próxima;
- é importante manter consistência;
- existe aprendizado acumulado;
- o orçamento é limitado;
- o trabalho exige supervisão;
- as etapas fazem parte do mesmo raciocínio.

## Quando usar uma abordagem híbrida

Na maioria dos projetos, a melhor solução é híbrida.

Primeiro, um agente central define o trabalho. Depois, várias tarefas mecânicas são executadas simultaneamente. No final, os resultados são reunidos e revisados por um único processo.

Esse padrão é conhecido como fan-out e fan-in:

```text
                Planejamento
                     ↓
        ┌────────────┼────────────┐
      Tarefa 1     Tarefa 2     Tarefa 3
        └────────────┼────────────┘
                     ↓
              Revisão central
```

O planejamento e a revisão são centralizados. A execução é distribuída.

## Conclusão

Paralelismo não é necessariamente desperdício, e execução sequencial não é automaticamente econômica.

O verdadeiro desperdício ocorre quando:

- vários agentes releem o mesmo contexto;
- raciocínios são repetidos;
- tarefas mecânicas são entregues a modelos caros;
- sessões acumulam contexto desnecessário;
- agentes trabalham sem limites;
- não existe uma especificação central;
- resultados precisam ser consolidados várias vezes.

A estratégia mais eficiente é separar pensamento de execução.

**Agentes devem pensar, decidir e resolver ambiguidades. Ferramentas e scripts devem executar tarefas previsíveis.**

A regra prática final é:

**Centralize o raciocínio, registre o contexto, automatize o que é mecânico e paralelize somente o que é realmente independente.**
