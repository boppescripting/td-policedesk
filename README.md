<p align="center">
  <img align="center" width="auto" height="300" src="https://i.file.glass/Ub76tkvQgI.png">
</p>

# td-policedesk
Do your civilians have trouble getting in touch with police? Do they stand at the desk for way too long before someone realizes there is a patron in need? *Fear no longer.*

When civilians visit the police department, they may now send a phone notification to all on duty police officers from the police dispatcher to request assistance at the department!

--------

## Installation
### Installation; Non-ThirdEye
1. Copy *td-policedesk* into your resources folder.
2. If you are running a non-English server, you may alter the locale in `Shared/Config.lua`.

### Installation; ThirdEye
1. Copy *td-policedesk* into your resources folder.
2. If you are running a non-English server, you may alter the locale in `Shared/Config.lua`.
3. Open `td-policedesk/Shared/Config.lua` and ensure line 9 is as follows: `TDPD.Config.ThirdEye = false`

### Installation; GhzGarage MDT & Linden OutlawAlert
The following instructions are only useful when using GhzGarages MDT and Linden OutlawAlert. If you are using another MDT and dispatch, you will have to alter the code.
1. Open `linden_outlawalert/server.lua` and view the variable labeled `dispatchCodes`.
2. Add the following: `officerAssistance = { displayCode = 'REQ', description = 'Officer Assistance', isImportant = 0, recipientList = {'police'}, blipSprite = 58, blipColour = 2, blipScale = 1.5, infoM = 'fa-hands-helping', infoM2 = 'fa-info' },`
3. Open `td-policedesk/Shared/Config.lua` and ensure line 67 is as follows: `TDPD.Config.UsingMDT = true`

### Adding More Locations; Non-ThirdEye
1. Find `TDPD.Config.Locations` in `td-policedesk/Shared/Config.lua`.
2. Add more locations while following the format for MRPD.

### Adding More Locations; ThirdEye
1. Find `setupTargetExport()` in `td-policedesk/Client/CL_Main.lua`.
2. You may add additional target locations while following the format for MRPD.

--------

## Common Errors
### `attempt to call a nil value (field 'GetQBPlayers')`
In this case, you are missing a function in qb-core (also meaning that your core is outdated).

Add the code to `qb-core/server/functions.lua`:
```
function QBCore.Functions.GetQBPlayers()
    return QBCore.Players
end
```
If you review https://github.com/qbcore-framework/qb-core/blob/main/server/functions.lua, the function starts on line 76.

--------

## Dependencies
Overall
- qb-core
- qb-target (if using thirdeye)

--------

## Localization
Default: English; configurable.

--------

## Questions, Concerns, and Support
[Feel free to join our Discord server!](https://discord.com/invite/Sft3RpBz2w)
