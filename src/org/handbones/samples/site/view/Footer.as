package org.handbones.samples.site.view 
{
	import assets.FooterFC;

	import mu.display.IStandardView;

	import flash.display.Stage;

	/**
	 * @author Matan Uberstein
	 */
	public class Footer extends FooterFC implements IStandardView
	{
		public function Footer()
		{
		}
		
		public function init() : void
		{
			blogBtn.buttonMode = true;
			asDocsBtn.buttonMode = true;
			robotlegsBtn.buttonMode = true;
		}

		public function destroy(stage : Stage = null) : void
		{
		}
	}
}
