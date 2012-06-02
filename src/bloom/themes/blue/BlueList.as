package bloom.themes.blue 
{
	import flash.display.BitmapData;
	import flash.geom.Rectangle;
	
	import bloom.core.ScaleBitmap;
	import bloom.styles.ButtonBaseStyle;
	import bloom.styles.ScrollContainerStyle;
	import bloom.styles.SliderStyle;
	import bloom.core.ScaleBitmap;
	import bloom.styles.ListStyle;
	import bloom.styles.TextStyle;
	import bloom.styles.ToggleButtonStyle;
	
	/**
	 * BlueList
	 */
	public class BlueList extends ListStyle {
		
		[Embed(source="assets/sc_scrollbar.png")]
		private static var bm0:Class;
		
		[Embed(source="assets/sc_scrollbar_normal.png")]
		private static var bm1:Class;
		
		[Embed(source="assets/sc_scrollbar_over.png")]
		private static var bm2:Class;
		
		[Embed(source="assets/sc_scrollbar_down.png")]
		private static var bm3:Class;
		
		public function BlueList() {
			container = new ScrollContainerStyle();
			
			container.background = new ScaleBitmap(new BitmapData(1, 1, false, 0x333333));
			
			container.h_scrollBar = new SliderStyle();
			container.h_scrollBar.background = new ScaleBitmap(new bm0().bitmapData);
			container.h_scrollBar.background.scale9Grid = new Rectangle(7, 7, 2, 2);
			
			container.h_scrollBar.button = new ButtonBaseStyle();
			container.h_scrollBar.button.normal = new ScaleBitmap(new bm1().bitmapData);
			container.h_scrollBar.button.normal.scale9Grid = new Rectangle(7, 7, 2, 2);
			container.h_scrollBar.button.over = new ScaleBitmap(new bm2().bitmapData);
			container.h_scrollBar.button.over.scale9Grid = new Rectangle(7, 7, 2, 2);
			container.h_scrollBar.button.down = new ScaleBitmap(new bm3().bitmapData);
			container.h_scrollBar.button.down.scale9Grid = new Rectangle(7, 7, 2, 2);
			
			container.v_scrollBar = new SliderStyle();
			container.v_scrollBar.background = new ScaleBitmap(new bm0().bitmapData);
			container.v_scrollBar.background.scale9Grid = new Rectangle(7, 7, 2, 2);
			
			container.v_scrollBar.button = new ButtonBaseStyle();
			container.v_scrollBar.button.normal = new ScaleBitmap(new bm1().bitmapData);
			container.v_scrollBar.button.normal.scale9Grid = new Rectangle(7, 7, 2, 2);
			container.v_scrollBar.button.over = new ScaleBitmap(new bm2().bitmapData);
			container.v_scrollBar.button.over.scale9Grid = new Rectangle(7, 7, 2, 2);
			container.v_scrollBar.button.down = new ScaleBitmap(new bm3().bitmapData);
			container.v_scrollBar.button.down.scale9Grid = new Rectangle(7, 7, 2, 2);
			
			content = new ToggleButtonStyle();
			content.title_normal = new TextStyle();
			content.title_normal.textFormat.font = "Verdana";
			content.title_normal.textFormat.size = 12;
			content.title_normal.textFormat.color = 0xffffff;
			
			content.title_active = new TextStyle();
			content.title_active.textFormat.font = "Verdana";
			content.title_active.textFormat.size = 12;
			content.title_active.textFormat.color = 0x000000;
			
			content.normal = new ScaleBitmap(new BitmapData(1, 1, false, 0x666666));
			content.active = new ScaleBitmap(new BitmapData(1, 1, false, 0xCCCCCC));
		}
		
		///////////////////////////////////
		// toString
		///////////////////////////////////
		
		override public function toString():String {
			return "[bloom.themes.blue.BlueList]";
		}
	}

}