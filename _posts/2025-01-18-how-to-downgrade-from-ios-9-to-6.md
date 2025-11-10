---
title: How to Downgrade from iOS 9 to iOS 6
---

<small>Or technically from iOS 9.3.5/9.3.6 to iOS 6.0–9.3.5.</small>

It's completely possible to effectively downgrade any 32-bit iDevice from iOS 9
to iOS 6, provided you've got some technical confidence.

This all started because I had this _horrid_ 5th generation iPod touch
(incidentally my first iDevice) that ran its latest release, iOS 9.3.5. It ran
_so horribly_ that it would last a solid **20 seconds** (I'm not kidding) from
charger unplug to completely dead flat just sitting on the iOS 9 homescreen. Not
only that, but as is the case with basically every Apple product ever, our good
friend Planned Obsolescence meant that this thing running it's ultimate release
OS was _slow as **hell**_.

And so I got the idea that, _Hey, iPhone 4 was good on iOS 6 but terrible on
7—why don't I try a little bit of Golden Age iOS to try and bring a little life
back into this thing?_ And so it began.

> ## THIS PROCEDURE INVOLVES JAILBREAKING AND FLASHING YOUR DEVICE
> This process will wipe your device for certain. Don't do this on a device with
> important data or on a device that you depend on for **anything**. <u>You
> <b>will</b> lose everything</u>.
> 
> Additionally, improper following of instructions may soft-brick and boot-loop
> your device. However, you can always remedy this by [rebooting the device into
> Recovery Mode](https://support.apple.com/en-au/118106) and re-flashing iOS
> 9.3.5 in iTunes.
{:.callout-error}

## Procedure
### You will need:
* **Both a Windows and Linux install, or just a macOS install.** If you're
  not on macOS, you'll need Windows for sideloading, and Linux for OTA
  downgrading. If you're a Windows user only, you'll need to figure out how to
  get a Live USB [(tutorial
  here)](https://ubuntu.com/tutorials/create-a-usb-stick-on-windows); I
  recommend doing this on a minimum of a 16 GiB USB, because you'll be
  downloading multiple IPSWs and you'll need the space—any less and it's
  you'll get corrupted files and stuff won't work. I recommend setting the
  biggest persistent partition size you can in Rufus when flashing the USB so
  that you have the safety net of being able to restart Linux without losing
  your progress
* A USB-A or -C to Lightning cable to connect the iDevice to your computer
* **Git, SSH, and cURL.** On Ubuntu, they can all be installed through the
  terminal with:
  ```sh
  sudo apt update && sudo apt install git ssh curl
  ```
* A 32-bit iDevice, specifically one with an A5 SoC, **<u>running iOS 8.4.1,
  9.3.5, or 9.3.5</u>**. (If you're running iOS 9.0–9.3.4, you'll need to update
  iOS through Settings or using Legacy-iOS-Kit similarly to how it's used in
  [Stage 1](#stage1)) If you're not sure what devices that is, it's one of
  these:
	* iPhone 4S (`iPhone4,1`)
	* iPhone 5 (`iPhone5,1–2`)
	* iPad 2 (`iPad2,1–4`)
	* iPad 3 (`iPad3,1–3`)
	* iPad 4 (`iPad3,4–6`)
	* iPad mini, 1st Generation (`iPad2,5–7`)
	* iPod touch, 5th Generation (`iPod5,1`)
* [Legacy-iOS-Kit.](https://github.com/LukeZGD/Legacy-iOS-Kit) This is what
  we'll use to send OTA (**o**ver **t**he **a**ir) updates. You need this
  installed on macOS/Linux, open your terminal and run the following:
  ```sh
  git clone https://github.com/LukeZGD/Legacy-iOS-Kit.git
  cd Legacy-iOS-Kit/
  ```
* [Sideloadly.](https://sideloadly.io/) Install this on Windows or macOS
* An Apple ID. You'll need this to temporarily sign IPAs when sideloading, you
  _do not_ need an Apple Developer account or subscription
* [Phœnix jailbreak IPA.](https://phoenixpwn.com/download.php) This is only for
  iOS 9.3.5/9.3.6. If your device is already on iOS 8.4.1, you can [skip
  straight to the iOS 8 stage](#stage2)
* [EtasonJB IPA.](https://etasonjb.tihmstar.net/) This is for iOS 8.4.1

<h4>Optionally, if the internet on your iDevice is notably worse than on your
computer:</h4>
* [3uTools.](https://www.3u.com/) Install this on Windows or macOS. You'll need
  this for transferring the pre-downloaded iOS 6 IPSW to your iDevice
* An iOS 6.1.3 IPSW. [You can download one for your model
  here.](https://ipsw.me/) It doesn't actually have to be 6.1.3, it can be any
  iOS from 6.0–9.3.5.

### Stage 1: The iOS 9 Stuff {#stage1}
First, we'll need to jailbreak iOS 9 then downgrade it to the last release of
iOS 8.4.1. We will jailbreak iOS 9.3.5/9.3.6 with Phoenixpwn, a
**semi-untethered** jailbreak, meaning you _don't_ need to have a computer
connected for it to stay jailbroken on reboot, but you _do_ need to manually
re-"kickstart" the jailbreak every time you reboot the device. For this
tutorial, we only really need to be in iOS 9 for one power cycle, so
re-kickstarting isn't needed.

1. <small>Start booted into Windows or macOS first.</small>
	1. Connect the iDevice to your computer and make sure to hit _Trust_ in iOS.
	2. Open Sideloadly and click the big "IPA" button to select the Phoenixpwn
	   IPA file. Enter in your Apple ID e-mail address you wish to use. You are
	   allowed 11 unique app IDs to sign a week; we'll only use two for the two
	   jailbreak apps in this tutorial.
	3. Hit _Start_, it'll ask for the password and begin the process of signing
	   and sideloading the app. A sideloaded app will remain valid for 7 days.
   <img class="fcenter" width="50%" src="/media/blog/2025/01-18_how-to-downgrade-from-ios-9-to-6/sideloadly.png" />
   Once sideloaded, the app will be available on your home screen immediately,
   but don't launch it yet!
2. First, on your iDevice, open Settings. Go to _General_ → scroll down to
   _Device Management_ → there'll be a certificate just named with your Apple ID
   e-mail address, tap it → hit _Trust_.
	1. Now that sideloaded apps are trusted, head back to your home screen and
	   open the Phœnix app. Tap on _Prepare For Jailbreak_, then skip the
	   ancient mixtape ad (lol). Your iDevice will reboot.
	2. Once it has rebooted, re-open the Phœnix app and hit _Kickstart
	   Jailbreak_, your device will respring; if there's no such button, head
	   straight to the next step.
3. Open Cydia. Wait for your sources to refresh and hit _Return to Cydia_.<br>
   Head to the _Search_ tab and search for "OpenSSH", select it, and hit
   _Install_. Cydia will probably give you a popup saying essential packages
   need upgrading (this will be the case as most jailbreaks for these old OSes
   need patches for a lot of core components). However, we don't need to update
   these packages as we're installing iOS 8 in a second anyway. Hit _Ignore
   (Temporary)_. Continue on with installing OpenSSH.
4. <small>If you're on Windows, reboot into your Linux Live USB. If you're on
   macOS, ignore this.<br>						
   Occasionally, booting into Ubuntu will make your iDevice forget it has
   trusted your computer; in which case, make sure to hit _Trust_ again if
   asked.</small>
	1. Once OpenSSH is installed, lock your device.
	2. Have a terminal open in the `Legacy-iOS-Kit/` folder. Run:
	   ```sh
	   ./restore.sh
	   ```
	   On your first run, Legacy-iOS-Kit may install additional dependencies and
	   exit, in which case you just run `restore.sh` again. Legacy-iOS-Kit will
	   provide you with a user interface you can navigate with the arrow keys
	   and use Enter to select.
	3. <h4>If you have one of the following devices, you're in huge luck!:</h4>
	   <ul style="color:var(--secondary); font-size:small">
	   	<li>iPhone 4S (<code>iPhone4,1</code>)</li>
	   	<li>iPad 2 (WiFi) (<code>iPad2,1</code>)</li>
	   	<li>iPad 2 (GSM) (<code>iPad2,2</code>)</li>
	   	<li>iPad 2 (CDMA) (<code>iPad2,3</code>)</li>
	   </ul>
	   <small>The following devices support being downgraded to iOS 6.1.3 directly,
	   without needing the 8.4.1 intermediary. If one of these devices is yours,
	   then complete the rest of this stage using iOS 6.1.3 instead of 8.4.1 and
	   the tutorial ends there!</small>	
	4. Once your device is detected, select _Downgrade/Restore_, then _iOS
	   8.4.1_. Let it guide you through the process of downloading the IPSW and
	   then restoring your device to it. It'll ask you if you'd like to
	   jailbreak the IPSW, select _No_—because we'll be doing this manually
	   later.
	5. Finally, it'll ask you for the SSH password into your device, which by
	   default is `alpine`. Type exactly that and hit Enter.
   Your device will restart a couple times it'll proclaim that your device has
   successfully been downgraded. You can close out of the Legacy-iOS-Kit window
   now. You'll notice your iDevice will still be on the update screen but it's
   safe to turn off the program now.<br>
   <small>If you're on Linux, you can reboot into Windows now.</small>
	
### Stage 2: iOS 8 {#stage2}
In practice, your device will now run 8.4.1 as its primary OS, but we'll set it
up so that most of its space is dedicated to iOS 6, and that it boots into iOS 6
by default—so effectively you won't really know that it's an iOS 8 device except
for the pre-SpringBoard boot screen having the iOS 7+ Apple logo.

We will use [CoolBooter](https://coolbooter.com/) to create an iOS 6 bootable
partition on your iDevice, allowing us to run iOS 6 on the bare metal of the
device at full speed with no compatibility compromises. Once that's working, we
will use CoolBooter Untetherer, which will automatically take us to iOS 6 when
the device boots up, without user input.

The reason we are installing CoolBooter on iOS 8 rather than 9 is because iOS 8
has an **untethered** jailbreak, which means—once you've done the first-time
jailbreaking/setup—the device will _never_ require any more action to stay
jailbroken, even after rebooting. This is useful to keep it jailbroken early in
the boot process so that CoolBooter Untetherer can run completely automatically.

1. We start by jailbreaking iOS 8. You've done this before so I'll keep it short:
	1. Use Sideloadly to sideload the EtasonJB IPA.
	2. Go to Settings → _General_ → _Device Management_ → _\<Your Apple ID\>_ →
	   _Trust_.
	3. Launch the Etason JB app, hit _Etason JB!_. Your device will reboot.
2. Open Cydia, go to _Sources_ → _Edit_, and remove the following sources:
	* ModMyi (`http://apt.modmyi.com/` and `http://modmyi.saurik.com/`)
	* Ultrasn0w (`http://repo666.ultrasn0w.com/`)
   …and _add_ the following source:
	* `https://coolbooter.com/`
   Hit _Done_ to finish editing and _Refresh_ to sync new package lists. We
   removed the Ultrasn0w and ModMyi repos because they've been shut down for
   many, _many_ years at this point and aren't worth the time and storage space
   of keeping synced right now. This time, if Cydia says you need to update
   important packages, heed it and hit _Complete Upgrade_ to properly update
   your system. You may need to Respring.
3. In Cydia, go to _Sources_ → _CoolBooter_ → _All packages_ → _CoolBooter_ →
   _Modify_. The latest version of CoolBooter, 1.6, is very broken and will
   cause boot-loops in iOS 8. Select `1.4.1-release` as the version to
   "downgrade" to, and hit _Install_. IIRC this requires a Respring too.

<table>
	<tr><th width="50%">If you think your iDevice's internet is fine:</th>
	<th>If you think your iDevice's internet is noticeably worse than your
	computer's and you already gathered the optional prerequisites in the
	intro:</th></tr>
	<tr><td>
		<ol>
			<li>Open the CoolBooter app.
				<ol type="a">
					<li>Hit <i>Install</i>, and first select the partition size
					you want for iOS 6, I recommend maxing this out:
						<img src="/media/blog/2025/01-18_how-to-downgrade-from-ios-9-to-6/coolbooter-partition-size.png" /></li>
					<li>Then hit <i>Select</i>, and choose the iOS version you
					want to install.</li>
					<li>Once that's done, hit <i>I'm ready!</i> and follow it
					through the process of downloading.</li>
				</ol>
			</li>
		</ol>
	</td><td>
		<ol>
			<li>Open Cydia, head to <i>Search</i>, search for "afc2", click on
			<i>"Apple File Conduit" 2</i> from the <i>Cydia/Telesphoreo</i>
			repo, and hit <i>Install</i>. Reboot if needed.</li>
			<li>Open 3uTools on your computer.
				<ol type="a">
					<li>Head to <i>Files</i> (on the left) → <i>File System
					(Jailbroken)</i> → scroll down to <i><code>var/</code></i> →
					<i><code>cbooter/</code></i>
						<img src="/media/blog/2025/01-18_how-to-downgrade-from-ios-9-to-6/3u-fs.png" /></li>
					<li>Then <i>Import</i> → <i>From File</i> and select the iOS
					6 IPSW. Uploading the IPSW to the <code>/var/cbooter/</code>
					folder will mean CoolBooter will skip downloading the IPSW
					on-device, and will use this provided one for the
					install.</li>
				</ol>
			</li>
			<li>Open the CoolBooter app.
				<ol type="a">
					<li>Hit <i>Install</i>, and first select the partition size
					you want for iOS 6, I recommend maxing this out:
						<img src="/media/blog/2025/01-18_how-to-downgrade-from-ios-9-to-6/coolbooter-partition-size.png" /></li>
					<li>Then hit <i>Select</i>, and choose the iOS version you
					want to install.</li>
					<li>Once that's done, hit <i>I'm ready!</i>.</li>
				</ol>
			</li>
		</ol>
	</td></tr>
</table>

You can also pick to your liking a custom boot logo (or lack thereof), whether
to enable verbose boot, and whether to jailbreak the target OS. You can choose
what you want for these, it has no bearing on the success rate.
	
* CoolBooter will ask you to lock your device, and then it will reboot to finish
  installing and setting up.
* Once it's rebooted, open the CoolBooter app, and hit _Boot_. This will boot
  you into iOS 6 for the first time properly.

### Stage 3: Setting up iOS 6 & Untether CoolBooter
Now you're in iOS 6, but you need to manually boot into it each time. For this
stage we will set it so that booting into iOS 6 is automatic. We will also set
up new root certificates to fix HTTPS errors in Safari and Cydia. iOS 6 is
(obviously) very out of date, and thus its root certificates are long expired;
updating the root certificates on your iDevice will mean it recognises new CAs
(**c**ertificate **a**uthorities, who sign individual website certificates), and
therefore it will recognise new websites signed with modern day certificates.

Optionally, if you chose to jailbreak your iDevice, and you're on one that
doesn't include the battery percentage in the status bar—such as an iPod
touch—we can add that too.

1. &#x200B;
	1. To start, open Safari and head to:<br>
	   <a style="display:inline-block; text-indent:4ch" href="https://cydia.invoxiplaygames.uk/certificates/">https://cydia.invoxiplaygames.uk/certificates/</a><br>
	   You may get a warning that Safari can't verify the signature for this
	   website, hit _Continue_ anyway.
	2. Tap the _ISRG Root X1 CA (Let's Encrypt)_ menu, which will download the
	   new root certificate. When iOS prompts you, trust this certificate.
2. <h4>If you jailbroke your device and want a battery percentage: (Skip this
   step otherwise)</h4>
   First, check that you _don't_ already have this option in stock iOS.
   Sometimes it's not enabled by default.<br>
   Check Settings → _General_ → _Usage_ → scroll down to _Battery Usage_ →
   enable _Battery Percentage_. If this option is _not there_, then continue on
   with this step.<br>
	1. Open Cydia. Go to _Search_ and look up "SBSettings" and install it.
	   You'll need to Respring.
	2. Open the SBSettings app on your home screen. Scroll down to the _System
	   Options_ section → tap the _System Options_ menu → turn on _Enable
	   Numeric Battery_.
	3. Optionally, you can also go to _Hide Icons_ and turn off the SBSettings
	   and Activator app icons if you have no other need for those two apps and
	   you want to keep your home screen tidy. (This, too, requires a Respring)
3. CoolBooter will need you to boot into your target OS (iOS 6) at least once
   before installing CoolBooter Untetherer, which you've done now!
	1. Hold down the home and power buttons until you see the Apple logo, then
	   release. Wait for your device to reboot into iOS 8.
	2. Open Cydia → _Sources_ → _CoolBooter_ → _All packages_ → _CoolBooter
	   Untetherer_ → _Install_; Respring when it prompts you to.
	3. When the device reboots, open the CoolBooter app, hit _Boot_, and lock
	   your device when prompted. It'll reboot straight into iOS 6.
   You're done! Enjoy bare-metal iOS 6; go sync your iTunes library or sideload
   old apps! Have fun!

## Troubleshooting
### Issues refreshing repositories in Cydia or signing apps in Sideloadly
The most common cause for this is an incorrect system time. This can be caused
in Windows by the way Ubuntu works with the hardware clock in your computer,
meaning sometimes when you reboot into Windows the clock is set to the wrong
time. This breaks HTTPS/TLS stuff and means Apple's servers won't want to talk
to you for app signing.<br>
A similar issue arises in iOS after you flash an iOS update to it: usually the
system's timezone is reset and thus Cydia throws a bunch of SSL errors at you
when trying to refresh sources.

### I need to boot into iOS 8! 
If for whatever reason you need to access iOS 8 after untethering CoolBooter,
completely shut down your iDevice, then turn it on and once the Apple logo
shows, hold down the Volume Down button until you land at the iOS 8 lock screen.

## End Result
You now have a device that boots into iOS 6—and it's not an emulator! This means
that iTunes, 3uTools, or whatever will see your device as truly running iOS 6!
iOS 6 is running directly on your hardware, no emulation layers or containers or
weird incompatibilities about it! Technically yes, you are running an iOS 8
device on the small, default boot partition, but iOS 6 is on the bigger
partition and iOS 8's single purpose as soon as it's detected to be running is
to immediately reboot straight to iOS 6.

With this, you can probably also expect **far** better battery life. My
20-second-iPod I mentioned in the introduction was downgraded about two days ago
as of writing, and has been unplugged for about 50 hours, and is sitting at just
above 50%!!! That's right, my 12 year old _very well loved_ iPod touch is
outperforming my 2 year old iPhone 12 mini in standby times!
