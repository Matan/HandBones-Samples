package org.handbones.samples.site.view 
{
	import org.handbones.events.SizeEvent;
	import org.handbones.mvcs.RootActionMediator;
	import org.handbones.samples.site.model.ids.ActionRef;

	/**
	 * @author Matan Uberstein
	 */
	public class HeaderMediator extends RootActionMediator 
	{

		[Inject]
		public var view : Header;
		
		override public function onRegister() : void 
		{
			eventMap.mapListener(eventDispatcher, SizeEvent.RESIZE, resize_handler, SizeEvent);
			
			actionMap.mapAction(view, ActionRef.GOTO_ROOT);
			
			view.init();
			
			view.setVersion("0.1.7");
		}

		override public function onRemove() : void 
		{
			view.destroy(contextView.stage);
		}

		protected function resize_handler(event : SizeEvent) : void 
		{
			view.width = event.width;
		}
	}
}
