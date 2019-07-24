var swave = function(opt) {
	opt.element = opt.element || $(opt.query)[0]
	opt.width = opt.width || opt.element.offfsetWidth;
	opt.height = opt.height || opt.element.offsetHeight;
	if (isNaN(opt.percent)) opt.percent = parseFloat(opt.element.getAttribute('percent'))
	opt.color = opt.color || '#ccc'

	if (!document.getElementById('style-c-wave'))
		$('<style id="style-c-wave">' +
			'.c-wave{position: relative;overflow: hidden;} ' +
			'.c-wave-content{display:block;position:absolute;} ' +
			'.c-wave-svg{height:100%;overflow:visible;} ' +
			'</style>').appendTo('body')

	$(opt.element).addClass('c-wave')
	opt.wave = $('<div class="c-wave-content"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 768 140" class="c-wave-svg"><path d="m 0,12 0,128 384,0 384,0 0,-128 C 768,12 747.392,0 736,0 724.608,0 714.66667,8 704,12 693.33333,16 683.392,24 672,24 660.608,24 650.66667,16 640,12 629.33333,8 619.392,0 608,0 596.608,0 586.66667,8 576,12 565.33333,16 555.392,24 544,24 532.608,24 522.66667,16 512,12 501.33333,8 491.392,0 480,0 468.608,0 458.66667,8 448,12 437.33333,16 427.392,24 416,24 404.608,24 394.66667,16 384,12 373.33333,8 363.392,0 352,0 340.608,0 330.66667,8 320,12 309.33333,16 299.392,24 288,24 276.608,24 266.66667,16 256,12 245.33333,8 235.392,0 224,0 212.608,0 202.66667,8 192,12 181.33333,16 171.392,24 160,24 148.608,24 138.66667,16 128,12 117.33333,8 107.392,0 96,0 84.607995,0 74.666667,8 64,12 53.333333,16 43.392005,24 32,24 20.607995,24 0,12 0,12 Z" style="stroke:' + opt.color + ';stroke-width:' + 1 / opt.time + 'px;fill:' + opt.color + ';fill-opacity: 0.2;"/></div>').css({
		left: -10,
		bottom: -100 + '%',
		height: (140 / 128 * 100) + '%',
		width:opt.element.offsetHeight/140*140/128*768,
	}).appendTo(opt.element)

	opt.time = opt.height / 140 * 128
	var max = - opt.time - 10
	var left = -10;
	var next = function(fn){
		setTimeout(fn,60)
	} || requestAnimationFrame
	opt.animate = function() {
		left -= 1;
		if(left<max) left += opt.time
		opt.wave.css('left',left)
		next(opt.animate)
	}
	opt.wave.animate({
		bottom: (opt.percent - 1) * 100 + '%',
	},5e2,'linear',opt.animate)
	return opt
}
var wave_circle = function(opt) {
	opt.element = opt.element || $(opt.query)[0];
	opt.width = opt.width || opt.element.offfsetWidth;
	opt.height = opt.height || opt.element.offsetHeight;
	var min = Math.min(opt.width,opt.height)
	var b = opt.bwidth||5;

	$('.c-circle-container',opt.element).remove()
	var container = $('<div class="c-circle-container" style="position:relative;height:'+min+'px;width:'+min+'px;padding:'+b+'px;box-sizing:border-box;"></div>').appendTo(opt.element)[0]
	if(opt.wave === true){
		opt.wave = swave({
			element:$('<div style="position:relative;height:100%;width:height:100%;border-radius:50%;"></div>').appendTo(container)[0],
			height:min,
			width:min,
			percent:opt.percent,
			color:opt.color,
		})
	}
	var el = $('<div style="position:absolute;top:0;left:0;height:'+min+'px;width:'+min+'px;"></div>').appendTo(container)[0]
	el.id = Math.random();
	if (isNaN(opt.percent)) opt.percent = parseFloat(opt.element.getAttribute('percent'))
	var opt_c = {
		id: el.id,
		value: opt.percent*100,
		radius: opt.width/2,
		width: opt.bwidth || 5,
		colors: [opt.bcolor || 'rgba(255,255,255,0.1)',opt.color || '#cccccc']
	}
	if(opt.text){
		opt_c.text = opt.text
	}
	opt.circle = Circles.create(opt_c)
	return opt
}
var node_circle = function(opt) {console.log(opt);
	opt.element = opt.element || $(opt.query)[0];
	opt.width = opt.width || opt.element.offfsetWidth;
	opt.height = opt.height || opt.element.offsetHeight;
	if(!('duration' in opt)) opt.duration = 400;
	var min = Math.min(opt.width,opt.height)
	
	$('.c-node-circle-container',opt.element).remove()
	var container = $('<div class="c-node-circle-container" style="position:relative;height:'+min+'px;width:'+min+'px;"></div>').appendTo(opt.element)[0]
	var el = $('<div style="height:100%;width:100%;"></div>').appendTo(container)[0]
	el.id = Math.random();
	if (isNaN(opt.percent)) opt.percent = parseFloat(opt.element.getAttribute('percent'))
	var opt_c = {
		id: el.id,
		value: opt.percent*100,
		duration: opt.duration,
		radius: opt.width/2,
		width: opt.bwidth || 2,
		colors: [opt.bcolor || '#ffffff',opt.color || '#cccccc'],
	}
	var r = opt.width/2-(opt.bwidth || 2)/2
	var node = $('<i></i>').appendTo(container).css({
		display:'block',
		position:'absolute',
		top:0-6+(opt.bwidth || 2)/2,
		left:opt.width/2-6,
		height:12,
		width:12,
		border:'2.5px solid '+(opt.color || '#cccccc'),
		'background-color':(opt.bcolor || '#ffffff'),
		'border-radius':'50%',
	})[0]
	var c1 = 2*Math.PI
	var c2 = opt.width/2 - 6
	var set_node = function(p){
		var x,y;
		x = r*Math.sin(p*c1)+c2
		y = -r*Math.cos(p*c1)+c2
		node.style.left = x+'px'
		node.style.top = y+'px'
	}
	if(opt.text){
		opt_c.text = function(v){
			set_node(v/100)
			return opt.text(v)
		}
	}else{
		opt_c.text = function(v){
			set_node(v/100)
			return v
		}
	}
	opt.circle = Circles.create(opt_c)
	return opt
}
