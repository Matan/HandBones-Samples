package org.handbones.samples.site.pages 
{
	import org.handbones.base.Page;
	import org.handbones.samples.site.pages.cookie.view.CookieTesterCanvas;
	import org.handbones.samples.site.pages.cookie.view.CookieTesterCanvasMediator;

	/**
	 * @author Matan Uberstein
	 */
	public class CookieTesterPage extends Page 
	{
		override public function startup() : void 
		{
			mediatorMap.mapView(CookieTesterCanvas, CookieTesterCanvasMediator);
			
			addChild(new CookieTesterCanvas());
			
			super.startup();
		}
	}
}
