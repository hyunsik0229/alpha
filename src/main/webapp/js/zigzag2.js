



window.onload = () => {

	/** @type {HTMLTableElement} */	
	let surface = document.querySelector('#surface');
	
	surface.onmousedown = e => e.preventDefault();
	surface.oncontextmenu = e => e.preventDefault();
	
	/** @type {HTMLButtonElement} */
	let btnCreate = document.querySelector('#btnCreate');
	
	btnCreate.onclick = e => {
		console.log("btnCreate....");
		let zigzag = new ZigZag();
		zigzag.run();
	}
}

class Alpha {
	line
	column
	fg
	bg
	ch
};

class ZigZag {
	constructor() {
		/** @type {HTMLTableElement} */
		this.surface = document.querySelector('#surface');
		this.speed  = Math.random()*200+10;
		this.direction = Direction[(parseInt(Math.random*4))];
	}
	
	show() {
		let td = this.surface.rows[this.alpha.line-1].cells[this.alpha.column-1];
		td.style.color = this.alpha.fg;
		td.style.background = this.alpha.bg;
		td.innerText = this.alpha.ch;
	}
	
	hide() {
		let td = this.surface.rows[this.alpha.line-1].cells[this.alpha.column-1];
		td.style.color = 'white';
		td.style.background =  'white';
	}
	
	async move(){
		console.log("move...")
		this.hide();
		
		switch(this.direction){
		case Direction.Top:
			this.alpha.line--;
			break;
		case Direction.Right:
			this.alpha.column++;
			break;
		case Direction.Bottom:
			this.alpha.line++;
			break;
		case Direction.Left:
			this.alpha.column--;
			break;
		}
		
		if(this.alpha.line == 0 || this.alpha.column ==0){
			this.alpha.line = 1;
			this.alpha.column =1;
			let canDirection = [Direction.Right, Direction.Bottom];
			this.direction = canDirection[parseInt(Math.random()*2)]; 
		}
		
		this.show();
		this.step++;
		
		if(this.step ==5){
			this.direction = Direction.values[parseInt(Math.random()*4)];
			this.step = 0;
		}
	}
	
	async run() {
		let response = await fetch('/alpha/data');
		/** @type {Alpha}*/
		this.alpha = await response.json();
		console.log(this.alpha);
		this.show();
		
		for(;;){
			await sleep(this.speed);
			this.move();				
		}
	}
}

function sleep(millis) {
	return new Promise((resolve, reject) => {
		setTimeout(resolve,millis);
	})
}

const Direction = {
	 Top 		: 'Top',
	 Right		: 'Right',
	 Bottom 	: 'Bottom',
	 Left 		: 'left',
	
	 values	: ['Top', 'Right', 'Bottom', 'left']
}

Object.freeze(Direction);




