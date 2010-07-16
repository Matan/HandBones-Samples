package org.handbones.samples.site.pages.notfound.view 
{
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;

	/**
	 * @author Matan Uberstein
	 */
	public class NotFoundCanvas extends Sprite 
	{
		public var field : TextField;

		public function NotFoundCanvas()
		{
			field = new TextField();
			field.defaultTextFormat = new TextFormat("Helvetica-Normal", 34, 0x0);
			field.autoSize = TextFieldAutoSize.CENTER;
			field.selectable = false;			//field.embedFonts = true;
			field.text = "404 - The page your looking for does not exist.";
			addChild(field);
		}
	}
}
