#!/bin/bash
set -exu
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
    com.google.android.webview
    com.google.android.youtube
    com.google.android.apps.maps # NEW
    com.samsung.android.email.provider

    com.samsung.android.app.galaxyfinder
    com.sec.android.app.sbrowser
    com.google.android.gm
    # com.google.android.gms # FAILED, google play (?)
    # com.sec.android.gallery3d # NOT galaxy store, just image gallery
    com.google.android.videos
    com.sec.spp.push           # Samsung Push Service
    com.policydm               # Samsung Security Policy Update
    com.osp.app.signin         # Samsung Account
    com.samsung.android.scloud # Samsung Cloud


    com.android.bluetoothmidiservice
    com.google.android.googlequicksearchbox # widgets, background
    com.sec.phone                     # test phonecalls
    com.samsung.aasaservice
    com.google.android.onetimeinitializer
    com.android.providers.partnerbookmars # bookmarks in chrome
    com.wsomacp # weird protocol omacp=OMA Client Provisioning
    com.android.dreams.phototable  # screensaver of photos
    com.sec.android.app.samsungapps # samsung stores
    com.wssnps # samsung backup
    com.android.calllogbackup
)
for package in "${packages[@]}"; do
    adb shell pm uninstall --user 0 "${package}"
    #adb shell "am force-stop ${package} && pm disable-user ${package} && pm clear ${package}"
done
