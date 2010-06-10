package org.handbones.samples.site.pages.gallery.events 
{
	import flash.events.Event;

	/**
	 * @author Matan Uberstein
	 */
	public class GalleryModelEvent extends Event 
	{
		public static const UPDATED : String = "UPDATED";

		public function GalleryModelEvent(type : String)
		{
			super(type);
		}
	}
}
