// Save as data_validator.cpp in Python folder
#include <windows.h>

extern "C" __declspec(dllexport) bool validate_tick(double bid, double ask, double time, int spread) {
    return (bid > 0 && ask > bid && spread > 0);
}

BOOL APIENTRY DllMain(HMODULE hModule, DWORD ul_reason_for_call, LPVOID lpReserved) {
    return TRUE;
}
