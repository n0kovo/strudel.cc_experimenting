/*
@title day02
@by n0kovo <https://github.com/n0kovo>
@details Hmm
@genre techno
@license CC BY-NC-SA 4.0
*/

samples('bubo:waveforms');
setcpm(65)


$: stack(
    s("sbd")
    .duck(2).duckattack(.1896).duckdepth(1).decay(.45).fast(2).gain(.5)
    .hpf(45)
    //.gain(0)
,
  
    s("~ cp").bank("RolandTR808")
    .dec(.35).gain(.4)
    .hpf(800)
    //.gain(0)
,  
    s("[~@64 cp]").slow(8).bank("RolandTR808")
    .dec(.063).gain(.285)
    .hpf(800)
,    
    s("~ oh").bank("RolandTR909").fast(2)
    .dec(.095).gain("[.36 .4]")
    .hpf(700)
    //.gain(0)
).compressor(-20, 50, 5, .1, .01).postgain(0.55)
  ._scope()

$:
note("<[e3]!4 [d3]!2 [f3]!2>").transpose(-24)
.coarse(perlin.choose(5, 6, 7, 8, 9, 10, 11, 12))
.distort(perlin.range(.2, .3).fast(2)).compressor(-10, 10, 10, .04, .07)
.n("<1 2 3 4 5 6 7 8 9 10>").room(0.7).size(0.9)
.s('wt_flute').velocity(perlin.range("<0.1 0.2>", "<0.3 0.4 0.1>").fast(2)).often(n => n.ply(2))
.release(0.125).decay("<0.1 0.25 0.3 0.4>").sustain(0)
.cutoff("<100 2000 70 4000 50 >").fast(2)
  .lpenv("<4>*4")
    .lpa("0")
    .lpd(.03)
    .lps("0")
    .lpr("0")
.orbit(2)
.rarely(x=>x.room(.8).rsize(10))
.late(perlin.range(.0, "<.014 .01>*2").fast(2)).late(.002)
  .swingBy(1/11, 4)
.hpf(33).hpq(10).lpf(perlin.range(100, 10000).fast(4))
.postgain(1.75)
  ._scope()

$: note("~@4 ~@4 ~@4 <e4 ~>@3.5")
  .att(0)
  .dec(.12)
.postgain(.5)


$: note("[~@2 <~ f#1>@4 ~@2 ~@4 ~@4]/4")
  .att(.13)
  .dec(.8)
  .penv("<40@4 30@4>/2")
  .patt(.19)
  .pdec(.6)
  .early(.13)
.room(.15).rsize(2)
.hpf(400)
.postgain(.5)
  ._pianoroll()

$: note("<[d2, a2, e#2, d1]*8>").transpose(12)
.s('supersaw')
.att(.4)
.decay(.5)
.gain(.8)
.lpf("<5600 5000 >/2")
  .lpq("<17 21 >/2")
.tremsync(8).tremoloshape("<sawtooth sawtooth square>*4").tremoloskew("<.35 .5 .7 .6>*4")
.tremdepth("[[0!2@7]*3 1!3]*2.5")
.coarse("[8 6 5 7]/4")
.hpf("<290 400 >/2")
.compressor(-23, 15, 7, .1, .01)
.postgain("<.165 .06 >/2")
.orbit(2)
.early(.00045)
.room(1).rsize(30).rfade(.5)
