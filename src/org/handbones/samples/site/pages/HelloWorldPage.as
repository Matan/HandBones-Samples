package org.handbones.samples.site.pages 
{
	import org.handbones.samples.site.pages.helloworld.controller.HelloWorldStartupCompleteCommand;
	import org.handbones.events.PageEvent;
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
			commandMap.mapEvent(PageEvent.STARTUP_COMPLETE, HelloWorldStartupCompleteCommand, PageEvent);
			
			mediatorMap.mapView(HelloWorldCanvas, HelloWorldCanvasMediator);
			
			super.startup();
		}
	}
}
