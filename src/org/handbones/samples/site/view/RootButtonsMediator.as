package org.handbones.samples.site.view 
{
	import flash.events.MouseEvent;
	import org.handbones.mvcs.RootActionMediator;

	/**
	 * @author Matan Uberstein
	 */
	public class RootButtonsMediator extends RootActionMediator 
	{

		[Inject]
		public var view : RootButtons;

		override public function onRegister() : void 
		{
			var rootButtonsXmlList : XMLList = settingsModel.data.rootButtons[0].children();
			
			var bL : int = rootButtonsXmlList.length();
			for(var i : int = 0;i < bL;i++) 
			{
				var buttonXml : XML = rootButtonsXmlList[i];
				actionMap.mapAction(view.createButton(buttonXml.@label), buttonXml.@action, MouseEvent);
			}
		}
	}
}
