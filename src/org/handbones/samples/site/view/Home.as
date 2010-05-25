package org.handbones.samples.site.view 
{
	import assets.HomeFC;

	import mu.display.IStandardView;

	import flash.display.Stage;

	/**
	 * @author Matan Uberstein
	 */
	public class Home extends HomeFC implements IStandardView
	{
		public function Home()
		{
		}
		
		public function init() : void
		{
			helloWorldBtn.buttonMode = true;
		}

		public function destroy(stage : Stage = null) : void
		{
		}
	}
}
