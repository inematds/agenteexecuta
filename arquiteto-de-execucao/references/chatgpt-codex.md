# Mapeamento: ChatGPT / Codex

Como os conceitos da skill se traduzem no ambiente ChatGPT/Codex. (Escrito em 2026-07; recursos evoluem — confirme na sessão.)

| Conceito | Implementação prática |
|---|---|
| Executor mecânico | shell/terminal do ambiente Codex; scripts Python/bash para conversão, render, testes |
| Subagente barato | tarefa Codex separada com prompt curto e contexto mínimo; modelo menor quando o produto permitir escolha |
| Paralelismo | múltiplas tarefas Codex independentes lançadas em paralelo (cada uma com sua sandbox) |
| Handoff | arquivo `HANDOFF.md` / `PROJECT-STATE.md` commitado no repo — é o que a próxima tarefa vai ler |
| Contexto compartilhado | arquivos no repositório (`PROJECT-SPEC.md`, `AGENTS.md`) — cada tarefa Codex parte do repo, então o repo É a fonte única de verdade |
| Revisão | tarefa central de review sobre os diffs/PRs produzidos; checklist determinístico em CI quando possível |
| Limite de tentativas | instrução explícita no prompt da tarefa ("no máximo 2 tentativas; se falhar, pare e reporte") |

Regras específicas:

- Tarefas Codex paralelas não compartilham estado em tempo real — tudo que precisa ser comum deve estar no repo antes do lançamento (entradas congeladas).
- Consolidar via PRs pequenos e independentes; evitar duas tarefas tocando os mesmos arquivos.
- No ChatGPT (sem sandbox de código), o "executor mecânico" vira instrução para o usuário rodar localmente — registre o comando exato no plano.
