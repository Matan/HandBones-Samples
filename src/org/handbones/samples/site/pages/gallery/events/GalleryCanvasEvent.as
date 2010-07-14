package org.handbones.samples.site.pages.gallery.events 
{
	import flash.events.Event;

	/**
	 * @author Matan Uberstein
	 */
	public class GalleryCanvasEvent extends Event 
	{
		public static const IMAGE_CLICKED : String = "IMAGE_CLICKED";
		
		public var imageIndex : int;

		public function GalleryCanvasEvent(type : String)
		{
			super(type);
		}
	}
}
