package org.handbones.samples.site.utils 
{
	import mu.utils.FlashVarsDynamic;

	import flash.display.DisplayObjectContainer;

	/**
	 * @author Matan Uberstein
	 */
	public class FlashVars extends FlashVarsDynamic 
	{

		public var settingsPath : String = "data/site.xml";

		[Inject]

		public function FlashVars(contextView : DisplayObjectContainer)
		{
			super(contextView.stage.loaderInfo.parameters);
		}
	}
}
