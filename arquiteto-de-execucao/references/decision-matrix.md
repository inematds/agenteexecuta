# Matriz de decisão

Use esta matriz quando a escolha entre sequência, paralelo e híbrido não for evidente.

## Por que o contexto domina o custo

O custo de um projeto com agentes tem duas partes: **preparação** (tudo que o agente lê antes de trabalhar) e **execução** (o trabalho em si). O desperdício típico é a preparação repetida:

```text
3 agentes × (50k de contexto + 20k de execução) = 210k tokens
1 agente reutilizando o contexto: 50k + 20k + 20k + 20k = 110k tokens
```

A economia não vem de "sequencial ser melhor" — vem de **amortizar o contexto compartilhado**. Paralelismo continua valendo quando reduz tempo total sem duplicar preparação (tarefas de contexto pequeno, trabalho mecânico, renders via script).

## Sinais para execução sequencial

Some um ponto para cada condição verdadeira:

- a tarefa depende diretamente da saída anterior;
- o contexto compartilhado é grande;
- decisões precisam permanecer consistentes;
- erros iniciais contaminariam várias tarefas;
- a consolidação de versões divergentes seria cara;
- o aprendizado de uma etapa melhora a seguinte.

## Sinais para execução paralela

Some um ponto para cada condição verdadeira:

- as tarefas são independentes;
- as entradas estão congeladas;
- cada saída pode ser validada isoladamente;
- o trabalho é mecânico ou determinístico;
- o contexto por tarefa é pequeno;
- a urgência é alta;
- existem recursos computacionais disponíveis.

## Interpretação (limiar objetivo)

- **Diferença de 2 pontos ou mais:** vence a estratégia de maior pontuação.
- **Diferença menor que 2, ou empate:** usar arquitetura híbrida.
- **Custo de erro alto (independente da pontuação):** centralizar planejamento e revisão, mesmo que a execução seja paralela.
- **Tarefa simples e pequena:** não aplicar a matriz — executar diretamente.

## Exemplos

### Produção de 15 vídeos

- conceito, identidade e roteiro-base: sequencial;
- geração de variações após aprovação: paralelo;
- renderização: script em paralelo;
- revisão: centralizada por amostragem;
- correções: somente itens reprovados.

Resultado: híbrido.

### Pesquisa de mercado

- definição das perguntas e fontes: sequencial;
- coleta por segmentos independentes: paralelo;
- avaliação de evidências e síntese: sequencial.

Resultado: híbrido.

### Migração de sistema

- arquitetura, contrato de dados e estratégia: sequencial;
- migração de módulos independentes: paralelo controlado;
- testes automatizados: paralelo;
- integração e liberação: sequencial.

Resultado: híbrido com checkpoints rigorosos.

### Conversão de 500 arquivos

- validação de um arquivo de amostra: sequencial;
- conversão do lote: paralelo por workers;
- verificação estatística e amostragem: centralizada.

Resultado: paralelo mecânico com controle central.
