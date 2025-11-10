//+------------------------------------------------------------------+
//| VConnect_DataValidator.mq5 — Pure MQL5 Tick Validator [Free]    |
//+------------------------------------------------------------------+
#property copyright "V-Connect (2025)"
#property version   "1.00"
#property description "Real-time tick validator — rejects bad data for clean signals."
#property strict

bool validate_tick(double bid, double ask, datetime time, int spread) {
   // MQL5 built-in validation (no DLL)
   if (bid <= 0 || ask <= bid || spread <= 0) return false;
   if (time <= 0) return false;
   // Add latency check (optional)
   datetime now = TimeCurrent();
   if (now - time > 60) return false;  // Reject >60s old
   return true;
}

int OnInit() {
   Print("V-Connect Data Validator loaded");
   return(INIT_SUCCEEDED);
}

void OnTick() {
   MqlTick tick;
   if (!SymbolInfoTick(_Symbol, tick)) return;
   long spread = SymbolInfoInteger(_Symbol, SYMBOL_SPREAD);
   
   if (validate_tick(tick.bid, tick.ask, tick.time, (int)spread)) {
      Print("TICK PASSED: ", DoubleToString(tick.bid,_Digits), "/", DoubleToString(tick.ask,_Digits), " spread=", spread);
   } else {
      Print("TICK REJECTED: Bad data");
   }
}
