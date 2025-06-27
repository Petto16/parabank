#!/usr/bin/env bash
set -e

WAR_PATH="target/parabank-5.0.0-SNAPSHOT.war"
SLOGAN="Experience the magic"

echo "🔍  Hľadám kontajner služby 'parabank'..."
CID=$(docker compose ps -q parabank || true)

if [[ -z "$CID" ]]; then
  echo "❌  Kontajner nebeží. Spusti ho: docker compose up -d"
  exit 1
fi

echo "✅  Kontajner ID: $CID"
echo "--------------------------------------------------"

echo "📦  Kontrola lokálneho WAR (grep '$SLOGAN' v $WAR_PATH)"
if grep -a "$SLOGAN" "$WAR_PATH" >/dev/null; then
  echo "✅  Slogan nájdený v lokálnom WAR."
else
  echo "❌  Slogan NEBOL nájdený v lokálnom WAR!"
  exit 1
fi

echo "📦  Kontrola WAR vo vnútri kontajnera"
if docker exec "$CID" grep -a "$SLOGAN" /usr/local/tomcat/webapps/parabank.war >/dev/null; then
  echo "✅  Slogan nájdený aj v kontajneri."
else
  echo "❌  Slogan chýba v kontajneri – skontroluj bind-mount alebo reštart."
  exit 1
fi

echo "--------------------------------------------------"
echo "🎉  Všetko vyzerá v poriadku. Otvor http://localhost:8080/parabank a hard-refreshni (Ctrl/⌘-Shift-R)!"
