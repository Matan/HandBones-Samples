package org.handbones.samples.site.pages.cookie.view 
{
	import com.bit101.components.PushButton;
	import com.bit101.components.Text;
	import com.bit101.components.HBox;
	import com.bit101.components.Label;
	import com.bit101.components.List;
	import com.bit101.components.VBox;

	import flash.display.Sprite;
	import flash.events.Event;

	/**
	 * @author Matan Uberstein
	 */
	public class CookieTesterCanvas extends Sprite 
	{
		protected var _ids : Array;

		protected var _containerVBox : VBox;

		protected var _list : List;		protected var _deleteAllBtn : PushButton;

		protected var _textValue : Text;

		protected var _saveBtn : PushButton;
		protected var _deleteBtn : PushButton;

		protected var _cookieIdText : Text;		protected var _cookieValueText : Text;		protected var _createBtn : PushButton;

		public function CookieTesterCanvas()
		{
		}

		public function init() : void
		{
			_containerVBox = new VBox(this, 20, 20);
			
			var r1 : HBox = new HBox(_containerVBox);
			var r1c1 : VBox = new VBox(r1);
						var availableLabel : Label = new Label(r1c1);
			availableLabel.autoSize = true;
			availableLabel.text = "Available Cookies:";
			
			_list = new List(r1c1);
			_list.addEventListener(Event.SELECT, dispatchEvent);
			
			_deleteAllBtn = new PushButton(r1c1);
			_deleteAllBtn.label = "delete all";
			
			var r1c2 : VBox = new VBox(r1);
			
			var currentValueLabel : Label = new Label(r1c2);
			currentValueLabel.autoSize = true;
			currentValueLabel.text = "Cookie Value:";
			
			_textValue = new Text(r1c2);
			_textValue.width = 205;
			
			var r1c2r1 : HBox = new HBox(r1c2);
			
			_saveBtn = new PushButton(r1c2r1);
			_saveBtn.label = "save";
			
			_deleteBtn = new PushButton(r1c2r1);
			_deleteBtn.label = "delete";
			
			var r2 : HBox = new HBox(_containerVBox);
			
			var r2c1 : VBox = new VBox(r2);
			
			var createLabel : Label = new Label(r2c1);
			createLabel.autoSize = true;
			createLabel.text = "Create a new Cookie:";
			
			var r2c1r1 : HBox = new HBox(r2c1);
			
			var idLabel : Label = new Label(r2c1r1);
			idLabel.autoSize = true;
			idLabel.text = "Id:";
			
			_cookieIdText = new Text(r2c1r1);
			_cookieIdText.width = 73;			_cookieIdText.height = 19;
			
			var valueLabel : Label = new Label(r2c1r1);
			valueLabel.autoSize = true;
			valueLabel.text = "Value:";
			
			_cookieValueText = new Text(r2c1r1);
			_cookieValueText.width = 74;			_cookieValueText.height = 19;
			
			_createBtn = new PushButton(r2c1r1);
			_createBtn.label = "create";
			
			var frameCount : int = 0;
			addEventListener(Event.ENTER_FRAME, function(event : Event) : void
			{
				frameCount++;
				_containerVBox.draw();
				r1.draw();
				r2.draw();
				r2c1r1.draw();
				
				if(frameCount >= 2)
					event.target.removeEventListener(event.type, arguments.callee);
			});
		}

		public function updateList(ids : Array) : void 
		{
			_ids = ids;
			_list.items = ids;
			dispatchEvent(new Event(Event.SELECT));
		}

		public function get selectedCookieId() : String
		{
			return _ids[_list.selectedIndex];
		}

		public function get selectedCookieValue() : * 
		{
			return _textValue.text;
		}

		public function set selectedCookieValue(value : *) : void 
		{
			_textValue.text = value;
		}

		public function get deleteAllBtn() : PushButton
		{
			return _deleteAllBtn;
		}

		public function get saveBtn() : PushButton
		{
			return _saveBtn;
		}

		public function get deleteBtn() : PushButton
		{
			return _deleteBtn;
		}
		
		public function get createBtn() : PushButton
		{
			return _createBtn;
		}
		
		public function get cookieIdText() : Text
		{
			return _cookieIdText;
		}
		
		public function get cookieValueText() : Text
		{
			return _cookieValueText;
		}
	}
}
