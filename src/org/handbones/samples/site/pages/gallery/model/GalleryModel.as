package org.handbones.samples.site.pages.gallery.model 
{
	import org.handbones.samples.site.pages.gallery.events.GalleryModelEvent;
	import org.robotlegs.mvcs.Actor;

	/**
	 * @author Matan Uberstein
	 */
	public class GalleryModel extends Actor 
	{
		protected var _imagePaths : Array;
		protected var _hasData : Boolean;

		public function GalleryModel()
		{
		}

		public function update(basePath : String, paths : Array) : void 
		{
			_imagePaths = [];
			
			var pL : int = paths.length;
			for(var i : int = 0;i < pL;i++) 
			{
				_imagePaths[i] = basePath + paths[i];
			}
			
			dispatch(new GalleryModelEvent(GalleryModelEvent.UPDATED));
		}

		public function get imagePaths() : Array
		{
			return _imagePaths;
		}
		
		public function get hasData() : Boolean
		{
			return _hasData;
		}
	}
}
