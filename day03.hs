/*
@title day03
@by n0kovo <https://github.com/n0kovo>
@genre trance
@license CC BY-NC-SA 4.0
*/

setcpm(71)


$: stack(
    s("sbd")
    .duck(2).duckattack(.1896).duckdepth(1).decay(.45).fast(2).gain(.5)
    .hpf(45)
    //.gain(0)
,
  
    s("~ cp").bank("RolandTR808")
    .dec(.21).gain(.32)
    .hpf(800)
    .room(.15)
    //.gain(0)
,  
    s("[~@64 cp]").slow(8).bank("RolandTR808")
    .dec(.06).gain(.285)
    .hpf(800)
    .gain(0)
,    
    s("~ oh").bank("RolandTR909").fast(2)
    .dec(.095).gain("[.14 .12]")
    .hpf(700)
    //.gain(0)
).compressor(-20, 50, 5, .1, .01).postgain(0.55)


$: note("<~ [d1 d1] >*4".scale('D-2 minor pentatonic').scaleTranspose("<-1@4 < 0@2 0@2 >@4 -2@4 < <[-2@2 0 [-1@2 -2]] [-2@3 1]> >@4 >*2").add("0,12"))
.velocity("<~ <[.7 1] [.2 .7]> >*4")
.s("sawtooth").att(.012).dec(.15)
.lpf(40).lpenv(3.8).lpa(.025).lpd(.17).lpr(.05).lpq(1.5).ftype(1)
.att(0.001)
.dec(.11)
.rel(.02)
.bpf(40).bpq(.11)//.ftype("ladder")
.room(0.05).rsize(1.6).rfade(.01)
.early(.015).n(16)
.orbit(2)
.hpf(25).coarse(4).gain(5).distort(2).postgain(.1)
._pianoroll()
$: note(
  cat(`
    [
      <
        [
          [~ b#3] <b#3 [<b#3 ~> d4]>
        ]
        [
          <[~ b3] b3 > [b3 b#3]
        ] [
            [
              ~ <b#3 e4>
            ] [
                ~ b3
              ]
          ]
        [
          [~ b#3]
          <
            [
              <~ b3> b3
            ]
            [
              g4 <b3 a4>
            ]
          >
        ]
      >
    ]
  `).fast(2))
.transpose("[<<-7 -2> <-5 5>> 0]*4")
.transpose("[0 <-12 <0 <-3 0> 0>> <-12 0> <0 -24 -12> 0]*2")
.s('supersaw').att(.01).dec(.09).sus(.2).room(.2).postgain(.3)
.lpf(sine.segment(32).range(170, 900).slow(12)).lpa(.01).lpd(.1).lps(.02).lpq(3)
.hpf(220)
.echo(4, 3/8, .3)
.orbit(2)
.room(.15).rsize(20).rfade(1)
.late(.014)
._pianoroll()
