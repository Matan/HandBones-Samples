package org.handbones.samples.site.pages.gallery.view 
{
	import mu.display.IStandardView;
	import mu.display.image.Image;

	import org.handbones.samples.site.pages.gallery.events.GalleryCanvasEvent;

	import flash.display.ISprite;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.URLRequest;

	/**
	 * @author Matan Uberstein
	 */
	public class GalleryCanvas extends Sprite implements ISprite, IStandardView
	{
		protected var _width : Number;
		protected var _height : Number;

		protected var _imageWidth : Number = 288;		protected var _imageHeight : Number = 180;
		protected var _hPadding : Number = 10;		protected var _vPadding : Number = 10;

		protected var _imagePaths : Array;

		protected var _images : Array;
		protected var _loadedIndexCounter : int;

		protected var _imageContainer : Sprite; 

		public function GalleryCanvas()
		{
		}

		public function init() : void
		{
			_images = [];
			_loadedIndexCounter = -1;
			
			_imageContainer = new Sprite();
			_imageContainer.x = _hPadding;			_imageContainer.y = _vPadding;
			addChild(_imageContainer);
		}

		public function destroy(stage : Stage = null) : void
		{
			destroyImages();
		}

		protected function destroyImages() : void
		{
			var pL : int = _images.length;
			for(var i : int = 0;i < pL;i++) 
			{
				var image : Image = _images[i];
				image.removeEventListener(Event.COMPLETE, image_complete_handler);
				if(_imageContainer.contains(image))
					_imageContainer.removeChild(image);
				
				image.clear();
			}
			_images = [];
			_loadedIndexCounter = -1;
		}

		public function set imagePaths(imagePaths : Array) : void
		{
			destroyImages();
			
			_imagePaths = imagePaths;
			
			var pL : int = _imagePaths.length;
			for(var i : int = 0;i < pL;i++) 
			{
				var image : Image = new Image();
				image.width = _imageWidth;
				image.addEventListener(Event.COMPLETE, image_complete_handler);				image.addEventListener(MouseEvent.CLICK, image_click_handler);
				image.enabled = true;
				image.buttonMode = true;
				
				_images.push(image);
			}
			
			setSize(_width, _height);
			
			loadNextImage();
		}

		public function showImage(index : int) : void
		{
		}

		protected function image_click_handler(event : MouseEvent) : void 
		{
			var galleryEvent : GalleryCanvasEvent = new GalleryCanvasEvent(GalleryCanvasEvent.IMAGE_CLICKED);
			galleryEvent.imageIndex = _images.indexOf(event.currentTarget);
			dispatchEvent(galleryEvent);
		}

		protected function image_complete_handler(event : Event) : void 
		{
			_imageContainer.addChild(_images[_loadedIndexCounter]);
			loadNextImage();
		}

		protected function loadNextImage() : void
		{
			_loadedIndexCounter++;
			if(_loadedIndexCounter < _images.length)
			{
				var image : Image = _images[_loadedIndexCounter];
				image.load(new URLRequest(_imagePaths[_loadedIndexCounter]));
			}
		}

		public function setSize(width : Number, height : Number) : void 
		{
			_width = width;
			_height = height;
			
			var xPos : Number = 0;
			var yPos : Number = 0;
			
			var pL : int = _images.length;
			for(var i : int = 0;i < pL;i++) 
			{
				var image : Image = _images[i];
				
				image.x = xPos;
				image.y = yPos;
				
				xPos += _imageWidth + _hPadding;
				if(xPos + _imageWidth >= _width)
				{
					xPos = 0;
					yPos += _imageHeight + _vPadding;
				}
			}
		}
	}
}
