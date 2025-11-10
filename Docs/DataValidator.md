# DataValidator.dll — Institutional-Grade Tick Hygiene for MT5

## What It Does
Cleans **real-time MT5 tick data** before quantum signals fire. Rejects bad ticks (latency, gaps, invalid spreads) to prevent **garbage-in-garbage-out** in quantum circuits.

## How It Works
- **Pure C DLL** (no Python runtime)
- Called via `#import` in MQL5
- Validates:
  - `bid > 0`
  - `ask > bid`
  - `spread > 0`
- Returns `true` (pass) or `false` (fail)

## Tick PASSED
→ **Clean data** → Safe for QAOA input

## Tick REJECTED
TICK REJECTED: Bad data

→ **Latency, gap, or invalid spread** → Skipped

## Requirements
- Windows 10/11
- MT5 64-bit
- DLL in `MQL5\Libraries\`
- EA with `#import "DataValidator.dll"`

