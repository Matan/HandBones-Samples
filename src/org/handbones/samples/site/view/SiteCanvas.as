package org.handbones.samples.site.view 
{
	import mu.display.IStandardView;

	import flash.display.Sprite;
	import flash.display.Stage;

	/**
	 * @author Matan Uberstein
	 */
	public class SiteCanvas extends Sprite implements IStandardView
	{
		protected var _bg : Background;
		protected var _header : Header;		protected var _home : Home;
		protected var _pageContainer : PageContainer;
		protected var _footer : Footer;

		public function SiteCanvas()
		{
		}

		public function init() : void
		{
			_bg = new Background();
			addChild(_bg);
			
			_header = new Header();
			addChild(_header);
			
			_home = new Home();
			_home.y = 80;
			addChild(_home);
			
			_pageContainer = new PageContainer();
			_pageContainer.x = 10;
			_pageContainer.y = 90;
			addChild(_pageContainer);
			
			_footer = new Footer();
			addChild(_footer);		}

		public function destroy(stage : Stage = null) : void
		{
		}
	}
}
