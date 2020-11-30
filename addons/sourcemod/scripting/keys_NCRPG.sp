#include <sourcemod>
#include <keys_core>
#include <NCIncs/nc_rpg>

#pragma tabsize 0

public Plugin:myinfo =
{
	name = "[Keys] NCRPG",
	author = "Lnk",
	version = "1.0.0",
	url = "csestonia.ru"
};

static const char keys[][] = {"ncrpg_credits", "ncrpg_level", "ncrpg_xp"};

public void OnPluginStart()
{
    LoadTranslations("keys_core.phrases");

    if (Keys_IsCoreStarted()) Keys_OnCoreStarted();
}

public void OnPluginEnd()
{
    for (int i = 0; i < sizeof(keys); i++) Keys_UnregKey(keys[i]);
}

public void Keys_OnCoreStarted()
{
    for (int i = 0; i < sizeof(keys); i++) 
        Keys_RegKey(keys[i], OnKeyParamsValidate, OnKeyUse, OnKeyPrint);
}

public bool:OnKeyParamsValidate(iClient, const String:sKeyType[], Handle:hParamsArr, String:sError[], iErrLen)
{
    static char param[KEYS_MAX_LENGTH];
    int iParam;

    if (GetArraySize(hParamsArr) != 1)
    {
        Format(sError, iErrLen, "%T", "ERROR_NUM_ARGS", iClient);
        return false;
    }

    for (int i = 0; i < sizeof(keys); i++)
    {
        if (!StrEqual(sKeyType, keys[i], false)) continue;

        GetArrayString(hParamsArr, 0, param, KEYS_MAX_LENGTH);
        iParam = StringToInt(param);

        if (iParam <= 0) 
        {
            Format(sError, iErrLen, "Не правильно указано число");
            return false;
        }

        return true;
    }

    return true;
}

public bool:OnKeyUse(iClient, const String:sKeyType[], Handle:hParamsArr, String:sError[], iErrLen)
{
    static char param[KEYS_MAX_LENGTH];
    int iParam;

	GetArrayString(hParamsArr, 0, param, KEYS_MAX_LENGTH);
	StringToIntEx(param, iParam);

    if (StrEqual(sKeyType, keys[0], false)) 
        NCRPG_GiveCredits(iClient, iParam);
    else if (StrEqual(sKeyType, keys[1], false)) 
        NCRPG_SetLevel(iClient, NCRPG_GetLevel(iClient) + iParam);
    else if (StrEqual(sKeyType, keys[2], false)) 
        NCRPG_SetXP(iClient, NCRPG_GetXP(iClient) + iParam);

    return true;
}

public OnKeyPrint(iClient, const String:sKeyType[], Handle:hParamsArr, String:sBuffer[], iBufLen)
{
    static char param[KEYS_MAX_LENGTH];
    GetArrayString(hParamsArr, 0, param, KEYS_MAX_LENGTH);

    if (StrEqual(sKeyType, keys[0], false)) 
        FormatEx(sBuffer, iBufLen, "Вы получили %s кредитов.", param); 
    else if (StrEqual(sKeyType, keys[1], false)) 
        FormatEx(sBuffer, iBufLen, "Вы получили %s +уровней.", param); 
    else if (StrEqual(sKeyType, keys[2], false)) 
        FormatEx(sBuffer, iBufLen, "Вы получили %s опыта.", param); 
}
