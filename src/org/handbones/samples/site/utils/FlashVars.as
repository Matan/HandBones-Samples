package org.handbones.samples.site.utils 
{
	import mu.utils.FlashVarsDynamic;

	/**
	 * @author Matan Uberstein
	 */
	public class FlashVars extends FlashVarsDynamic 
	{

		public var settingsPath : String = "data/site.xml";

		public function FlashVars(loaderInfoParams : Object)
		{
			super(loaderInfoParams);
		}
	}
}
