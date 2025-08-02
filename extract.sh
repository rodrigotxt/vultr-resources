#!/bin/bash
# chmod +x extract.sh
# Use: VULTR_API_KEY=your_api_key ./extract.sh
# requirements: curl, jq and VULTR_API_KEY environment variable set

ENDPOINTS=(
  "applications"
  "regions"
  "os"
  "plans"
)

PER_PAGE=500
OUTPUT_DIR="./data"

# Verifica se o jq está instalado
if ! command -v jq &> /dev/null; then
  echo "Erro: 'jq' não está instalado. Instale com 'sudo apt install jq' ou equivalente."
  exit 1
fi

# Verifica se a variável de ambiente está definida
if [ -z "$VULTR_API_KEY" ]; then
  echo "Erro: variável de ambiente VULTR_API_KEY não definida."
  exit 1
fi

mkdir -p "$OUTPUT_DIR"

for endpoint in "${ENDPOINTS[@]}"; do
  echo "⏳ Buscando dados de: $endpoint..."

  OUTPUT_FILE="$OUTPUT_DIR/${endpoint}.json"

  PAGE=1
  ALL_ITEMS=()

  while true; do
    RESPONSE=$(curl -s \
      -H "Authorization: Bearer ${VULTR_API_KEY}" \
      -H "Content-Type: application/json" \
      "https://api.vultr.com/v2/$endpoint?page=$PAGE&per_page=$PER_PAGE")

    if [ -z "$RESPONSE" ]; then
      echo "❌ Erro ao buscar página $PAGE do endpoint $endpoint"
      break
    fi

    ITEMS=$(echo "$RESPONSE" | jq '[.[] | select(type == "array") | .[]]')
    COUNT=$(echo "$ITEMS" | jq 'length')

    if [ "$COUNT" -eq 0 ]; then
      break
    fi

    ALL_ITEMS+=("$ITEMS")
    ((PAGE++))

    if [ "$COUNT" -lt "$PER_PAGE" ]; then
      break
    fi
  done

  echo "${ALL_ITEMS[@]}" | jq -s 'add' > "$OUTPUT_FILE"

  if [ $? -eq 0 ]; then
    echo "✅ Salvo em: $OUTPUT_FILE"
  else
    echo "❌ Falha ao salvar JSON final do endpoint $endpoint"
  fi
done
