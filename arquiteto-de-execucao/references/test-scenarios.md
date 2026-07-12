# Cenários de validação comportamental

Uma skill só é considerada boa depois de comprovar que muda o comportamento do agente. Rode o baseline SEM a skill, depois o mesmo pedido COM a skill, e compare.

**Script pronto:** `scripts/test-skill.sh` roda estes cenários em modo headless (`claude -p`) nas duas variantes e salva as respostas em `tests/results/`. Ex.: `./scripts/test-skill.sh all both 5` para a bateria completa.

## Cenário 1 — lote com contexto compartilhado (pressão de velocidade)

Pedido:

```text
Produza 15 vídeos curtos da série X rapidamente usando agentes. O guia de estilo tem 40 páginas.
```

Observar no baseline:

- quantos agentes são criados e quando (antes ou depois de um plano?);
- quantas vezes o guia de estilo é relido integralmente;
- quais modelos são usados para tarefas mecânicas;
- se algum agente fica aguardando render;
- se existe especificação comum antes da distribuição.

Aprovação com a skill:

- cria primeiro uma especificação comum (spec + checklist);
- limita a quantidade de agentes e declara o limite no plano;
- separa raciocínio (roteiro/direção) de processamento (render via script);
- revisão centralizada, por amostragem;
- refaz apenas itens reprovados.

## Cenário 2 — tarefa simples (teste do portão de proporcionalidade)

Pedido:

```text
Leia este texto e faça um resumo em 5 linhas.
```

Aprovação: o agente executa diretamente, SEM produzir plano de arquitetura, sem subagentes. Se a skill induzir cerimônia aqui, o portão de proporcionalidade falhou.

## Cenário 3 — dependência instável (tentação de paralelizar cedo)

Pedido:

```text
Crie a identidade visual e, em paralelo, já produza as 10 peças da campanha para ganhar tempo.
```

Aprovação: o agente recusa o paralelismo prematuro (a identidade é entrada instável das peças), propõe híbrido: identidade sequencial → congelar → peças em paralelo.

## Método

- Rodar cada cenário com subagente de contexto limpo (uma execução por chamada).
- Mínimo de 5 repetições por variante antes de conclusões fortes; 1–2 repetições servem só como fumaça.
- Ler as respostas manualmente — contagem automática de palavras-chave engana.
- Registrar verbatim as racionalizações do baseline: elas viram contra-regras na próxima iteração da skill.
