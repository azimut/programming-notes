#!/bin/bash
set -eu
# TODO: https://blog.jaredsburrows.com/2014/03/what-android-apps-are-safe-to-remove.html
packages=(
    com.facebook.appmanager
    com.facebook.katana
    com.facebook.system
    ar.com.personal
    com.globant.clubpersonal
    com.personal.personalmovil
    com.sec.android.app.latin.launcher.personal.tienda

    com.enhance.gameservice
    com.gameloft.android.gdc

    com.samsung.knox.appsupdateagent
    com.samsung.knox.rcp.components
    com.sec.enterprise.knox.attestation
    com.sec.enterprise.knox.cloudmdm.smdms # FAILED
    com.sec.knox.foldercontainer
    com.sec.knox.knoxsetupwizardclient
    com.sec.knox.switcher

    com.google.android.apps.docs
    com.google.android.apps.photos
    com.google.android.backuptransport
    com.google.android.feedback
    com.google.android.marvin.talkback
    com.google.android.music
    com.google.android.partnersetup
    com.google.android.setupwizard
    com.google.android.syncadapters.calendar
    com.google.android.syncadapters.contacts
    com.google.android.talk
    # com.google.android.webview # NEEDED BY womic, opera mini, aurora, ...
    com.google.android.youtube
    com.google.android.apps.maps
    com.samsung.android.email.provider

    com.samsung.android.app.galaxyfinder
    com.sec.android.app.sbrowser
    com.google.android.gm
    # com.sec.android.gallery3d # NOT galaxy store, just image gallery
    com.google.android.videos
    com.sec.spp.push           # Samsung Push Service
    com.policydm               # Samsung Security Policy Update
    com.osp.app.signin         # Samsung Account
    com.samsung.android.scloud # Samsung Cloud

    com.android.bluetoothmidiservice
    com.android.calllogbackup
    com.android.dreams.phototable           # screensaver of photos
    com.google.android.googlequicksearchbox # widgets, background
    com.google.android.onetimeinitializer   #
    com.samsung.aasaservice                 #
    com.samsung.android.securitylogagent    # agent that monitors for changes on the disk (?)
    com.samsung.safetyinformation           # manual?
    com.sec.android.AutoPreconfig           # country SIM card soft-lock
    com.sec.android.app.ringtoneBR          # backup restore
    com.sec.android.app.samsungapps         # samsung stores
    com.sec.android.diagmonagent            # telemetry
    com.sec.android.preloadinstaller        # install apks .. https://x.com/fs0c131y/status/1046689524691218432
    com.sec.android.widgetapp.webmanual     # manual?
    com.sec.enterprise.mdm.vpn              # VPN enterprise ??
    com.sec.epdgtestap                      # 3G test app
    com.sec.factory                         # sometimes targeted by bugs
    com.sec.factory.camera                  #
    com.sec.imslogger                       # official backdoor https://x.com/fs0c131y/status/1115889065285562368
    com.sec.phone                           # test phonecalls
    com.wsomacp                             # weird protocol omacp=OMA Client Provisioning
    com.wssnps                              # samsung backup

    # Chrome
    com.android.providers.partnerbookmars # bookmarks in chrome
    com.android.chrome
    com.sec.android.app.chromecustomizations
)
i=1
for package in "${packages[@]}"; do
    printf "[%02d/%02d] %s\n" "$((i++))" "${#packages[@]}" "${package}"
    adb shell pm uninstall --user 0 "${package}"
    adb shell pm uninstall "${package}"
    #adb shell "am force-stop ${package} && pm disable-user ${package} && pm clear ${package}"
done

echo "--------------------"
echo "  Disabling Apps"
echo "--------------------"
disabled=(
    com.google.android.gms
    com.google.android.gsf
    com.google.vending
)
i=1
for package in "${disabled[@]}"; do
    printf "[%02d/%02d] %s\n" "$((i++))" "${#disabled[@]}" "${package}"
    adb shell "pm disable-user --user 0 ${package}"
done
