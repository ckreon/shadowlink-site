---
layout: post
title:  "Cryptography Basics"
date:   2016-05-13 09:00:00 -0700
categories: OpenSourceSec
author: c1ph0r
---
#####Symmetric key encryption

Contrary to popular belief, even now there are communication methods we can be reasonably assured are safe and private. To understand what we’re up against and how to understand cryptography in general, it helps to look back at Julius Caesar.

The ‘Caesar’ cipher, or ‘Caesar’ shift, is a way to encipher text to make it difficult for eavesdroppers to read. If you’ve ever been a fan of the ‘crypto-quote’ puzzle in most newspapers, then you probably already understand the mechanics of this method of cryptography.

Let’s say we want to encrypt the word: HIDE. The image below shows how the Caesar cipher works. We take each letter in the message and apply a ‘shift’ to the letters, which gives us the cypher text. This shift can also be thought of as the ‘encryption algorithm’. In the example below we can think of the algorithm as X-3=Y:

![caesar](https://upload.wikimedia.org/wikipedia/commons/thumb/4/4a/Caesar_cipher_left_shift_of_3.svg/800px-Caesar_cipher_left_shift_of_3.svg.png)

In this over simplified example ‘X’ is the plain text, ‘-3’ is the encryption algorithm and ‘Y’ is the cipher text. If we apply this algorithm to our example message we get:

X-3=Y, or to see it in an easier way:

(plain text) -3 = (cipher text)

(H) -3 = (E)
(I)   -3 = (F)
(D) -3 = (A)
(E) -3 = (B)

HIDE becomes EFAB

All the recipient needs to know is the ‘key’, or the shift, used to encrypt the message. Being a very primitive form of cryptography, you can probably see some of the issues with it. One of the biggest issues with this type of encryption is that being a mono alphabetic substitution cipher makes it susceptible to frequency analysis.

Imagine taking every book in your local library and going through them one by one. As you read each word you note how many times each letter is used. Keep doing this for every single book and you’ll start to notice something interesting. There are some letters that come up more often than others. In fact, this frequency of letters is consistent from book to book. This is the “Relative frequencies of letters in the English language” graph from the [Letter frequency article on Wikipedia](https://en.wikipedia.org/wiki/Letter_frequency) which I highly recommend checking out:

![frequency](https://upload.wikimedia.org/wikipedia/commons/thumb/d/d5/English_letter_frequency_%28alphabetic%29.svg/600px-English_letter_frequency_%28alphabetic%29.svg.png)

So as you can see this isn’t a very secure way to communicate. If we know the language we can be generally certain which characters represent what based on how often they show up in the cipher text.

The next logical step was the polyalphabetic cipher. This method address the frequency analysis problem by shifting each letter in the plain text by a different number. In the monoalphabetic cipher like we looked at before, whatever the shift was for the first character that same shift is applied to all characters. Now we instead shift each character in the plain text by a different amount. Both sender and receiver still need to know the key, now it’s just a little more complicated.

For this example let’s assume the ‘key’ is: **123**

X+Y=Z, or:

(plain text) + (key) = (cipher text)

(H)  +1 =   (I)
(I)    +2 =  (K)
(D)  +3 =  (G)
(E)  +1 =   (F)

As you go from letter to letter, the ‘algorithm’ changes for each character, and then starts over again. Instead of using numbers you can also use words for keys. If you use the word “secret” as the key, the letters would be shifted: 

19, 5, 3, 18, 5, 20, …(repeat)

With polyalphabetic ciphers and complex enough keys, this used to be a pretty secure way to communicate. You can also come up with mathematical equations to make the encryption algorithm mind-bogglingly complex. Even the Enigma Machine of World War 2, was just a highly complicated and mechanically assisted way of substituting one letter for another. Without the keys, in the form of a [one-time pad](https://en.wikipedia.org/wiki/One-time_pad), breaking this method of encryption basically necessitated the creation of technologies that directly contributed to the development of computers.

Modern technology however makes easy work of cracking even the most advanced of WWII encryption standards. Modern mathematicians have created encryption algorithms so complex that cracking them is practically impossible. Just consider that RSA keys may be between 1,024 and 32,768 bits long. It might take you an entire day to generate the keys so imagine the effort needed to crack information protected by it.

These modern encryption algorithms are applied to your data on a bit by bit basis. This is actually happening a lot on things we do everyday with our computers. From the SSL/TLS protocol that gives us HTTPS (the little lock in your web browser address bar and guarantees that the communication between your host and the remote server is protected against sniffing or MITM attacks), to the PGP/GPG standards used to send secure communications that we’re working towards in this post.

In the previous examples, both parties had to meet previously, decide on the preferred encryption algorithm and exchange the keys. So the big question at this point is, in the modern internet connected world:

*How does Person A and Person B exchange keys if they will never physically meet and can’t be sure there isn’t someone listening in to their communications?*

#####Public key encryption

Also called Diffie-Hellman encryption, asymmetric public key cryptography was invented by Whitfield Diffie and Martin Hellman in 1976 and solves our problem quite nicely. This technology is how PGP/GPG encryption works. The way I understand what’s going on here is this:

    
1. Person A uses a special computer application which utilizes a complex mathematical operation to generate a public key and a private key. The public key can be shared, posted online, and hosted on key servers. The private key is kept secret and only able to be accessed with a strong passphrase.
2. Person B does the same thing.
3. Person A & Person B exchange public keys and store them in their special application.
4. Person A uses their secret private key and Person B’s public key together to encrypt a message.
5. Only Person B can decrypt the message with their private key and Person A’s public key. They can also verify with Person A’s public key that the message definitely came from them.

My favorite way to understand this is using paint:

<iframe width="630" height="385" src="https://www.youtube.com/embed/3QnD2c4Xovk" frameborder="0" allowfullscreen></iframe>


#####Digital Certificates

These principles also make up how digital certificates work. Like I mentioned before, websites that want to provide secure and safe communication for their users will use a signed digital certificate. When you browse to a site, a variation of the following happens:

1. User browses to site that offers SSL/TLS.
2. The host browser negotiates with the server on what encryption algorithm they both can support and will use.
3. The server sends the host the digital certificate that is signed and hosted by a trusted certificate authority. From this vetted certificate, the browser can extract the server’s public key.
4. The host browser then generates a random secret key, uses the server’s public key to encrypt it, then sends it to the server.
5. The server then can decrypt the secret key and can use it to establish symmetric key encryption protocols which are much easier on the host and the server’s computational resources.
6. The rest of the connection is encrypted symmetrically with the secret key.

This is of course just the basic level of understanding for these concepts. If you want to learn more about digital certificates and public key encryption, I recommend reading: [‘The First Few Milliseconds of an HTTPS Connection’ by Jeff Moser.](http://www.moserware.com/2009/06/first-few-milliseconds-of-https.html)

 
*If you have any specific questions or ideas for future posts, please send your ideas to opensourcesec@protonmail.com*
*Thanks for reading. Stay safe.*
