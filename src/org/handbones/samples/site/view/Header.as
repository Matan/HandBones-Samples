package org.handbones.samples.site.view 
{
	import assets.HeaderFC;

	import mu.display.IStandardView;

	import flash.display.Stage;
	import flash.text.TextFieldAutoSize;

	/**
	 * @author Matan Uberstein
	 */
	public class Header extends HeaderFC implements IStandardView
	{

		protected var _width : Number;

		public function Header()
		{
		}

		public function init() : void
		{
			buttonMode = true;
			versionTxt.autoSize = TextFieldAutoSize.RIGHT;
		}

		public function destroy(stage : Stage = null) : void
		{
		}

		override public function get width() : Number
		{
			return _width;
		}

		override public function set width(width : Number) : void
		{
			_width = width;
			bg.width = _width;
			versionTxt.x = _width - versionTxt.width - 10;
		}

		public function setVersion(version : String) : void 
		{
			versionTxt.text = "v" + version;
			width = width;
		}
	}
}
