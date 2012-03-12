package bloom.themes.blue 
{
	import flash.display.BitmapData;
	
	import bloom.core.ScaleBitmap;
	import bloom.styles.AccordionStyle;
	import bloom.styles.ContainerStyle;
	import bloom.styles.TextStyle;
	import bloom.styles.ToggleButtonStyle;
	
	/**
	 * BlueAccordion
	 */
	public class BlueAccordion extends AccordionStyle {
		
		public function BlueAccordion() {
			title = new ToggleButtonStyle();
			title.title_normal = new TextStyle();
			title.title_normal.textFormat.font = "Verdana";
			title.title_normal.textFormat.size = 12;
			title.title_normal.textFormat.color = 0xffffff;
			
			title.title_active = new TextStyle();
			title.title_active.textFormat.font = "Verdana";
			title.title_active.textFormat.size = 12;
			title.title_active.textFormat.color = 0xffffff;
			
			title.normal = new ScaleBitmap(new BitmapData(1, 1, false, 0x666666));
			title.active = new ScaleBitmap(new BitmapData(1, 1, false, 0x666666));
			
			content = new ContainerStyle();
			content.background = new ScaleBitmap(new BitmapData(1, 1, false, 0xCCCCCC));
		}
		
		///////////////////////////////////
		// toString
		///////////////////////////////////
		
		override public function toString():String {
			return "[bloom.themes.blue.BlueAccordion]";
		}
		
	}

}