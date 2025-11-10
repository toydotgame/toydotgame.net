---
title: Digital Metric Unit Nomenclature for Dummies
mathjax: true
updated: 2025-11-09
---

This is a rewrite of a Google Doc I made in December, I decided to publish it
because some people (Windows users) need to know…

## Prefixes
### Metric
<small markdown="1">Or "decimal" prefixes.[^1] Nano- to Yotta- scale, excluding
middle values where $|\mathrm{magnitude}| < 10^{-3}$.</small><br>
These are increments of 1,000. _Kilo-_ means 1,000 (thousand), _Giga-_ means
1,000,000,000 (billion), _Peta-_ means 1,000,000,000,000,000 (quadrillion), etc.

<table>
	<tr><th>Prefix</th><th><small>Nano</small></th><th><small>Micro</small></th><th><small>Milli</small></th><th><small>Kilo</small></th><th><small>Mega</small></th><th><small>Giga</small></th><th><small>Tera</small></th><th><small>Peta</small></th><th><small>Exa</small></th><th><small>Zetta</small></th><th><small>Yotta</small></th></tr>
	<tr><th>Symbol</th><td>n</td><td>µ</td><td>m</td><td>k</td><td>M</td><td>G</td><td>T</td><td>P</td><td>E</td><td>Z</td><td>Y</td></tr>
	<tr markdown="1"><th>Quantity</th><td>$\frac{1}{10^9}$</td><td>$\frac{1}{10^6}$</td><td>$\frac{1}{10^3}$</td><td>$10^3$</td><td>$10^6$</td><td>$10^9$</td><td>$10^{12}$</td><td>$10^{15}$</td><td>$10^{18}$</td><td>$10^{21}$</td><td>$10^{24}$</td></tr>
</table>

### Binary
<small>Same scale, same exclusions.</small><br>
These are increments of 1,024 ($2^{10}$).[^2] _Kibi-_ means 1,024 ($2^{10}$),
_Gibi-_ means 1,073,741,824 ($2^{30}$), _Pebi-_ means 1,125,899,906,842,624
($2^{50}$), etc.

<table>
	<tr><th>Prefix</th><th><small>Nanobi</small></th><th><small>Microbi</small></th><th><small>Millibi</small></th><th><small>Kibi</small></th><th><small>Mebi</small></th><th><small>Gibi</small></th><th><small>Tebi</small></th><th><small>Pebi</small></th><th><small>Exbi</small></th><th><small>Zebi</small></th><th><small>Yobi</small></th></tr>
	<tr><th>Symbol</th><td>ni</td><td>µi</td><td>mi</td><td>Ki</td><td>Mi</td><td>Gi</td><td>Ti</td><td>Pi</td><td>Ei</td><td>Zi</td><td>Yi</td></tr>
	<tr><th>Quantity</th><td>$\frac{1}{2^{10 \cdot 3}}$</td><td>$\frac{1}{2^{10 \cdot 2}}$</td><td>$\frac{1}{2^{10}}$</td><td>$2^{10}$</td><td>$2^{10 \cdot 2}$</td><td>$2^{10 \cdot 3}$</td><td>$2^{10 \cdot 4}$</td><td>$2^{10 \cdot 5}$</td><td>$2^{10 \cdot 6}$</td><td>$2^{10 \cdot 7}$</td><td>$2^{10 \cdot 8}$</td></tr>
</table>

> Note how that in the metric scale, _kilo-_ is denoted by a **lowercase** `k`,
> whereas the binary scale _kibi-_ uses an **uppercase** `Ki`!
{:.callout-info}

## Units
Bit ($\mathrm{b}$)
: A singular `1` or `0`

Byte ($\mathrm{B}$)
: A group of 8 bits. Regardless of if something's called "16-bit" or "64-bit,"
  it's going to be working in chunks of 8 1s and 0s at a time

## Suffixes
The most common suffixes used are for rates of data being transferred in the
period of 1 second.

Bits per second ($\mathrm{bps}$)
: The number of individual bits throughput in a second

Bytes per second ($\mathrm{B/s}$)
: The number of bytes (the number of *entire* 8-bit groups) throughput in a
  second

<br>

> ## This is where ISPs scam you
> It's basically common knowledge at this point that ISPs and related
> organisations utilise the hard-to-distinguish "bps" and "B/s" terminologies
> and how they're used.
>
> They *know* that your computer will say you're downloading a song at 4.8 MiB/s
> <small>($4.8 \cdot 2^{20}$ is ~5.033 million bytes a second, therefore ~5.033
> MB/s)</small>. You know what sounds like an awesome upgrade‽ **THIRTY MEGABIT
> INTERNET!!!**
>
> But wait a second…30 mega<u>bits</u> is $\frac{30}{8} = 3.75$
> mega<u>byte</u>s…and bazinga there you have it, clear as day: 3.75 MB/s is
> literally a *downgrade* from the ~5.033 MB/s you already have.<br>
> Gigabit to the premises sounds ***awesome*** until you do all of 5 seconds of
> smartphone calculator-ing and see it's ~122 MiB/s tops—not even accounting for
> real-world losses.
{:.callout-success}

## Notes
* Service providers will basically *always* use the smallest possible units
  (*something metric* (not binary!) <u>bits</u> per second)
* Operating systems, namely Windows[^4] will show filesystem information using
  what looks like metric byte units (e.g. MB, kB), whereas it actually means the
  binary prefixes (e.g. MiB, KiB). On Unix-likes, this is usually less of a
  pedant's issue as the software developers know what they're doing over
  here.[^3]
	* :3
	* A good rule of thumb is that any byte-based (B) unit is *probably* a power
	  of 1,024, and any bit-based (b) unit is *probably* a power of 1,000[^5]
* Do you know what's *worse* than ISPs and the like using bit-based units to
  cheap out on you? Hard drive manufacturers. They will use a **binary base
  kibibyte** (i.e. 1 KiB = 1,024 bytes) as their base unit of measuring a disks
  capacity, but ***switch*** the measuring system to use a **decimal base** for
  multiples therein (e.g. 1 "GB" is 1,000,000 actual kibibytes, so 1,024,000,000
  exactly; 1 "MB" is 1,000 kibibytes = 1,024,000 exactly).[^5]<br>
  Like look:

  | Magnitude | Metric            | Hard drive        | Binary            |
  | :-------: | ----------------: | ----------------: | ----------------: |
  | k         | 1,000             | 1,024             | 1,024             |
  | M         | 1,000,000         | 1,024,000         | 1,048,576         |
  | G         | 1,000,000,000     | 1,024,000,000     | 1,073,741,824     |
  | T         | 1,000,000,000,000 | 1,024,000,000,000 | 1,099,511,627,776 |

  What the hell!

[^1]: ["Metric prefix"](https://en.wikipedia.org/wiki/Metric_prefix). Wikipedia.

[^2]: ["Binary prefix"](https://en.wikipedia.org/wiki/Binary_prefix). Wikipedia.

[^3]: Ext4 filesystem on my computer.

[^4]:
	A YouTube video I saw once confirming that Windows labels things “KB,” “MB,”
	and “GB” despite 1. “KB” not being a valid unit (should be “kB”), and 2.
	displaying values for the kilo-, mega-, and giga- (etc) values using
	multiples of 1,024 and not 1,000 (_**suggesting that the correct labels
	should be KiB, MiB, GiB, etc**_).

[^5]:
	[Comment by \[deleted\] on
	Reddit](https://www.reddit.com/r/computers/comments/1ckmfzf/comment/l2nve4t/),
	2024-05-05.
