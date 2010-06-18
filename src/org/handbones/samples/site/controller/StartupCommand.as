package org.handbones.samples.site.controller 
{
	import org.handbones.core.ISettingsService;
	import org.handbones.samples.site.utils.FlashVars;
	import org.robotlegs.mvcs.Command;

	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.net.URLRequest;

	/**
	 * @author Matan Uberstein
	 */
	public class StartupCommand extends Command 
	{
		[Inject]
		public var settingsService : ISettingsService;

		[Inject]
		public var flashvars : FlashVars;

		override public function execute() : void 
		{
			contextView.stage.align = StageAlign.TOP_LEFT;
			contextView.stage.scaleMode = StageScaleMode.NO_SCALE;
			
			settingsService.load(new URLRequest(flashvars.settingsPath));
		}
	}
}