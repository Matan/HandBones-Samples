package org.handbones.samples.site.controller 
{
	import org.handbones.model.SizeModel;
	import org.robotlegs.mvcs.Command;

	/**
	 * @author Matan Uberstein
	 */
	public class UpdatePageSizeCommand extends Command 
	{

		[Inject]
		public var sizeModel : SizeModel;

		override public function execute() : void 
		{
			sizeModel.updatePageSize(sizeModel.width - 20, sizeModel.height - 100);
		}
	}
}
