# Modelo de saída

Adaptar a profundidade ao tamanho do projeto. **O formato compacto é o padrão**; use a tabela apenas em projetos grandes (muitas fases, vários executores, dependências cruzadas).

## Formato compacto (padrão)

```text
Estratégia: híbrida.
Sequencial: planejamento, especificação e revisão final.
Paralelo: tarefas independentes e processamento mecânico.
Executores: modelo avançado para decisões; modelo econômico para checklist; scripts para render e conversão.
Contexto: PROJECT-SPEC.md + CHECKLIST.md.
Limites: até 3 subagentes, 2 tentativas por item e retrabalho apenas dos reprovados.
Risco principal: repetição de contexto e divergência entre saídas.
```

## Formato completo (projetos grandes)

**Estratégia:** sequencial, paralela ou híbrida
**Objetivo:** resultado final em uma frase
**Premissas:** somente as premissas relevantes

| Fase | Tarefa | Modo | Executor | Dependência | Saída |
|---|---|---|---|---|---|
| 1 | ... | sequencial | modelo avançado | nenhuma | ... |
| 2 | ... | paralelo | script/modelo econômico | fase 1 | ... |

**Contexto compartilhado:** arquivos que funcionarão como fonte única de verdade.
**Limites:** número de agentes, tentativas, amostragem e condições de parada.
**Riscos:** duplicação, divergência, custo, erro ou atraso.
**Critério de conclusão:** condições objetivas de aceite.
