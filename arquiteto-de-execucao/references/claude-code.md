# Mapeamento: Claude Code

Como os conceitos da skill se traduzem nas ferramentas do Claude Code. (Escrito em 2026-07; nomes de ferramentas podem evoluir — confirme na sessão.)

| Conceito | Implementação prática |
|---|---|
| Executor mecânico | `Bash` (com `run_in_background: true` para renders/processos longos — não deixe um agente esperando) |
| Subagente barato | `Agent` tool com `model: "haiku"` ou `"sonnet"` e prompt de contexto mínimo |
| Subagente com contexto herdado | `Agent` com `subagent_type: "fork"` (herda a conversa inteira — use quando o contexto compartilhado já está na sessão) |
| Paralelismo | várias chamadas `Agent` na mesma mensagem; para lotes/fan-out com controle determinístico, `Workflow` com `pipeline()`/`parallel()` |
| Handoff | arquivo `HANDOFF.md` / `PROJECT-STATE.md` no diretório do projeto |
| Contexto compartilhado | arquivos referenciados no prompt do subagente (caminho, não conteúdo colado) |
| Revisão | agente central lê as saídas; ou padrão verificador adversarial no `Workflow` |
| Limite de tentativas | lógica no script do `Workflow` (loop com contador) ou instrução explícita no prompt do subagente |

Regras específicas:

- `Workflow` só com opt-in explícito do usuário (multi-agente em escala consome muitos tokens).
- Isolamento de escrita paralela: `isolation: "worktree"` — caro; só quando agentes mutam os mesmos arquivos.
- O resultado final do subagente volta como texto; peça dados crus/estruturados, não narrativa.
