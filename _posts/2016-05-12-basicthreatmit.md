---
layout: post
title: "Basic Threat Mitigation"
date: 2016-05-12 09:25:00 -0700
categories: OpenSourceSec
author: c1ph0r
---
This week I’d like to look at information security through the lens of a hypothetical situation: Let’s assume we are the unfortunate target of an attacker. If we’ve been following our best practices as defined thus far, we know our attack surface is becoming more specific and difficult for the bad guys. After all, with a good password protocol we didn’t want to make it that easy. We have also been vigilant about malware and social engineering. What then can we expect next in the attack cycle and what can we do to protect ourselves?

##### Exploits

Even though quantifying the amount of code that goes into an operating system is arbitrary, I still think it effectively illustrates the complexity and engineering genius behind it. If you’re using a modern version of Windows it’s 50,000,000 lines by the way. Software development teams can number the hundreds or thousands. That’s a lot of code, written by a lot of people. Often times there are “bugs” or other vulnerabilities that are found that allow highly skilled attackers to leverage how the data is broken to make the software respond in ways it was never intended. These exploits are stored in freely available databases online and integrated with popular tools used to gain access to systems or networks. Some of these exploits are kept secret, only known to a select few. These are known as “zero-day” exploits.

##### Updates and Patches

The exploits that are found by the developers or disclosed by researchers in the field are usually fixed in the form of updates and patches. I recommend keeping all your computers, operating systems, mobile devices, network appliances and applications always up to date. When an attacker is looking at a target, they look at all potential entry points and scan the system to check the versions and compare that information to known exploits. In the case of a business or enterprise environment, special care should be taken when updating servers or other mission critical services. The system administrator will be the one to handle this task, but you should still be aware of how important and sensitive this process is. If a server is exploited the attackers can leverage access to all other systems on the network.

##### Legacy Technology

Obviously as time goes on the technology we use becomes smaller, faster, more efficient and more reliable. Older systems may be able to be updated and continue to be useful, but some legacy systems should be retired for several reasons. Older operating systems such as Windows XP are no longer supported by the developers. That means as new exploits are found, no new patches are being written. If you use an operating system such as XP, you’re constantly vulnerable to attack. If you have a specific application that you use in an industrial or enterprise setting that only works on older systems, you might consider emulation. If you are using a legacy operating system you are also highly limited on what software, including internet applications, that you can use. Not all modern technology is backwards compatible with older software.

Another consideration that should be noted is using old network appliances such as routers, wireless access points and switches. Many of these devices can be updated and I recommend adding them to your normal maintenance schedule. It may or may not be time to upgrade your home wireless access point if it doesn’t support the current wireless standard 802.11, can’t be updated, or doesn’t support a custom OS like [DD-WRT](https://www.dd-wrt.com/).


*If you have any specific questions or ideas for future posts, please send your ideas to opensourcesec@protonmail.com*
*Thanks for reading. Stay safe.*
