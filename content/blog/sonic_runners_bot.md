---
title: "I made a farming bot for an 8-year old sonic game"
date: 2023-09-15T17:20:58+02:00
draft: true
read: 6
tags: ["python", "bot", "videogame"]
image: /img/runners/banner.jpg
imageAlt: "Promotional art of Sonic Runners"
imageCaption: "Promotional art of Sonic Runners"
---

Sonic Runners is a pretty good mobile game, unfortunately the game only lasted a single year online, due to awful monetization. Fear not, sonic fans keep the game alive, hosting their own servers and adding new content to this day.

Recently I played, noticed an exploit, and exploited it with python, a lot. like REALLY a lot. I made a bot that could get everything in the game within weeks. But let's get on the same page before I explain how.

## Understanding Sonic Runners

Sonic Runners is an endless 2D runner, think subway surfer or any other mobile game that involves mostly running really. We have elements that are standard to any mobile game too, like:

- **Rings**, the in-game currency
- **Red Star Rings (RSR):** The premium currency, like gems in most phone games.
- **Lives:** Needed to play a level, you get over time.
- **Items:** one-use tools to help you during gameplay
- **Characters:** The most valuable *things* in the game.
- **Buddies:** They help you with special abilities during gameplay.

When you play a level, you choose 2 characters, 2 buddies and items. and you hope to collect lots of Rings, and with luck, a single RSR. maybe two even if you are very lucky!

## The farming formula

I was not really trying to break the game, but I stumbled upon an interesting quirk of the new servers. Boss fights are harder. In the past if you damage the boss, the boss keeps the damage, forever, each run it will lose HP. But now, they always start at full.

A good change, but did I mention that bosses have increased odds of giving you RSR relative to their own health? Did I also mentioned that on a new account, you can fight bosses with very low HP, like 5HP? This makes very likely you'll get at last 1 RSR per boss fight, that's an entine RSR per minute! Very effective, you could buy some characters with just an hour of this.

## Coding a bot that fights the boss

We need to attack 4 times he boss, and then die

But, coding a bot to play an entire boss fight would mean a lot. Detecting the state of the game, not killing the boss, calculating the trajectory of the RSR's bounce when appearing, etc. Fortunately, we have two buddies to make our life easier, Caliburn and a Battle Cruiser

![Caliburn, a talking sword, a buddy from the game](/img/runners/caliburn.jpg)

Calirburn performs auto-attacks, a set amount depending on circumstances. I'm not getting into detail, but my Caliburn over here does 4 auto-attacks, always. I don't need to fight the boss now. And I can't kill the boss if I just, don't move.

![RC Battle Cruiser, a buddy from the game](/img/runners/battle-cruiser.jpg)

RC Battle Cruiser, doubles the amount to RSR that can spawn, at level 10, it increases it by up to 350%. Coupled with the high odds of a low-hp boss fight, we are getting RSR for almost 90% of hits.

Therefore, problem fixed!. Boss fight will play automatically, with no code or time investment from me. a simple solution.

## Coding a bot that will menu the game

And so, I opened an android emulator, and started coding. I decided to use python, since It's easy to prototype with it.

Initial plan, start a level, wait to die, go back to menu, start the level again. Sounds great. But we need to know the state of the game, how could the bot know if they finished the level? where are they?

Well, I found quite the solution, each menu is different, and therefore, they have different pixels, on different positions. So I found a list of specific pixels, that are only of a specific color when they are on specific menus.

- The death screen? has a super dark blue on a corner.
- The results screen? Pure black on another corner
- The items screen before starting the stage? A very bright magenta in one of the icons of the items.

The bot will screenshot the screen, think about it's previous state and, only checking less than 5 pixels of the image. Conclude if we are on a different screen or not.

The bot knows where it is, now, it's as simple as "When in results screen, click where 'continue' is"

As a side note, I also made some code to handle buying lives when needed

{{< video src="/vid/runners-in-action.mp4">}}

## The Item roulette

The Item roulette is not very special, when getting one RSR during a bossfight, you'll get one ticket for it. It yields Rings, Low-tier buddies, items, and, RSR.

Not many RSR mind you, a few tickets won't give you a single RSR probably. But what about spending _100's_ of tickets? Well, you'll get around 2.2 RSR for each ticket, So, for each RSR we get, add another 2.2.

This makes this farming method, incredibly effective. A single RSR is worth 3.2RSR, and we are making more than a hundred PER hour.

Coding the roulette was fairly easy, go to the roulette, and spin until you can't anymore.

Unfortunately, our regular pixel-detection system won't cut it for this job. There are special effects, transparencies animations, and I just could not get it to work.

### Finding a single-digit zero

We have already a more appropiate method for this job, comparing the image of a "0" with the current number

![A Zero in a green background](/img/runners/zero_tickets.png)

So, for finding the 0, we make a screenshot, crop it, and compare it to the image of having 0 tickets. With some threshold for similarity, It doesn't have to be exactly the same, it has to be 90% similar.

## Results

I've ran this bot for little less than a week, doing 2800 runs. Less than expected because the android emulator would crash. And I would manually reboot it after hours.

Anyway, here are the results: I made 230 RSR / hour, or 3.9 RSR/ min. My RSR counter reached more than 10.000.

This was enough to:

- Get every single character in the game (**31**)
- Getting a character I already had, **_97_** _times_. after getting the same the same character over 10 times, you can't get more bonuses for the character.
- Get over 60 buddies. 50 of them I got them way over 11 times, I cannot "level up/rank up" them more.
- Break the items screen, with each item counter showing 99, and I can't get it to lower after months. I'm pretty sure it's working, but still in the hundreds internally.
- Broke most of my user stats related to any roulette, any items, or any form of currency.

{{< video src="/vid/runners-showcase.mp4">}}

## Conclusion

Overall, this is a project I'm very proud of. The final code is only 331 lines of python. I've had to rewrite everything from the prototype, apply OOP, investigate image recognition, etc. I even had to make the tools to help me find the pixels I've talked about.

Unfortunately, I won't be releasing the source code, for obvious reason
