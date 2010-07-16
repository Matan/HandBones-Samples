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
		protected var _header : Header;
		protected var _rootButtons : RootButtons;		protected var _pageContainer : PageContainer;
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
			
			_rootButtons = new RootButtons();
			_rootButtons.x = 20;
			_rootButtons.y = 100;
			addChild(_rootButtons);
			
			_pageContainer = new PageContainer();
			_pageContainer.x = 10;
			_pageContainer.y = 90;
			addChild(_pageContainer);
			
			_footer = new Footer();
			addChild(_footer);		}

		protected function createButtons() : void
		{
			
		}

		public function destroy(stage : Stage = null) : void
		{
		}
	}
}
