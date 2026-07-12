# Arquiteto de Execução 🧭

Skill que aplica uma etapa de arquitetura antes de trabalhos complexos com agentes de IA: decide conscientemente entre **sequência, paralelismo ou fluxo híbrido**, escolhe o executor mais barato que preserva qualidade e produz o plano **antes** de criar qualquer subagente.

**Guia completo:** https://inematds.github.io/agenteexecuta/guia/

## Estrutura

- `arquiteto-de-execucao/` — a skill (SKILL.md + referências + script de teste)
  - `references/decision-matrix.md` — sinais pontuados e limiar objetivo (≥2 pontos decide; empate → híbrido)
  - `references/output-template.md` — formato do plano (compacto por padrão)
  - `references/execution-limits.md` — limites operacionais, executores, projeto de contexto
  - `references/claude-code.md` / `references/chatgpt-codex.md` — mapeamento por plataforma
  - `references/test-scenarios.md` — cenários de validação comportamental
  - `scripts/test-skill.sh` — teste baseline × com skill em modo headless
- `arquiteto-de-execucao-v2.zip` — pacote pronto para upload (ChatGPT/Codex)
- `paralelismo_vs_sequencial_agentes_ia.md` — artigo-fonte sobre custo de contexto

## Instalar

```bash
# Claude Code
cp -r arquiteto-de-execucao ~/.claude/skills/

# ChatGPT / Codex: subir arquiteto-de-execucao-v2.zip
```

## Testar

```bash
./arquiteto-de-execucao/scripts/test-skill.sh all both 5
```

## Princípio central

> Centralizar decisões, registrar o contexto uma vez, automatizar o trabalho mecânico e paralelizar somente unidades realmente independentes.

```text
3 agentes × (50k contexto + 20k execução) = 210k tokens
1 executor reutilizando o contexto: 50k + 20k×3 = 110k tokens
```
