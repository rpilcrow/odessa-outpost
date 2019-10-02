/*

Dungeoneering - Magic
- STAT_MAG governs magical effectiveness
- Each character has a pool of magic points for casting magic.
- Magic is learnt through books? Used through orbs/wands/staves?
- Restoring magic points requires mana potions?

*/

#define STAT_MAG	"Magic"
//todo; add to ALL_STATS (mob_stats.dm)
#define MAX_MP_CALC(X)	(X*2)// NONE = 0, BASIX = 30, PROF = 120
//(X ? 20+X : 0) //NONE = 0, BASIC = 35, PROF = 80