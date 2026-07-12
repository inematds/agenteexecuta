# Limites operacionais, executores e projeto de contexto

## Escolha do executor (o mais barato que preserve qualidade)

**Modelo avançado** para: estratégia; decisões ambíguas; criação original; síntese complexa; resolução de problemas difíceis; avaliação de risco elevado.

**Modelo econômico** para: checklist; classificação; extração; transformação estruturada; preenchimento de template; revisão formal e repetitiva.

**Script, ferramenta ou comando** para: renderização; conversão de arquivos; upload; compactação; execução de testes; movimentação de arquivos; processamento determinístico.

Não usar agente para aguardar um processo mecânico. Iniciar o processo e acompanhar apenas o estado necessário.

## Projeto de contexto

Criar uma fonte única de verdade quando várias etapas compartilharem informações. Preferir arquivos curtos e especializados:

```text
PROJECT-SPEC.md
STYLE-GUIDE.md
CHECKLIST.md
PROJECT-STATE.md
HANDOFF.md
ERRORS-AND-GOTCHAS.md
```

Regras:

- referenciar arquivos em vez de repetir instruções longas;
- não fazer todos os agentes relerem o repositório inteiro;
- produzir handoff ao trocar de fase;
- remover histórico irrelevante;
- manter decisões aprovadas separadas de discussões antigas;
- registrar erros conhecidos para evitar redescoberta.

## Limites operacionais (padrão)

- nenhum subagente sem tarefa, entrada e saída explícitas;
- no máximo um nível de delegação, salvo necessidade clara;
- máximo de duas tentativas automáticas por item antes de reavaliar a abordagem;
- não reprocessar itens aprovados;
- não cancelar tarefas quase concluídas sem comparar o custo de terminar com o custo de reiniciar;
- revisão por amostragem para lotes de baixo risco;
- revisão completa para itens críticos ou reprovados;
- registrar uso de modelos caros e justificar sua necessidade.

## Regras de economia

- Tratar tokens, tempo de máquina e tempo humano como custos diferentes.
- Não chamar render ou processamento computacional de "gratuito"; dizer "baixo custo de tokens" quando for o caso.
- Considerar o custo de coordenação, consolidação e divergência entre agentes.
- Considerar cache e reutilização de contexto quando a plataforma oferecer esses recursos.
- Preferir um agente por fase coerente — nem um agente único infinito, nem um agente por microtarefa.
- Continuar uma arquitetura ruim só porque já houve gasto é erro: avaliar custo futuro, não custo passado.

## Verificação final

Antes de concluir, confirmar:

- o paralelismo reduziu tempo sem duplicar contexto desnecessariamente;
- tarefas mecânicas foram retiradas dos modelos sempre que possível;
- cada agente tem função distinta e saída verificável;
- existe uma fonte única de verdade;
- o processo possui limites e condição de parada;
- somente itens reprovados retornam para correção;
- a arquitetura escolhida é mais simples do que alternativas equivalentes.
