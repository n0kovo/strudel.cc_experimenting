/*
@title day01
@by n0kovo <https://github.com/n0kovo>
@details I have no idea what I'm doing..
@genre electro
@license CC BY-NC-SA 4.0
*/

setcpm(68)

samples({
bassdrum: 'bd/BT0AADA.wav',
hihat: 'hh27/000_hh27closedhh.wav',
snaredrum: ['sd/rytm-01-classic.wav', 'sd/rytm-00-hard.wav'],
}, 'https://raw.githubusercontent.com/tidalcycles/Dirt-Samples/master/');

// DRUMS:
$: stack(

  // HATS:
  stack(
    // CLOSED HAT:
    s("hihat*4")
    .sometimes(x=>x.segment(8))
    .almostNever(x=>x.segment(16))
    .gain(0.75).clip(1).decay(.15),
    // OPEN HAT:
    s("<~ ~ ~ oh:1>")
    .bank('RolandTR606')
    .fast(rand.choose(8, 8, 4, 4, 4, 4, 2, 2))
    .clip(1)
    .gain(0)
    .release(.04)
    .sometimesBy(.45, x=>x.gain("0.16"))
  ),

  // KICK+SNARE:
  stack(
    // KICK:
    s("<sbd ~ ~ ~ ~ ~ ~ ~ ~ ~ sbd ~ ~ ~ ~ ~ sbd ~ ~ ~ ~ ~ ~ sbd ~ ~ sbd ~ ~ ~ ~ ~ >").fast(8)
        .lpf(750).distort(".7").decay(.3).gain(0.17).hpf(40)
        .duck(2).duckattack(.3).duckdepth(.45),
    // SNARE:
    s("<~ ~ ~ ~ sd:1 ~ ~ ~ ~ ~ ~ ~ sd:1 ~ ~ ~ >")
      .fast(8).gain(1.1).decay(.17)
      .distort(".1").decay(.35).gain(0.43).hpf(250)
  )
)
  .room(.2).rsize(.3)
  .compressor("-15:15:10:.003:.04").duck(2).duckattack(.21).duckdepth(0.2)
._punchcard()._scope()

// BASS:
$: stack(
	sine
	.range(14, 16)
	.segment(8)
	.superimpose(
		_x_ => _x_
		.add(rand.range(0.03, 0.15)).clip("1"))
	.scale('A0:minor').transpose("<0 <1 -1> 0 <-4 2>>/2")
	.note().clip("1")
    .rarely(x=>x.euclidLegato(3,8).transpose("-12"))
    .transpose("-24")
    .sometimes(x=>x.distort("1.3"))
	.s('square')
	.sustain(.01)
    .release(.05)
	//.gain(0.5)
    .decay(rand.range(.05, .1))
	.cutoff(
		rand
		.range(80, 2000)
		.slow(rand.range(1,8))
        .attack(rand.range(.01, .035))
        .rarely(x=>x.attack(1).decay(1).sustain(1).release(1).resonance(50).range(100, 5000))
        .decay(rand.range(.05, .125))
        .release(.1)
        .resonance(rand.range(0,10))
        )
    .room(rand.range(.05, .3))
      .rsize(
        rand.range(2, 30).slow(8)
      )
	.sometimes(
		add(vib("3:.5").decay(.2).gain(0.1).segment(1).clip(1)),
      x=>x.clip("1")
    )
    .sometimes(x=>x
      .clip(1)
      .slow(4)
      .rsize("20")
      .compress(.25,.75)
    )
    .often(x=>x.phaser(rand.range(1,6)).phd(rand.range(0.5,1.1)).phs("<100 800 3000>"))
  )
  .crush(rand.choose(8, 16, 7, 16, 16, 7))
  .compressor("-45:30:4:.05:.07")
  .often(x=>x.hpf(35).ftype('ladder').hpq(rand.range(35,75)))
.room(0.1).rsize(.4)
.reset(
	mini('<x@7 x(5,8,-1)>')
)
.orbit(2).postgain(1)//.lpf(9000)
.often(x=>x.coarse("<4 8 4 8>")).postgain(0.7)


// SHITTY KEYS:
$: cat(
   note("~ ~ b4 b ~ ~ ~ ~"),
   note("~ bb bb4 ~ ~ ~ ~ ~"),
   note("~ ~ ~ ~ e ~ ~ ~"),
   note("~ e4 ~ ~ g ~ ~ ~"),
  )
.attack(0.01).decay(0).sustain(.4).release(.8)
.sound("piano").lpf(600).hpf(300)
.slow(2).echo(5, 2/3, .7).delay(1).dt(.3).dfb(.5)
.room(1).rsize(2).rfade(.5).postgain(.5)
.phaser("<1 2 4 8>").coarse("<4 8 4 8 16>")
