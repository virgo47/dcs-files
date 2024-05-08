URL: TODO
=================== copy from here ============================
DCS-COINS: UH-1H Huey Dashboard

Note, that there is also UH-1H Dashboard by Munt.G: https://www.digitalcombatsimulator.com/en/files/3320621/

This dashboard is more cramped, containing also various sliders for knobs like light intensity, volumes, etc.

License/conditions:
- Dashboard itself and original icons are distributed under Unlicense: https://en.wikipedia.org/wiki/Unlicense
- Many buttons use Flight Simulation Pack iconpack: https://www.touch-portal.com/assetsdb/assets-details.php?id=19&name=Flight%20Simulation%20Pack&type=iconpack

Requirements:
- DCS-COINS 3 (version from 2023-09-09 was used): https://www.digitalcombatsimulator.com/en/files/3319022/
- Touch Portal 3: https://www.touch-portal.com/
- Touch Portal on Android requires paid Pro Upgrade (~14 USD)

Installation:
- DCS-COINS and Touch Portal must be already installed and working.
- Download and extract the TPZ file.
- In Touch Portal click the cog next to the page selector.
- Click "Import Page".
- Select the extracted TPZ file and click "Open".
- Navigate the following dialogs (mostly "OK" or "Yes").

Description:
- TODO

Known issues:
- TODO

================== copy to here ===============================
Technical notes:
- Actions Door Left/Right control the copilot/pilot door, not the gunners door.
In DCS there seems to be no shortcuts for this, only Ctrl+C to control both doors.
On the other hand, DCS-BIOS/COINS don't offer Open/Close Left/Right Gunner Door shortcuts.
-- not sure what DOOR_L-PTR|door_l-ptr|Door Left|4|0|OpenClose|OPEN this does - it indicates Open whatever the door does
-- DOOR_POS_L|door_pos_l|Door Position Left|0|0|=pct(65535)|0 - this one indicates position (probably angle) of the front door
- Dome Light switch actions are described as 2=GREEN and 0=WHITE, but in fact, value 2 is WHITE and 0 is GREEN (DCS-BIOS bug probably)
- Many actions are VERY POORLY named - the names are non-specific and often duplicate.
One can only hope the order of the actions from PP file is respected - e.g. for various volumes:
----
BEACON_VOL|beacon_vol|Marker Beacon Volume|6|3200|=ctr(65535)|0
INT_VOL|int_vol|Intercom Volume|6|3200|=ctr(65535)|0
UHF_VOL|uhf_vol|Volume Control|6|3200|=ctr(65535)|0
VHFCOMM_VOL|vhfcomm_vol|Volume Control (step size less than 8192 may not work)|6|8192|=ctr(65535)|0
VHFFM_VOL|vhffm_vol|Volume Control|6|3200|=ctr(65535)|0
VHFNAV_VOL|vhfnav_vol|Volume Control (step size less than 8192 may not work)|6|8192|=ctr(65535)|0
----
Another example is VHFCOMM_PWR which is simply labeled "Power" - ridiculous (and confusing).
- Also, radio volumes are generally inverted (max is 0), so I inverted colors for container and value.
The sliders go from top to bottom with labels on top, so it's still annoying.
It is still nice that we can map those "step volumes" (e.g. VHF COMM) to sliders.
