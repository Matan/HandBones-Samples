package org.handbones.samples.site.pages.helloworld.view 
{
	import assets.pages.HelloWorldCanvasFC;

	import mu.display.IStandardView;

	import flash.display.Stage;
	import flash.geom.Point;

	/**
	 * @author Matan Uberstein
	 */
	public class HelloWorldCanvas extends HelloWorldCanvasFC implements IStandardView
	{
		public function HelloWorldCanvas()
		{
		}
		
		public function init() : void
		{
		}
		
		public function destroy(stage : Stage = null) : void
		{
		}

		public function setPageCenter(center : Point) : void 
		{
			helloAsset.x = center.x;			helloAsset.y = center.y;
		}
	}
}
