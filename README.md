Beta
====

**Beta** is a program used in the live coding session at Channel 16, which was
held at Roppongi SuperDeluxe on 28th April 2017.

In this session, I used [KodeLife] for generating abstract audio-reacting
visuals in a live coding fashion. These visuals are send to Unity with using
the [Spout] protocol and projected into the Unity scene.

In this way, I tried to harmonize the unpredictable outputs of live coding and
the pre-composed high quality visuals.

[KodeLife]: https://hexler.net/software/kodelife
[Spout]: http://spout.zeal.co/

System Requirement
------------------

- Unity 5.6 or later.
- KodeLife (I used version 0.4.2).
- Windows system that is compatible with Direct3D 11.

MIDI Controller Mapping
-----------------------

I used a KORG nanoKONTROL2 controller to control the effects.

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
