---
layout: post
title: "Ransomware"
date: 2016-05-25 21:30:00 -0700
categories: OpenSourceSec
author: c1ph0r
---
In this week's OpenSourceSec blog, I wanted to introduce our readers to a deeper look at ransomware. With the emergence of “Ransomware As A Service” popping up on the Dark Web, it's a good idea to get an in-depth look at how ransomware works and what we can do in response.

##### Exposure

If you remember from back in our [post on malware](http://www.shadowlinkit.com/malware/), there are a wide variety of attack vectors malware can use to infect your system. Ransomware can use most of these methods but generally is found propagating through email attachments, P2P site downloads, malicious links and through malvertising:

* You get an email that could be from a spoofed address of a trusted sender or look like you sent yourself something. The attachment could be a Word document with a macro(small bits of code) that gets things going once you open the file. Or it could be a RAR(archive) with a CHM file(executable code) inside that you're instructed to open. 

* You are sent, or otherwise obtain, an infected MP3, JPG, video, or application from a P2P sharing resource.

* You are sent a link via email or redirected via a malvertising campaign that sends you to maliscious websites that use browser plugin exploits to download the payload and infect your system.

##### Real Or Fake?

Even though these days when we use a term like *ransomware* we are almost always referring to malware that results in file encryption and extortion, technically there are less serious variants that can be found in the field. 

Scareware can also be considered ransomware because it does attempt to block access to your system and data using pop-ups, it can also replace the Windows shell and seemingly lock you out. This less sophisticated form of ransonware usually follows one of the following themes:

* “Network Crime/PRISM” - your screen is replaced with an official warning page stating that you have been caught either looking at porn, downloading illegal music, are using an unliscensed install of Windows, etc. They can make it all go away if you click here to pay the fee.

* You keep getting the pop-up warning that your system is infected and if you click here they will remove the infection for a fee.

Fortunately, this level of ransomware is easily dealt with generally by rebooting the system into safe mode, deleting the maliscious files and any registry entries and running a good antimalware tool. 

The best place to look for removal guides and advice is at [Bleeping Computer's Virus, Spyware, & Malware Removal Guides](http://www.bleepingcomputer.com/virus-removal/)

*Update 05/28/2016* 
: There have also been reports of attackers merely threatening to DDoS a target network and demanding preemptive ransom to avoid being taken down. Check out this [CloudFlare Blog](https://blog.cloudflare.com/empty-ddos-threats-meet-the-armada-collective/) and don't be surprised if this type of scam doesn't utilize ransomware in the future. 

##### help_decrypt

If it turns out that you have been hit by something more sophisticated like a CryptoLocker, CryptoWall, or TeslaCrypt, a few very important differences occur compared to the scareware covered earlier:

* After execution the malware runs new instances of explorer.exe and svchost.exe to communicate with an [I2P](https://en.wikipedia.org/wiki/I2P) proxy which then establishes a connection with one of the command and control servers setup by the attackers.

* The ransomware then communicates with the server which uses specific information about your system to generate a public key that will be used on your system to encrypt personal files from it's whitelist of file types which include, but are not limited to: Office documents, PDF's, images, videos, and game files (WOW/Steam). The file names are also sometimes obscured with random text. The encryption used with some of these are, for example, RSA-2048. (AKA you can't decrypt these files.) 

* It then deletes volume shadow copies, system restore and the last 1000 restore points and installs spyware that steals passwords and Bitcoin wallets.

* It will also drop a copy of a text file, an image file and an html file named something similar to “help_decrypt.---” in each affected folder it encrypts. This file will explain what has happened and how you can contact the attackers for ransom. These instructions detail how to use TOR, obtain Bitcoins and presumably regain access to your data. 

* Lastly, the ransomware spreads to network shares, mapped drives, other systems on your network, pretty much anything it can access and repeats the above steps.

##### Prevention

The first and foremost defense against being the victim of ransomware is following proper operational security protocols such as:

* Don't open unsolicited email attachments
* Don't click dubious email links
* Use a decent antimalware software. There are some now that are designed to protect against ransomware.
* Keep your OS and software patched and up to date.
* Use a firewall and block traffic to TOR or I2P.

##### Backups

If there's one takeaway I would want people to have from this post it would be that it is ESSENTIAL that you have a good data backup protocol. If you primarily rely on a cloud based backup, be aware that some variants of ransomware can affect those files also if they are on a continuous backup schedule. And it's hard to imagine that future implementations of this type of malware won't target these types of services. 

In my opinion, the best strategy (even if using cloud based backup services) is to employ a local backup to external drive that can be physically removed from the system, and safely stored offline. Safely to me means in an anti-static bag, in a waterproof container, and in a safe. Remember if you use a NAS or mapped drive alone to backup data these types of malware will target them too. 

A really good description of what's going on during a ransomware infection can be found on [The Sophos Blog: The current state of ransomware: CryptoWall]( https://blogs.sophos.com/2015/12/17/the-current-state-of-ransomware-cryptowall/)


*If you have any specific questions or ideas for future posts, please send your ideas to opensourcesec@protonmail.com*
*Thanks for reading. Stay safe.* 
