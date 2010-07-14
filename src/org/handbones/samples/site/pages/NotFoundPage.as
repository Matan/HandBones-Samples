package org.handbones.samples.site.pages 
{
	import org.handbones.base.Page;
	import org.handbones.samples.site.pages.notfound.view.NotFoundCanvas;
	import org.handbones.samples.site.pages.notfound.view.NotFoundCanvasMediator;

	/**
	 * @author Matan Uberstein
	 */
	public class NotFoundPage extends Page 
	{
		override public function startup() : void 
		{
			mediatorMap.mapView(NotFoundCanvas, NotFoundCanvasMediator);
			
			addChild(new NotFoundCanvas());
		}
	}
}
