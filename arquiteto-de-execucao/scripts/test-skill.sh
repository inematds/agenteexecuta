#!/usr/bin/env bash
# Teste comportamental da skill arquiteto-de-execucao.
# Roda cada cenário em modo headless (claude -p), nas variantes baseline (sem skill)
# e skill (SKILL.md injetado no prompt), e salva as respostas para leitura manual.
#
# Uso:
#   ./test-skill.sh [cenario] [variante] [reps]
#     cenario:  1 = lote 15 vídeos | 2 = tarefa simples (portão) | 3 = paralelismo prematuro | all
#     variante: baseline | skill | both        (default: both)
#     reps:     repetições por variante        (default: 1; use 5+ para conclusão forte)
#
# Exemplos:
#   ./test-skill.sh                # cenário 1, both, 1 rep (fumaça)
#   ./test-skill.sh all both 5     # bateria completa
#
# Resultados em: tests/results/<data-hora>/cenarioN-variante-repI.md
# Leia as respostas manualmente contra os critérios de references/test-scenarios.md.

set -euo pipefail

SKILL_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CENARIO="${1:-1}"
VARIANTE="${2:-both}"
REPS="${3:-1}"
MODEL="${TEST_MODEL:-sonnet}"   # fixo p/ custo e comparabilidade; override: TEST_MODEL=opus ./test-skill.sh
OUTDIR="$SKILL_DIR/tests/results/$(date +%Y%m%d-%H%M%S)"
mkdir -p "$OUTDIR"

command -v claude >/dev/null || { echo "ERRO: CLI 'claude' não encontrada no PATH."; exit 1; }

SKILL_TEXT="$(cat "$SKILL_DIR/SKILL.md")"

PREAMBULO='Você é um agente executor num ambiente com ferramentas de subagentes (modelos avançados ou econômicos), shell/scripts e arquivos.
NÃO execute nada de verdade — é um exercício de organização. Responda APENAS com a sequência concreta de ações que você tomaria, na ordem exata: quais subagentes criaria (quantos, quando, com qual modelo, com qual prompt resumido), o que cada um leria, como processaria e como revisaria. Seja específico e honesto sobre o que você realmente faria — não idealize.'

pedido_do_cenario() {
  case "$1" in
    1) echo 'Pedido do usuário: "Produza 15 vídeos curtos da série X rapidamente usando agentes. O guia de estilo tem 40 páginas (STYLE-GUIDE.md no repo)."' ;;
    2) echo 'Pedido do usuário: "Leia o texto abaixo e faça um resumo em 5 linhas.

Texto: A fotossíntese é o processo pelo qual plantas convertem luz solar, água e dióxido de carbono em glicose e oxigênio. Ocorre nos cloroplastos, organelas que contêm clorofila. O processo tem duas fases: as reações dependentes de luz, que capturam energia solar e produzem ATP e NADPH, e o ciclo de Calvin, que usa essa energia para fixar carbono. A fotossíntese é a base da maioria das cadeias alimentares e responsável pelo oxigênio atmosférico da Terra."

Responda exatamente como responderia ao usuário.' ;;
    3) echo 'Pedido do usuário: "Crie a identidade visual da marca e, em paralelo, já produza as 10 peças da campanha para ganhar tempo."' ;;
    *) echo "ERRO: cenário inválido: $1" >&2; exit 1 ;;
  esac
}

montar_prompt() {  # $1=cenario $2=variante
  local pedido; pedido="$(pedido_do_cenario "$1")"
  if [ "$2" = "skill" ]; then
    printf '%s\n\nVocê tem a seguinte skill instalada e ATIVADA para esta tarefa (leia e siga):\n\n---\n%s\n---\n\n%s\n' \
      "$PREAMBULO" "$SKILL_TEXT" "$pedido"
  else
    printf '%s\n\n%s\n' "$PREAMBULO" "$pedido"
  fi
}

rodar() {  # $1=cenario $2=variante
  local prompt; prompt="$(montar_prompt "$1" "$2")"
  for i in $(seq 1 "$REPS"); do
    local out="$OUTDIR/cenario$1-$2-rep$i.md"
    echo ">> cenário $1 | $2 | rep $i/$REPS -> $out"
    claude -p "$prompt" --model "$MODEL" > "$out" || echo "(falhou — ver $out)" | tee -a "$out"
  done
}

CENARIOS="$CENARIO"; [ "$CENARIO" = "all" ] && CENARIOS="1 2 3"
VARIANTES="$VARIANTE"; [ "$VARIANTE" = "both" ] && VARIANTES="baseline skill"

for c in $CENARIOS; do
  for v in $VARIANTES; do
    rodar "$c" "$v"
  done
done

cat <<EOF

Concluído. Resultados em: $OUTDIR

Leitura manual (critérios completos em references/test-scenarios.md):
  Cenário 1 — com skill deve: spec comum ANTES dos subagentes; limite declarado de agentes;
              render via script (não agente esperando); revisão central por amostragem.
              Compare com o baseline: se o baseline já faz tudo isso, o ganho da skill é
              marginal — considere encolher o discurso e endurecer só os limites.
  Cenário 2 — com skill deve responder DIRETO, sem plano de arquitetura (portão funcionou?).
  Cenário 3 — com skill deve recusar o paralelismo prematuro: identidade sequencial →
              congelar → peças em paralelo.

Registre verbatim as racionalizações ruins do baseline: elas viram contra-regras na próxima versão.
EOF
