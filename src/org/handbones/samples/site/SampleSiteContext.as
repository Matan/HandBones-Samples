package org.handbones.samples.site 
{
	import org.handbones.samples.site.view.RootButtonsMediator;
	import org.handbones.samples.site.view.RootButtons;
	import org.handbones.events.SizeEvent;
	import org.handbones.mvcs.HandBonesContext;
	import org.handbones.samples.site.controller.StartupCommand;
	import org.handbones.samples.site.controller.StartupCompleteCommand;
	import org.handbones.samples.site.controller.UpdatePageSizeCommand;
	import org.handbones.samples.site.utils.FlashVars;
	import org.handbones.samples.site.view.Background;
	import org.handbones.samples.site.view.BackgroundMediator;
	import org.handbones.samples.site.view.Footer;
	import org.handbones.samples.site.view.FooterMediator;
	import org.handbones.samples.site.view.Header;
	import org.handbones.samples.site.view.HeaderMediator;
	import org.handbones.samples.site.view.PageContainer;
	import org.handbones.samples.site.view.PageContainerMediator;
	import org.handbones.samples.site.view.SiteCanvas;
	import org.handbones.samples.site.view.SiteCanvasMediator;
	import org.robotlegs.base.ContextEvent;

	import flash.display.DisplayObjectContainer;

	/**
	 * @author Matan Uberstein
	 */
	public class SampleSiteContext extends HandBonesContext 
	{
		public function SampleSiteContext(contextView : DisplayObjectContainer = null)
		{
			super(contextView);
		}

		override public function startup() : void 
		{
			//Command mapping
			commandMap.mapEvent(ContextEvent.STARTUP, StartupCommand, ContextEvent, true);
			commandMap.mapEvent(ContextEvent.STARTUP_COMPLETE, StartupCompleteCommand, ContextEvent, true);
			
			commandMap.mapEvent(SizeEvent.RESIZE, UpdatePageSizeCommand, SizeEvent);
			
			//Util mapping
			injector.mapSingleton(FlashVars);
			
			//View Mapping
			mediatorMap.mapView(SiteCanvas, SiteCanvasMediator);			mediatorMap.mapView(Background, BackgroundMediator);			mediatorMap.mapView(Header, HeaderMediator);			mediatorMap.mapView(RootButtons, RootButtonsMediator);			mediatorMap.mapView(Footer, FooterMediator);			mediatorMap.mapView(PageContainer, PageContainerMediator);
			
			super.startup();
		}
	}
}
