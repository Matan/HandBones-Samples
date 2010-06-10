package org.handbones.samples.site.pages.gallery.controller 
{
	import org.assetloader.events.XMLAssetEvent;
	import org.handbones.mvcs.PageCommand;
	import org.handbones.samples.site.model.ids.AssetId;
	import org.handbones.samples.site.pages.gallery.model.GalleryModel;

	/**
	 * @author Matan Uberstein
	 */
	public class ParseGalleryXmlCommand extends PageCommand 
	{

		[Inject]
		public var model : GalleryModel;

		override public function execute() : void 
		{
			if(!model.hasData)
			{
				if(groupLoader.hasAsset(AssetId.GALLERY_XML))
				{
					var paths : Array = [];
					var xml : XML = groupLoader.getAsset(AssetId.GALLERY_XML);
					var children : XMLList = xml.children();
			
					var cL : int = children.length();
					for(var i : int = 0;i < cL;i++) 
					{
						var child : XML = children[i];
						switch(String(child.name()))
						{		
							case "image":
								paths.push(child.@src);
								break;
							default:
						}
					}
			
					model.update(xml.@src, paths);
				}
				else
					commandMap.mapEvent(XMLAssetEvent.LOADED, ParseGalleryXmlCommand, XMLAssetEvent);
			}
		}
	}
}
