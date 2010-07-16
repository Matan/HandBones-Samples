package org.handbones.samples.site.pages.cookie.view 
{
	import flash.events.MouseEvent;

	import org.handbones.core.ICookieModel;
	import org.robotlegs.mvcs.Mediator;

	import flash.events.Event;

	/**
	 * @author Matan Uberstein
	 */
	public class CookieTesterCanvasMediator extends Mediator 
	{

		[Inject]
		public var view : CookieTesterCanvas;

		[Inject]
		public var cookieModel : ICookieModel;

		override public function onRegister() : void 
		{
			view.init();
			
			eventMap.mapListener(view, Event.SELECT, cookieSelect_handler, Event);
			eventMap.mapListener(view.deleteAllBtn, MouseEvent.CLICK, deleteAll_handler, MouseEvent);			eventMap.mapListener(view.deleteBtn, MouseEvent.CLICK, delete_handler, MouseEvent);			eventMap.mapListener(view.saveBtn, MouseEvent.CLICK, save_handler, MouseEvent);			eventMap.mapListener(view.createBtn, MouseEvent.CLICK, create_handler, MouseEvent);
			
			updateList();
		}

		protected function updateList() : void
		{
			view.updateList(cookieModel.getCookieIds().sort());
		}

		protected function cookieSelect_handler(event : Event) : void 
		{
			view.selectedCookieValue = cookieModel.getCookie(view.selectedCookieId);
		}

		protected function deleteAll_handler(event : MouseEvent) : void 
		{
			cookieModel.deleteAll();
			updateList();
		}

		protected function delete_handler(event : MouseEvent) : void 
		{
			cookieModel.deleteCookie(view.selectedCookieId);
			updateList();
		}

		protected function save_handler(event : MouseEvent) : void 
		{
			cookieModel.setCookie(view.selectedCookieId, view.selectedCookieValue);
			updateList();
		}

		protected function create_handler(event : MouseEvent) : void 
		{
			if(view.cookieIdText.text != "")
			{
				cookieModel.setCookie(view.cookieIdText.text, view.cookieValueText.text);
				view.cookieIdText.text = "";
				view.cookieValueText.text = "";
			}
			updateList();
		}
	}
}
