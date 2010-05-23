package org.handbones.samples.site.pages.helloworld 
{
	import org.handbones.events.SizeEvent;
	import org.handbones.model.SizeModel;
	import org.handbones.mvcs.PageActionMediator;

	/**
	 * @author Matan Uberstein
	 */
	public class HelloWorldCanvasMediator extends PageActionMediator 
	{

		[Inject]
		public var view : HelloWorldCanvas;

		[Inject]
		public var sizingModel : SizeModel;

		override public function onRegister() : void 
		{
			eventMap.mapListener(eventDispatcher, SizeEvent.PAGE_RESIZE, pageResize_handler, SizeEvent);
			view.init();
			
			view.setPageCenter(sizingModel.pageCenter);
		}

		override public function onRemove() : void 
		{
			view.destroy(contextView.stage);
		}

		protected function pageResize_handler(event : SizeEvent) : void 
		{
			view.setPageCenter(event.pageCenter);
		}
	}
}
