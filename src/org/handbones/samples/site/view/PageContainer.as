package org.handbones.samples.site.view 
{
	import assets.PageContainerFC;

	import mu.display.IStandardView;
	import mu.tweens.TweenBundle;

	import org.handbones.core.IPage;
	import org.libspark.betweenas3.BetweenAS3;
	import org.libspark.betweenas3.easing.Back;

	import flash.display.DisplayObject;
	import flash.display.Stage;
	import flash.geom.Rectangle;

	/**
	 * @author Matan Uberstein
	 */
	public class PageContainer extends PageContainerFC implements IStandardView
	{
		protected var _currentPage : IPage;
		protected var _twn : TweenBundle;
		protected var _onScreen : Boolean;
		protected var _enabled : Boolean;
		protected var _pageWidth : Number;
		protected var _pageHeight : Number;

		public function PageContainer()
		{
			scaleX = scaleY = .8;
			alpha = 0;
			enabled = false;
		}

		public function init() : void
		{
			_twn = new TweenBundle();
			
			closeBtn.buttonMode = true;
		}

		public function destroy(stage : Stage = null) : void
		{
			_twn.reset();
			_twn = null;
			
			if(_currentPage && contains(DisplayObject(_currentPage)))
				removeChild(DisplayObject(_currentPage));
			
			_currentPage = null;
		}

		public function show(currentPage : IPage) : void 
		{
			var previousPage : IPage = _currentPage;
			_currentPage = currentPage;
			
			_currentPage.alpha = 0;
				
			_twn.reset();
				
			if(!_onScreen)
					_twn.addTween(BetweenAS3.to(this, {scaleX:1, scaleY:1, alpha:1}, .3, Back.easeOut));
				
			if(previousPage)
					_twn.addTween(BetweenAS3.to(previousPage, {alpha:0}, .3, Back.easeOut));
								_twn.addTween(BetweenAS3.to(_currentPage, {alpha:1}, .3, Back.easeOut));
				
			addChildAt(DisplayObject(_currentPage), getChildIndex(closeBtn));
				
			_twn.parallel();
				
			updateClipping();
				
			_onScreen = true;
			enabled = true;
		}

		public function hide() : void 
		{
			_twn.reset();
			_twn.addTween(BetweenAS3.to(this, {scaleX:.8, scaleY:.8, alpha:0}, .3, Back.easeOut));			_twn.addTween(BetweenAS3.removeFromParent(DisplayObject(_currentPage)));
			_twn.serial();
			
			_onScreen = false;
			enabled = false;
		}

		public function setPageSize(width : Number, height : Number) : void 
		{
			_pageWidth = width;
			_pageHeight = height;
			
			bg.width = width;
			bg.height = height;
			
			closeBtn.x = width;
			
			updateClipping();
		}

		protected function updateClipping() : void
		{
			if(_currentPage)
				_currentPage.scrollRect = new Rectangle(0, 0, _pageWidth, _pageHeight);
		}

		public function get enabled() : Boolean 
		{
			return _enabled;
		}

		public function set enabled(value : Boolean) : void 
		{
			_enabled = value;
			mouseChildren = mouseEnabled = tabChildren = tabEnabled = _enabled;
		}
	}
}
