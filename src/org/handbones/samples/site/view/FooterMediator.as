package org.handbones.samples.site.view 
{
	import org.handbones.events.SizeEvent;
	import org.handbones.mvcs.RootActionMediator;
	import org.handbones.samples.site.model.ids.ActionRef;

	import flash.events.MouseEvent;

	/**
	 * @author Matan Uberstein
	 */
	public class FooterMediator extends RootActionMediator 
	{
		[Inject]
		public var view : Footer;
		
		override public function onRegister() : void 
		{
			eventMap.mapListener(eventDispatcher, SizeEvent.RESIZE, resize_handler, SizeEvent);
			
			actionMap.mapAction(view.blogBtn, ActionRef.FOOTER_BLOG, MouseEvent);			actionMap.mapAction(view.asDocsBtn, ActionRef.FOOTER_ASDOC, MouseEvent);			actionMap.mapAction(view.robotlegsBtn, ActionRef.FOOTER_ROBOTLEGS, MouseEvent);
			
			view.init();
		}

		override public function onRemove() : void 
		{
			view.destroy(contextView.stage);
		}

		protected function resize_handler(event : SizeEvent) : void 
		{
			view.y = event.height;
			view.x = event.center.x;
		}
	}
}
