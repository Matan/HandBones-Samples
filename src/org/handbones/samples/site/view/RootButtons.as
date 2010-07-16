package org.handbones.samples.site.view 
{
	import assets.BigButtonFC;

	import flash.display.Sprite;
	import flash.events.IEventDispatcher;

	/**
	 * @author Matan Uberstein
	 */
	public class RootButtons extends Sprite 
	{

		protected var _hSpacer : int = 20;

		protected var _buttons : Array;

		public function RootButtons()
		{
			_buttons = [];
		}

		public function createButton(label : String) : IEventDispatcher 
		{
			var xP : Number = 0;
			var prvBtn : BigButtonFC = _buttons[_buttons.length - 1];
			if(prvBtn)
				xP = prvBtn.x + prvBtn.width + _hSpacer;
			
			var btn : BigButtonFC = new BigButtonFC();
			btn.label.mouseEnabled = false;			btn.label.mouseChildren = false;
			btn.label.text = label;
			btn.buttonMode = true;
			btn.x = xP;
			
			addChild(btn);
			
			_buttons.push(btn);
			
			return btn;
		}
	}
}
