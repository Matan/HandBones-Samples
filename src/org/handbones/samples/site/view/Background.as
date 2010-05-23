package org.handbones.samples.site.view 
{
	import assets.BackgroundFC;

	import mu.display.IStandardView;

	import flash.display.Stage;

	/**
	 * @author Matan Uberstein
	 */
	public class Background extends BackgroundFC implements IStandardView
	{
		public function Background()
		{
		}

		public function init() : void
		{
		}

		public function destroy(stage : Stage = null) : void
		{
		}

		public function setSize(width : Number, height : Number) : void 
		{
			this.width = width;			this.height = height;
		}
	}
}
