#import "DataValidator.dll"
bool validate_tick(double bid, double ask, double time, int spread);
#import

void OnTick() {
   MqlTick tick;
   if (!SymbolInfoTick(_Symbol, tick)) return;
   long spread = SymbolInfoInteger(_Symbol, SYMBOL_SPREAD);
   if (validate_tick(tick.bid, tick.ask, tick.time, (int)spread))
      Print("TICK PASSED");
   else
      Print("TICK REJECTED");
}