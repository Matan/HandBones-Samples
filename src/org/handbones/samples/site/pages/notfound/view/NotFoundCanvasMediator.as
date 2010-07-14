package org.handbones.samples.site.pages.notfound.view 
{
	import flash.text.TextField;

	import org.handbones.model.SizeModel;
	import org.handbones.events.SizeEvent;
	import org.robotlegs.mvcs.Mediator;

	/**
	 * @author Matan Uberstein
	 */
	public class NotFoundCanvasMediator extends Mediator 
	{

		[Inject]
		public var view : NotFoundCanvas;

		[Inject]
		public var sizeModel : SizeModel;

		override public function onRegister() : void 
		{
			eventMap.mapListener(eventDispatcher, SizeEvent.PAGE_RESIZE, pageResize_handler, SizeEvent);
			
			updatePosition();
		}

		protected function pageResize_handler(event : SizeEvent) : void 
		{
			updatePosition();
		}

		protected function updatePosition() : void
		{
			var field : TextField = view.field;
			field.y = Math.round(sizeModel.pageCenter.y - field.height / 2);			field.x = Math.round(sizeModel.pageCenter.x - field.width / 2);
		}
	}
}
