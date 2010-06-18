package org.handbones.samples.site.pages.helloworld.controller 
{
	import org.handbones.samples.site.pages.helloworld.view.HelloWorldCanvas;
	import org.handbones.core.IPage;
	import org.robotlegs.mvcs.Command;

	/**
	 * @author Matan Uberstein
	 */
	public class HelloWorldStartupCompleteCommand extends Command 
	{
		[Inject]
		public var page : IPage;
		
		override public function execute() : void 
		{
			page.addChild(new HelloWorldCanvas());
		}
	}
}
