\version "2.18.2"

\paper {
	top-margin = 0.4\in
}
\header {
	title = \markup { \fontsize #4 \bold "E;U" }
	composer = "Potasmic"
	tagline = "Originally written for synths. Engraved with Lilypond."
	copyright = "Potasmic 2017 CC BY-SA"
}

chordA = \absolute {
	bes,8([ f c' des' f'])
	bes,8([ f c' des'   ])
}

chordB = \absolute {
	ges,8([ ees c' des' aes'])
	ges,8([ ees c' des'     ])
}

chordC = \absolute {
	aes,8([ c aes c' ees' ])
	aes,8([ c aes c'      ])
}

chordD = \absolute {
	ees,8([ bes, aes des' ees' ])
	ees,8([ bes, aes des'      ])
}

leftHandPartA = {
	\repeat volta 2 { 
		\chordA \chordA \chordB \chordB \chordA \chordA
	}
	\alternative {
		{ \chordC \chordC }
		{ \chordD \chordD }
	}
}
leftHandPartAx = {
	\chordA \chordA \chordB \chordB \chordA \chordA \chordC \chordC
	\chordA \chordA \chordB \chordB \chordA \chordA \chordD \chordD
}

arp = \absolute {
	e,8[ b, g d' g' ] 
	e, [ b, gis-.  e'-. ]  
}
arpp = \absolute {
	e,8[ b, g d' g' ] 
	e, [ b, g d' ]
}

leftHandPartB = \absolute {
	\arp
	\transpose e b { \arp }
	\transpose e g { \arp }
	\transpose e d { \arp }
	\transpose e aes { \arp }
	\transpose e fis { \arp }
	\transpose e c { \arpp }
	\transpose e c { \arp }
	\arp
	\transpose e b { \arp }
	\transpose e g { \arp }
	\transpose e d { \arp }
	\transpose e aes { \arp }
	\transpose e fis { \arp }
	\transpose e c { \arpp }
	\transpose e c { \arpp }
}

firstMelody = \relative c' {
	% First
	f4. bes, aes' | ees4(ees4.) bes4 f' |
	ees4 f c des aes8~ | aes8 f1 |
	f'4. bes, bes' | ees,4 f bes, bes'4. |
	aes4. f2~ f4 | c1~ c8 |
	% Second 
	f4. bes, aes' | ees4(ees4.) bes4 f' |
	aes4. ees2~ ees4 | f4. c2~ c4 |
	bes4. f des' | f4(f4.) ees2 |
	c4. des2~ des4 | ees4. bes'2~ bes4
}

secondMelody = \relative c'' {
	\ottava #1
	% First
	g''1~ g8 | c,4 d2~ d4. | 
	f1~ f8 | bes,4 b f2~ f8|
	ees'2~ ees4. ges4 |	b,4. des2~ des4 | 
	d4. ees2~ ees4~ | ees1~ ees8
	% Second
	g1~ g8 | c,4 d2~ d4. | 
	bes'1~ bes8 | c4. f,2~ f4 |
	ees2~ ees4. ges4 | b,4. des2~ des4 |
	aes4. bes2~ bes4~ | bes1~ bes8
}

mRest = {
	r1 r8
}


upper = \relative c' {
	\tempo 4 = 115
	\clef treble
	\key des \major
	\time 9/8

	\repeat unfold 10 { \mRest }

	\firstMelody
	\key c \major
	\secondMelody
}

lower = \relative c {
	\clef bass
	\key des \major
	\time 9/8

	\leftHandPartA  \break
	\leftHandPartAx \break

	\key c \major
	\leftHandPartB
	\bar "|."
}

\score {
	\new GrandStaff {
		<<
			\new Staff = "up"   {
				\set Staff.midiInstrument = #"viola"
				\upper
			}
			\new Staff = "down" { 
				\lower
			}
		>>
	}
	\layout {
		indent = 8\cm
	}
	\midi { }
}