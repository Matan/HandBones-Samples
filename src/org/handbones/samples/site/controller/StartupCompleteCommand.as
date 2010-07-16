package org.handbones.samples.site.controller 
{
	import org.handbones.core.ICookieModel;
	import org.handbones.samples.site.model.ids.CookieId;
	import org.handbones.samples.site.view.SiteCanvas;
	import org.robotlegs.mvcs.Command;

	/**
	 * @author Matan Uberstein
	 */
	public class StartupCompleteCommand extends Command 
	{

		[Inject]
		public var cookieModel : ICookieModel;

		override public function execute() : void 
		{
			cookieModel.setCookie(CookieId.VISIT_COUNT, cookieModel.getCookie(CookieId.VISIT_COUNT) + 1);
			
			contextView.addChild(new SiteCanvas());
		}
	}
}
