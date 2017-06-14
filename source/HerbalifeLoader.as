class HerbalifeLoader extends MovieClip {
	var loader_mc:MovieClip;
	var loadHere_mc:MovieClip;
	//var interupted:Boolean = false;
	function HerbalifeLoader () {
	}
	function upDateDisplay (percent:Number) {
		this.loader_mc.gotoAndStop (1);
		this.loader_mc.mask._y = 30 - Math.floor (percent * .30);
	}
	function revealMovieClip () {
		//if (!interupted) {
		//trace ('revealMovieClip ()   called on : ' + this._name);
		_root.loadedArray.push (parseInt (this._name.substr (-3), 10));
		//trace ('_root.loadedArray.push ( ' + parseInt (this._name.substr (-3), 10));
		this.loadHere_mc._alpha = 0;
		this.loader_mc.gotoAndStop (2);
		this.onEnterFrame = function () {
			if (this.loadHere_mc._alpha < 100) {
				this.loadHere_mc._alpha += 5;
			} else {
				delete this.onEnterFrame;
			}
		};
		//}
	}
}
