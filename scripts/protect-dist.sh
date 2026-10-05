#!/data/data/com.termux/files/usr/bin/bash
set -e

EXPECTED=1105

if [ ! -d "dist" ]; then
  echo "ERROR: dist/ KHONG TON TAI"
  exit 1
fi

ACTUAL=$(find dist -type f | wc -l)

echo "dist/: $ACTUAL/$EXPECTED files"

if [ "$ACTUAL" -ne "$EXPECTED" ]; then
  echo "ERROR: DIST BI THIEU HOAC THUA FILE!"
  echo "Dung build/sua game ngay."
  exit 1
fi

if [ -f "SHA256SUMS" ]; then
  echo "Dang kiem tra SHA256..."
  sha256sum -c SHA256SUMS >/dev/null || {
    echo "ERROR: Co file goc bi mat hoac thay doi!"
    exit 1
  }
fi

echo "OK: dist/ an toan."
