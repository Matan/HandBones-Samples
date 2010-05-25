package org.handbones.samples.site.view 
{
	import org.robotlegs.mvcs.Mediator;

	/**
	 * @author Matan Uberstein
	 */
	public class SiteCanvasMediator extends Mediator 
	{

		[Inject]
		public var view : SiteCanvas;

		override public function onRegister() : void 
		{
			view.init();
		}

		override public function onRemove() : void 
		{
			view.destroy(contextView.stage);
		}
	}
}
