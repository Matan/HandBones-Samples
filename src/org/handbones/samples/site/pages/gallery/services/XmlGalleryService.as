package org.handbones.samples.site.pages.gallery.services 
{
	import org.handbones.samples.site.pages.gallery.model.GalleryModel;

	import mu.events.LoaderEvent;
	import mu.loaders.XMLLoader;

	import org.robotlegs.mvcs.Actor;

	import flash.net.URLRequest;

	/**
	 * @author Matan Uberstein
	 */
	public class XmlGalleryService extends Actor implements IGalleryService
	{

		[Inject]
		public var model : GalleryModel;

		protected var _loader : XMLLoader;
		protected var _busy : Boolean;

		public function XmlGalleryService()
		{
		}

		public function load(request : URLRequest) : void
		{
			if(!_busy)
			{
				_loader = new XMLLoader();
				eventMap.mapListener(_loader, LoaderEvent.LOADED, loaded_handler, LoaderEvent);
				eventMap.mapListener(_loader, LoaderEvent.ERROR, error_handler, LoaderEvent);				_loader.load(request, true);
				_busy = true;
			}
		}

		protected function loaded_handler(event : LoaderEvent) : void 
		{
			var paths : Array = [];
			
			var xml : XML = _loader.data;
			var children : XMLList = xml.children();
			
			var cL : int = children.length();
			for(var i : int = 0;i < cL;i++) 
			{
				var child : XML = children[i];
				switch(String(child.name()))
				{		
					case "image":
						paths.push(child.@src);
						break;
					default:
				}
			}
			
			model.update(xml.@src, paths);
			
			_busy = false;
		}

		protected function error_handler(event : LoaderEvent) : void 
		{
			_busy = false;
			trace(event.errorMessage);
		}
	}
}
