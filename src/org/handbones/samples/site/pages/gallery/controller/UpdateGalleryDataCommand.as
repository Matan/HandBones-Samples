package org.handbones.samples.site.pages.gallery.controller 
{
	import org.handbones.samples.site.pages.gallery.model.GalleryModel;

	import flash.net.URLRequest;

	import org.handbones.samples.site.pages.gallery.services.IGalleryService;
	import org.handbones.base.PageSettings;
	import org.robotlegs.mvcs.Command;

	/**
	 * @author Matan Uberstein
	 */
	public class UpdateGalleryDataCommand extends Command 
	{

		[Inject]
		public var pageSettings : PageSettings;

		[Inject]
		public var service : IGalleryService;

		[Inject]
		public var model : GalleryModel;

		override public function execute() : void 
		{
			if(!model.hasData)
			{
				service.load(new URLRequest(pageSettings.data.images.@src));
			}
		}
	}
}
