" Vim syntax file
" Language:	MDL
" Author: Steven Mikes

" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

"Keywords
syn keyword mdlStatement	alias analysis run
syn keyword mdlStatement	export input output
syn keyword mdlConditional	if else
syn keyword mdlPP			include
syn keyword mdlType			int string cplx real
syn keyword mdlType			measurement
syn keyword mdlRepeat		foreach search mvarsearch
syn keyword mdlOperator		from binary option parameter exec zero
"syn match 	mdlStatement 	'real\s'


"function keywords
syn keyword mdlFunction		tran montecarlo dc ac noise sp contained
syn keyword mdlFunction		abs acos acosh angle argmax argmin contained
syn keyword mdlFunction		asin asinh atan atanh avg bw ceil contained
syn keyword mdlFunction		cfft clip conj convolve cos cosh contained
syn keyword mdlFunction		cplx cross crosscorr crosses d2r contained
syn keyword mdlFunction		db db10 dbm deltax deriv dutycycle contained
syn keyword mdlFunction		dutycycles exp eyeDiagram falltime contained
syn keyword mdlFunction		fft flip floor fmt freq freq_jitter contained
syn keyword mdlFunction		gainBwProd gainmargin groupdelay histo contained
syn keyword mdlFunction		ifft iinteg im int integ ln log10 mag  contained
syn keyword mdlFunction		max min mod movingavg overshoot period_jitter contained
syn keyword mdlFunction		ph phasemargin pow pp pzbode pzfilter r2d contained
syn keyword mdlFunction		re real risetime rms rmsnoise round s sample settlingTime contained
syn keyword mdlFunction		sign sin sinh slewrate snr sqrt stathisto tan  contained
syn keyword mdlFunction		tanh trim window xval yval V I contained

"function parameters
syn keyword mdlParam		method annotate values onerror lin dec log
syn keyword mdlParam		start stop step center span errpreset 
syn keyword mdlParam		scalarfile numruns seed donominal 	
syn keyword mdlParam		variations firstrun savefamilyplots 	
syn keyword mdlParam		arg sig response sig_re sig_im 	
syn keyword mdlParam		from to numPoints window sig1 sig2 n_interp_steps 	
syn keyword mdlParam		dir n thresh xtol ytol accuracy theta 	
syn keyword mdlParam		thresh1 thresh2 dir1 dir2 n1 n2 	
syn keyword mdlParam		Signal StartTime StopTime Period 	
syn keyword mdlParam		initval finalval inittyp finaltype theta1 theta2 	
syn keyword mdlParam		format varargs binsize nbins dividend divisor 	
syn keyword mdlParam		base exponent poles zeroes c minfreq maxfreq npoints 	
syn keyword mdlParam		reldist absdist minq by type sig_from sig_to 	
syn keyword mdlParam		noise_from noise_to innerswpval 	
syn keyword mdlParam        maxiters maxsteps include dec
"syn match 	mdlParam		'max[^\)]'
"syn match 	mdlParam		'min'
"syn match 	mdlParam		'db'

"function parameter constants
syn match funConst			+'x+
syn match funConst			+'y+
syn match funConst			+'liberal+
syn match funConst			+'moderate+
syn match funConst			+'conservative+
syn match funConst			+'gear2+
syn match funConst			+'status+
syn match funConst			+'yes+
syn match funConst			+'no+
syn match funConst			+'all+
syn match funConst			+'continue+
syn match funConst			+'low+
syn match funConst			+'high+
syn match funConst			+'band+
syn match funConst			+'rectangular+
syn match funConst			+'cross+
syn match funConst			+'rise+
syn match funConst			+'fall+
syn match funConst			+'interp+
syn match funConst			+'exact+
syn match funConst			+'bartlett+
syn match funConst			+'bartletthann+
syn match funConst			+'blackman+
syn match funConst			+'blackmanharris+
syn match funConst			+'cosine2+
syn match funConst			+'cosine4+
syn match funConst			+'extcosbell+
syn match funConst			+'flattop+
syn match funConst			+'halfcyclesine+
syn match funConst			+'half3cyclesine+
syn match funConst			+'halfcyclesine3+
syn match funConst			+'half6cyclesine+
syn match funConst			+'halfcyclesine6+
syn match funConst			+'hamming+
syn match funConst			+'hanning+
syn match funConst			+'nuttall+
syn match funConst			+'parzen+
syn match funConst			+'triangular+
syn match funConst			+'linear+
syn match funConst			+'log+
syn match funConst			+'process+
syn match funConst			+'mismatch+

"function regions
syn region	mdlFnregion		start='tran\s*(' end=')' transparent contains=mdlFunction,mdlParam,funConst
syn region	mdlFnregion		start='montecarlo\s*(' end=')' transparent contains=mdlFunction,mdlParam,funConst,mdlString
syn region	mdlFnregion		start='dc\s*(' end=')' transparent contains=mdlFunction,mdlParam,funConst
syn region	mdlFnregion		start='ac\s*(' end=')' transparent contains=mdlFunction,mdlParam,funConst
syn region	mdlFnregion		start='noise\s*(' end=')' transparent contains=mdlFunction,mdlParam,funConst
syn region	mdlFnregion		start='sp\s*(' end=')' transparent contains=mdlFunction,mdlParam,funConst
syn region	mdlFnregion		start='abs\s*(' end=')' transparent contains=mdlFunction,mdlParam,funConst
syn region	mdlFnregion		start='acos\s*(' end=')' transparent contains=mdlFunction,mdlParam,funConst
syn region	mdlFnregion		start='acosh\s*(' end=')' transparent contains=mdlFunction,mdlParam,funConst
syn region	mdlFnregion		start='angle\s*(' end=')' transparent contains=mdlFunction,mdlParam,funConst
syn region	mdlFnregion		start='argmax\s*(' end=')' transparent contains=mdlFunction,mdlParam,funConst
syn region	mdlFnregion		start='argmin\s*(' end=')' transparent contains=mdlFunction,mdlParam,funConst
syn region	mdlFnregion		start='asin\s*(' end=')' transparent contains=mdlFunction,mdlParam,funConst
syn region	mdlFnregion		start='asinh\s*(' end=')' transparent contains=mdlFunction,mdlParam,funConst
syn region	mdlFnregion		start='atan\s*(' end=')' transparent contains=mdlFunction,mdlParam,funConst
syn region	mdlFnregion		start='atanh\s*(' end=')' transparent contains=mdlFunction,mdlParam,funConst
syn region	mdlFnregion		start='avg\s*(' end=')' transparent contains=mdlFunction,mdlParam,funConst
syn region	mdlFnregion		start='bw\s*(' end=')' transparent contains=mdlFunction,mdlParam,funConst
syn region	mdlFnregion		start='ceil\s*(' end=')' transparent contains=mdlFunction,mdlParam,funConst
syn region	mdlFnregion		start='cfft\s*(' end=')' transparent contains=mdlFunction,mdlParam,funConst
syn region	mdlFnregion		start='clip\s*(' end=')' transparent contains=mdlFunction,mdlParam,funConst
syn region	mdlFnregion		start='conj\s*(' end=')' transparent contains=mdlFunction,mdlParam,funConst
syn region	mdlFnregion		start='convolve\s*(' end=')' transparent contains=mdlFunction,mdlParam,funConst
syn region	mdlFnregion		start='cos\s*(' end=')' transparent contains=mdlFunction,mdlParam,funConst
syn region	mdlFnregion		start='cosh\s*(' end=')' transparent contains=mdlFunction,mdlParam,funConst
syn region	mdlFnregion		start='cplx\s*(' end=')' transparent contains=mdlFunction,mdlParam,funConst
syn region	mdlFnregion		start='cross\s*(' end=')' transparent contains=mdlFunction,mdlParam,funConst
syn region	mdlFnregion		start='crosscorr\s*(' end=')' transparent contains=mdlFunction,mdlParam,funConst
syn region	mdlFnregion		start='crosses\s*(' end=')' transparent contains=mdlFunction,mdlParam,funConst
syn region	mdlFnregion		start='d2r\s*(' end=')' transparent contains=mdlFunction,mdlParam,funConst
syn region	mdlFnregion		start='db\s*(' end=')' transparent contains=mdlFunction,mdlParam,funConst
syn region	mdlFnregion		start='db10\s*(' end=')' transparent contains=mdlFunction,mdlParam,funConst
syn region	mdlFnregion		start='dbm\s*(' end=')' transparent contains=mdlFunction,mdlParam,funConst
syn region	mdlFnregion		start='deltax\s*(' end=')' transparent contains=mdlFunction,mdlParam,funConst
syn region	mdlFnregion		start='deriv\s*(' end=')' transparent contains=mdlFunction,mdlParam,funConst
syn region	mdlFnregion		start='dutycycle\s*(' end=')' transparent contains=mdlFunction,mdlParam,funConst
syn region	mdlFnregion		start='dutycycles\s*(' end=')' transparent contains=mdlFunction,mdlParam,funConst
syn region	mdlFnregion		start='exp\s*(' end=')' transparent contains=mdlFunction,mdlParam,funConst
syn region	mdlFnregion		start='eyeDiagram\s*(' end=')' transparent contains=mdlFunction,mdlParam,funConst
syn region	mdlFnregion		start='falltime\s*(' end=')' transparent contains=mdlFunction,mdlParam,funConst
syn region	mdlFnregion		start='fft\s*(' end=')' transparent contains=mdlFunction,mdlParam,funConst
syn region	mdlFnregion		start='flip\s*(' end=')' transparent contains=mdlFunction,mdlParam,funConst
syn region	mdlFnregion		start='floor\s*(' end=')' transparent contains=mdlFunction,mdlParam,funConst
syn region	mdlFnregion		start='fmt\s*(' end=')' transparent contains=mdlFunction,mdlParam,funConst
syn region	mdlFnregion		start='freq\s*(' end=')' transparent contains=mdlFunction,mdlParam,funConst
syn region	mdlFnregion		start='freq_jitter\s*(' end=')' transparent contains=mdlFunction,mdlParam,funConst
syn region	mdlFnregion		start='gainBwProd\s*(' end=')' transparent contains=mdlFunction,mdlParam,funConst
syn region	mdlFnregion		start='gainmargin\s*(' end=')' transparent contains=mdlFunction,mdlParam,funConst
syn region	mdlFnregion		start='groupdelay\s*(' end=')' transparent contains=mdlFunction,mdlParam,funConst
syn region	mdlFnregion		start='histo\s*(' end=')' transparent contains=mdlFunction,mdlParam,funConst
syn region	mdlFnregion		start='I\s*(' end=')' transparent contains=mdlFunction,mdlParam,funConst
syn region	mdlFnregion		start='ifft\s*(' end=')' transparent contains=mdlFunction,mdlParam,funConst
syn region	mdlFnregion		start='iinteg\s*(' end=')' transparent contains=mdlFunction,mdlParam,funConst
syn region	mdlFnregion		start='im\s*(' end=')' transparent contains=mdlFunction,mdlParam,funConst
syn region	mdlFnregion		start='int\s*(' end=')' transparent contains=mdlFunction,mdlParam,funConst
syn region	mdlFnregion		start='integ\s*(' end=')' transparent contains=mdlFunction,mdlParam,funConst
syn region	mdlFnregion		start='ln\s*(' end=')' transparent contains=mdlFunction,mdlParam,funConst
syn region	mdlFnregion		start='log10\s*(' end=')' transparent contains=mdlFunction,mdlParam,funConst
syn region	mdlFnregion		start='mag\s*(' end=')' transparent contains=mdlFunction,mdlParam,funConst
syn region	mdlFnregion		start='max\s*(' end=')' transparent contains=mdlFunction,mdlParam,funConst
syn region	mdlFnregion		start='min\s*(' end=')' transparent contains=mdlFunction,mdlParam,funConst
syn region	mdlFnregion		start='mod\s*(' end=')' transparent contains=mdlFunction,mdlParam,funConst
syn region	mdlFnregion		start='movingavg\s*(' end=')' transparent contains=mdlFunction,mdlParam,funConst
syn region	mdlFnregion		start='overshoot\s*(' end=')' transparent contains=mdlFunction,mdlParam,funConst
syn region	mdlFnregion		start='period_jitter\s*(' end=')' transparent contains=mdlFunction,mdlParam,funConst
syn region	mdlFnregion		start='ph\s*(' end=')' transparent contains=mdlFunction,mdlParam,funConst
syn region	mdlFnregion		start='phasemargin\s*(' end=')' transparent contains=mdlFunction,mdlParam,funConst
syn region	mdlFnregion		start='pow\s*(' end=')' transparent contains=mdlFunction,mdlParam,funConst
syn region	mdlFnregion		start='pp\s*(' end=')' transparent contains=mdlFunction,mdlParam,funConst
syn region	mdlFnregion		start='pzbode\s*(' end=')' transparent contains=mdlFunction,mdlParam,funConst
syn region	mdlFnregion		start='pzfilter\s*(' end=')' transparent contains=mdlFunction,mdlParam,funConst
syn region	mdlFnregion		start='r2d\s*(' end=')' transparent contains=mdlFunction,mdlParam,funConst
syn region	mdlFnregion		start='re\s*(' end=')' transparent contains=mdlFunction,mdlParam,funConst
syn region	mdlFnregion		start='real\s*(' end=')' transparent contains=mdlFunction,mdlParam,funConst
syn region	mdlFnregion		start='risetime\s*(' end=')' transparent contains=mdlFunction,mdlParam,funConst
syn region	mdlFnregion		start='rms\s*(' end=')' transparent contains=mdlFunction,mdlParam,funConst
syn region	mdlFnregion		start='rmsnoise\s*(' end=')' transparent contains=mdlFunction,mdlParam,funConst
syn region	mdlFnregion		start='round\s*(' end=')' transparent contains=mdlFunction,mdlParam,funConst
syn region	mdlFnregion		start='sample\s*(' end=')' transparent contains=mdlFunction,mdlParam,funConst
syn region	mdlFnregion		start='s\s*(' end=')' transparent contains=mdlFunction,mdlParam,funConst
syn region	mdlFnregion		start='settlingTime\s*(' end=')' transparent contains=mdlFunction,mdlParam,funConst
syn region	mdlFnregion		start='sign\s*(' end=')' transparent contains=mdlFunction,mdlParam,funConst
syn region	mdlFnregion		start='sin\s*(' end=')' transparent contains=mdlFunction,mdlParam,funConst
syn region	mdlFnregion		start='sinh\s*(' end=')' transparent contains=mdlFunction,mdlParam,funConst
syn region	mdlFnregion		start='slewrate\s*(' end=')' transparent contains=mdlFunction,mdlParam,funConst
syn region	mdlFnregion		start='snr\s*(' end=')' transparent contains=mdlFunction,mdlParam,funConst
syn region	mdlFnregion		start='sqrt\s*(' end=')' transparent contains=mdlFunction,mdlParam,funConst
syn region	mdlFnregion		start='stathisto\s*(' end=')' transparent contains=mdlFunction,mdlParam,funConst
syn region	mdlFnregion		start='tan\s*(' end=')' transparent contains=mdlFunction,mdlParam,funConst
syn region	mdlFnregion		start='tanh\s*(' end=')' transparent contains=mdlFunction,mdlParam,funConst
syn region	mdlFnregion		start='trim\s*(' end=')' transparent contains=mdlFunction,mdlParam,funConst
syn region	mdlFnregion		start='V\s*(' end=')' transparent contains=mdlFunction,mdlParam,funConst
syn region	mdlFnregion		start='window\s*(' end=')' transparent contains=mdlFunction,mdlParam,funConst
syn region	mdlFnregion		start='xval\s*(' end=')' transparent contains=mdlFunction,mdlParam,funConst
syn region	mdlFnregion		start='yval\s*(' end=')' transparent contains=mdlFunction,mdlParam,funConst

"String
syn region mdlString		start=+[uU]\="+ end=+"+ skip=+\\\\\|\\'+

"Numbers
"floating point number, with dot, optional exponent
syn match mdlNumber "\<[0-9]\+\.[0-9]*\(e[-+]\=[0-9]\+\)\=\(meg\=\|[afpnumkg]\)\="
"floating point number, starting with a dot, optional exponent
syn match mdlNumber "\.[0-9]\+\(e[-+]\=[0-9]\+\)\=\(meg\=\|[afpnumkg]\)\="
"integer number with optional exponent
syn match mdlNumber "\<[0-9]\+\(e[-+]\=[0-9]\+\)\=\(meg\=\|[afpnumkg]\)\="



"Comments
syn match	mdlComment	"//.*"
syn region	mdlComment	start="/\*" end="\*/"

hi link mdlComment 		Comment
hi link mdlStatement	Statement
hi link mdlConditional	Conditional
hi link mdlPP			PreProc
hi link mdlType			Type
hi link mdlString		String
hi link mdlNumber       Number
hi link mdlRepeat		Repeat
hi link mdlOperator		Operator
hi link mdlError		Error
hi link mdlFunction		Function
hi link mdlParam		Special
hi link funConst		Define

let b:current_syntax = "mdl"
