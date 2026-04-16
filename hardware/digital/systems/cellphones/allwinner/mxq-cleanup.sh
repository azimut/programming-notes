#!/bin/bash
set -x
uninstalled=(
    # Base
    com.android.bluetoothmidiservice
    com.android.bluetooth
    com.android.chrome
    # Common
    com.ftest
    com.adups.fota
    com.adups.fota.sysoper
    com.csz.universal.tvlauncher
    com.ksir.launchereng
    com.rockon999.android.leanbacklauncher
    com.uv.droid.uota
    com.uv.droid.uotaback
    com.example.android.usbbt
    com.example.android.autopair
    com.estrongs.android.pop
    com.rk_itvui.allapp           # launcher
    com.google.android.videos     # Google Play Movies
    com.teamsmart.videomanager.tv # SmartTube
    # Russia
    com.droidlogic.mboxlauncher # Launcher
    # Cleaup
    jp.co.omronsoft.openwnn                # jap keyboard
    com.google.android.partnersetup        # google integration
    com.google.android.onetimeinitializer  # first time setup
    com.google.android.googlequicksearcbox # shortcut/daemon
    com.google.android.feedback            # crash-report sender
    com.android.dreams.phototable          # screensavers
    com.android.smspush                    # SMS
    com.softwinner.miracastReceiver        # stream phone screen to tv
    com.google.android.youtube.tv
)
for package in "${uninstalled[@]}"; do
    adb uninstall --user 0 "${package}"
done

disabled=(
    org.xbmc.kodi
    com.netflix.mediaclient
    com.mm.droid.livetv.tve           # IPTV
    com.factorytools.factorystability # ????
    com.valor.mfc.droid.tvapp.generic # My Family Cinema
    # DEGOOGLE
    com.android.vending
    com.google.android.gms
    com.google.android.gsf
    com.android.providers.calendar
    # com.android.printspooler
)
for package in "${disabled[@]}"; do
    adb shell "pm disable-user --user 0 ${package}"
done
