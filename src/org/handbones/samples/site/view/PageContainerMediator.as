package org.handbones.samples.site.view 
{
	import org.handbones.core.IPage;
	import org.handbones.events.PageEvent;
	import org.handbones.events.SizeEvent;
	import org.handbones.model.PageModel;
	import org.handbones.mvcs.RootActionMediator;
	import org.handbones.samples.site.model.ids.ActionRef;

	import flash.events.MouseEvent;

	/**
	 * @author Matan Uberstein
	 */
	public class PageContainerMediator extends RootActionMediator 
	{

		[Inject]
		public var view : PageContainer;

		[Inject]
		public var pageModel : PageModel;
		
		override public function onRegister() : void 
		{
			eventMap.mapListener(eventDispatcher, PageEvent.PAGE_CHANGE, pageChange_handler, PageEvent);
			eventMap.mapListener(eventDispatcher, SizeEvent.PAGE_RESIZE, pageResize_handler, SizeEvent);
			
			actionMap.mapAction(view.closeBtn, ActionRef.GOTO_ROOT, MouseEvent);
			
			view.init();
		}

		override public function onRemove() : void 
		{
			view.destroy(contextView.stage);
		}

		protected function pageChange_handler(event : PageEvent) : void 
		{
			var currentPage : IPage = pageModel.currentPage;
			if(currentPage)
				view.show(currentPage);
			else
				view.hide();
		}

		protected function pageResize_handler(event : SizeEvent) : void 
		{
			view.setPageSize(event.pageWidth, event.pageHeight);
		}
	}
}
