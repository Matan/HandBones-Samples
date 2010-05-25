package org.handbones.samples.site.view 
{
	import org.handbones.mvcs.RootActionMediator;
	import org.handbones.samples.site.model.ids.ActionRef;

	import flash.events.MouseEvent;

	/**
	 * @author Matan Uberstein
	 */
	public class HomeMediator extends RootActionMediator 
	{

		[Inject]
		public var view : Home;
		
		override public function onRegister() : void 
		{
			actionMap.mapAction(view.helloWorldBtn, ActionRef.HELLO_WORLD_BTN, MouseEvent);			actionMap.mapAction(view.galleryBtn, ActionRef.GALLERY_BTN, MouseEvent);
			view.init();
		}

		override public function onRemove() : void 
		{
			view.destroy(contextView.stage);
		}
	}
}
