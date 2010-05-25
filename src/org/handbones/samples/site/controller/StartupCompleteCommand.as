package org.handbones.samples.site.controller 
{
	import org.handbones.samples.site.view.SiteCanvas;
	import org.robotlegs.mvcs.Command;

	/**
	 * @author Matan Uberstein
	 */
	public class StartupCompleteCommand extends Command 
	{
		override public function execute() : void 
		{
			contextView.addChild(new SiteCanvas());
		}
	}
}
