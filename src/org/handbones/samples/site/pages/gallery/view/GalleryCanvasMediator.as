package org.handbones.samples.site.pages.gallery.view 
{
	import org.handbones.core.INavigator;
	import org.handbones.events.SizeEvent;
	import org.handbones.model.SizeModel;
	import org.handbones.samples.site.pages.gallery.events.GalleryCanvasEvent;
	import org.handbones.samples.site.pages.gallery.events.GalleryModelEvent;
	import org.handbones.samples.site.pages.gallery.model.GalleryModel;
	import org.robotlegs.mvcs.Mediator;

	import flash.net.URLVariables;

	/**
	 * @author Matan Uberstein
	 */
	public class GalleryCanvasMediator extends Mediator 
	{

		[Inject]
		public var view : GalleryCanvas;

		[Inject]
		public var model : GalleryModel;

		[Inject]
		public var sizeModel : SizeModel;
		
		[Inject]
		public var navigator : INavigator;

		override public function onRegister() : void 
		{
			eventMap.mapListener(eventDispatcher, SizeEvent.PAGE_RESIZE, pageResize_hanlder, SizeEvent);
			
			view.init();
			
			eventMap.mapListener(view, GalleryCanvasEvent.IMAGE_CLICKED, imageClicked_handler, GalleryCanvasEvent);
			
			view.setSize(sizeModel.pageWidth, sizeModel.pageHeight);
			
			if(model.hasData)
				view.imagePaths = model.imagePaths;
			else
				eventMap.mapListener(eventDispatcher, GalleryModelEvent.UPDATED, modelUpdated_handler, GalleryModelEvent);
		}

		override public function onRemove() : void 
		{
			view.destroy(contextView.stage);
		}

		protected function imageClicked_handler(event : GalleryCanvasEvent) : void 
		{
			var vrs : URLVariables = navigator.getUrlVariables();
			vrs.selectedImage = event.imageIndex;
			trace('vrs: ' + (vrs));
			
			navigator.setUrlVariables(vrs);
		}

		protected function modelUpdated_handler(event : GalleryModelEvent) : void 
		{
			view.imagePaths = model.imagePaths;
		}

		protected function pageResize_hanlder(event : SizeEvent) : void 
		{
			view.setSize(event.pageWidth, event.pageHeight);
		}
	}
}
