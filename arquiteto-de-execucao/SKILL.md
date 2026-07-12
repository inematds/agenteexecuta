---
name: arquiteto-de-execucao
description: Use antes de dividir um trabalho entre subagentes ou tarefas paralelas, ao processar lotes que compartilham contexto extenso (vários vídeos, arquivos, pesquisas ou entregas do mesmo tipo), ou quando houver risco de vários agentes relerem o mesmo material — use ANTES de criar o primeiro subagente. | Use before splitting work across subagents or parallel tasks, when processing batches that share extensive context (multiple videos, files, research or same-kind deliverables), or when several agents risk re-reading the same material — use BEFORE spawning the first subagent or starting parallel execution.
---

# Arquiteto de Execução

## Portão de proporcionalidade (primeira decisão)

Esta tarefa exige divisão, múltiplos executores ou contexto compartilhado extenso?

- **Não** → execute diretamente. Não aplique o restante desta skill.
- **Sim** → siga o fluxo abaixo.

## Princípio central

> Centralizar decisões, registrar o contexto uma vez, automatizar o trabalho mecânico e paralelizar somente unidades realmente independentes.

Três agentes relendo 50 mil tokens de contexto cada podem custar quase o dobro de um executor que reutiliza o mesmo contexto. A economia vem de **amortizar o contexto compartilhado**, não de "sequencial ser sempre melhor".

## Fluxo

1. **Definir o resultado:** objetivo, entregáveis, critérios de aceite, restrições. Premissas razoáveis declaradas valem mais que perguntas desnecessárias.
2. **Decompor** em unidades com entrada clara, saída verificável e dependências conhecidas. Cada divisão deve reduzir latência, especializar ferramentas ou isolar risco — nunca "usar mais agentes".
3. **Escolher a arquitetura:**
   - **Sequencial:** tarefas dependentes ou com muito contexto compartilhado.
   - **Paralelo:** tarefas independentes com pouco contexto comum.
   - **Híbrido:** planejamento centralizado + execução independente em paralelo (padrão para projetos grandes).

   Em caso de dúvida, pontue com `references/decision-matrix.md`.
4. **Escolher o executor mais barato que preserve qualidade:** script/ferramenta para o mecânico; modelo econômico para tarefas estruturadas; modelo avançado só para estratégia, criação original e decisões ambíguas. Limites, projeto de contexto e listas completas: `references/execution-limits.md`.
5. **Produzir o plano ANTES de criar qualquer subagente**, no formato de `references/output-template.md` (formato compacto por padrão; tabela só para projetos grandes).
6. **Executar:** etapas bloqueantes primeiro; paralelizar só o autorizado no plano; revisar de forma centralizada; refazer somente itens reprovados. Se a realidade contrariar o plano, replanejar antes de criar mais agentes.

## Antipadrões

- vários agentes relendo os mesmos arquivos extensos;
- modelo avançado em tarefa mecânica;
- agente parado aguardando render/processo — inicie o processo e monitore só o estado;
- paralelizar etapas com dependências ainda instáveis;
- delegar sem formato comum de saída.

## Referências

- `references/decision-matrix.md` — pontuação, limiares de decisão e exemplos resolvidos
- `references/output-template.md` — formato do plano de execução
- `references/execution-limits.md` — limites operacionais, escolha de executor, projeto de contexto
- `references/claude-code.md` e `references/chatgpt-codex.md` — mapeamento dos conceitos para a plataforma em uso
- `references/test-scenarios.md` — cenários de validação comportamental da skill
