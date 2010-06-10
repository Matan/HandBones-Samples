package org.handbones.samples.site.pages 
{
	import org.handbones.samples.site.pages.gallery.controller.ParseGalleryXmlCommand;
	import org.handbones.events.PageEvent;
	import org.handbones.base.Page;
	import org.handbones.samples.site.pages.gallery.model.GalleryModel;
	import org.handbones.samples.site.pages.gallery.services.IGalleryService;
	import org.handbones.samples.site.pages.gallery.services.XmlGalleryService;
	import org.handbones.samples.site.pages.gallery.view.GalleryCanvas;
	import org.handbones.samples.site.pages.gallery.view.GalleryCanvasMediator;

	/**
	 * @author Matan Uberstein
	 */
	public class GalleryPage extends Page 
	{
		override public function startup() : void 
		{
			commandMap.mapEvent(PageEvent.STARTUP_COMPLETE, ParseGalleryXmlCommand, PageEvent);
			
			injector.mapSingleton(GalleryModel);
			
			injector.mapSingletonOf(IGalleryService, XmlGalleryService);
			
			mediatorMap.mapView(GalleryCanvas, GalleryCanvasMediator);
			
			addChild(new GalleryCanvas());
			
			super.startup();
		}
	}
}
