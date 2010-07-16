package org.handbones.samples 
{
	import org.handbones.samples.site.SampleSiteContext;

	import flash.display.Sprite;

	[SWF(backgroundColor="#FFFFFF", frameRate="31", width="1000", height="600")]

	/**
	 * @author Matan Uberstein
	 */
	public class SampleSite extends Sprite 
	{
		protected var _context : SampleSiteContext;

		public function SampleSite()
		{
			_context = new SampleSiteContext(this);
		}
	}
}
