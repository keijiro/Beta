Beta
====

**Beta** is a program used in a live coding session at *Channel 16*, which was
held at Roppongi *SuperDeluxe* on 28th April 2017.

![gif](http://i.imgur.com/NwETpDh.gif)
*Video posted by [@tokyomax].*

![gif](http://i.imgur.com/KpEIUPt.gif)
*Video posted by [@murakamikunkun].*

![gif](http://i.imgur.com/E6mq7MW.gif)
*Video posted by [@Ivneuron].*

In this session, I used [KodeLife] to generate abstract audio-reacting visuals
in a live coding fashion. These visuals are send to Unity via [Spout] and
projected into the Unity scene.

In this way, I tried to harmonize the unpredictable outputs of live coding and
the pre-composed scene.

[@tokyomax]: https://twitter.com/tokyomax/status/857957410631176193
[@murakamikunkun]: https://twitter.com/murakamikunkun/status/857999761923637248
[@Ivneuron]: https://twitter.com/Ivneuron/status/857959050499153922
[KodeLife]: https://hexler.net/software/kodelife
[Spout]: http://spout.zeal.co/

System Requirement
------------------

- Unity 5.6 or later.
- KodeLife (I used 0.4.2).
- Windows system compatible with Direct3D 11.

MIDI Controller Mapping
-----------------------

I used KORG nanoKONTROL2 to control the effects in the Unity side.

| CC# | Function            |
| --- | ------------------- |
| 0   | Camera FoV          |
| 1   | Camera motion       |
| 2   | Body emission       |
| 3   | Body cutout         |
| 4   | Wig length          |
| 5   | Shards              |
| 6   | Flares              |
| 7   | Ribbons             |
| 21  | Code color          |
| 22  | Code intensity      |
| 23  | Projector intensity |

License
-------

[MIT](License.md)
