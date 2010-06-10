package org.handbones.samples.site.view 
{
	import org.handbones.events.SizeEvent;
	import org.robotlegs.mvcs.Mediator;

	/**
	 * @author Matan Uberstein
	 */
	public class BackgroundMediator extends Mediator 
	{

		[Inject]
		public var view : Background;
		
		override public function onRegister() : void 
		{
			eventMap.mapListener(eventDispatcher, SizeEvent.RESIZE, resize_handler, SizeEvent);
			view.init();
		}

		override public function onRemove() : void 
		{
			view.destroy(contextView.stage);
		}

		protected function resize_handler(event : SizeEvent) : void 
		{
			view.setSize(event.width, event.height);
		}
	}
}
