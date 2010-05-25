package org.handbones.samples.site.pages 
{
	import org.handbones.samples.site.pages.helloworld.view.HelloWorldCanvas;
	import org.handbones.samples.site.pages.helloworld.view.HelloWorldCanvasMediator;
	import org.handbones.base.Page;

	/**
	 * @author Matan Uberstein
	 */
	public class HelloWorldPage extends Page 
	{
		override public function startup() : void 
		{
			mediatorMap.mapView(HelloWorldCanvas, HelloWorldCanvasMediator);
			
			addChild(new HelloWorldCanvas());
			
			super.startup();
		}
	}
}
