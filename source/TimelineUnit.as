class TimelineUnit extends MovieClip {
	var thecolors_mc:MovieClip;
	var thumb_mc:MovieClip;
	var copy_txt:TextField;
	var date_txt:TextField;
	var dateShadow_txt:TextField;
	var dateFull_txt:TextField;
	// the following are passed in with attachmovie
	var thumb:String;
	var date:String;
	var tcopy:String;
	function TimelineUnit () {
		watchLoadThumb ();
		this.thumb_mc.loadMovie (this.thumb);
		this.copy_txt.text = this.tcopy;
		this.date_txt.text = this.date.substr (-2);
		this.dateShadow_txt.text = this.date.substr (-2);
		this.dateFull_txt.text = this.date;
	}
	//
	var total:Number;
	var bytes:Number;
	var bloaded:Number;
	function watchLoadThumb () {
		this.onEnterFrame = function () {
			bytes = this.thumb_mc.getBytesLoaded ();
			total = this.thumb_mc.getBytesTotal ();
			bloaded = (total > 12) ? bytes / total : 0;
			if (bloaded == 1) {
				_root.openingConditions ();
				delete this.onEnterFrame;
			}
		};
	}
	function onRollOver () {
		this.thecolors_mc.gotoAndStop (2);
	}
	function onRollOut () {
		this.thecolors_mc.gotoAndStop (1);
	}
	function onDragOut () {
		this.thecolors_mc.gotoAndStop (1);
	}
	function onRelease () {
		_root.slideContent (Number (this._name.substr (-2)));
	}
}
