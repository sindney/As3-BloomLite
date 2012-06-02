package bloom.themes.blue 
{
	import flash.display.BitmapData;
	import flash.geom.Rectangle;
	
	import bloom.core.ScaleBitmap;
	import bloom.styles.ButtonBaseStyle;
	import bloom.styles.CheckBoxStyle;
	import bloom.styles.ScrollContainerStyle;
	import bloom.styles.SliderStyle;
	import bloom.styles.TextStyle;
	import bloom.styles.TreeStyle;
	
	/**
	 * BlueTree
	 */
	public class BlueTree extends TreeStyle {
		
		[Embed(source="assets/sc_scrollbar.png")]
		private static var bm0:Class;
		
		[Embed(source="assets/sc_scrollbar_normal.png")]
		private static var bm1:Class;
		
		[Embed(source="assets/sc_scrollbar_over.png")]
		private static var bm2:Class;
		
		[Embed(source="assets/sc_scrollbar_down.png")]
		private static var bm3:Class;
		
		[Embed(source="assets/tree_item_on.png")]
		private static var bm4:Class;
		
		[Embed(source="assets/tree_item_off.png")]
		private static var bm5:Class;
		
		[Embed(source="assets/tree_branch_on.png")]
		private static var bm6:Class;
		
		[Embed(source="assets/tree_branch_off.png")]
		private static var bm7:Class;
		
		public function BlueTree() {
			background = new ScaleBitmap(new BitmapData(1, 1, false, 0x333333));
			
			h_scrollBar = new SliderStyle();
			h_scrollBar.background = new ScaleBitmap(new bm0().bitmapData);
			h_scrollBar.background.scale9Grid = new Rectangle(7, 7, 2, 2);
			
			h_scrollBar.button = new ButtonBaseStyle();
			h_scrollBar.button.normal = new ScaleBitmap(new bm1().bitmapData);
			h_scrollBar.button.normal.scale9Grid = new Rectangle(7, 7, 2, 2);
			h_scrollBar.button.over = new ScaleBitmap(new bm2().bitmapData);
			h_scrollBar.button.over.scale9Grid = new Rectangle(7, 7, 2, 2);
			h_scrollBar.button.down = new ScaleBitmap(new bm3().bitmapData);
			h_scrollBar.button.down.scale9Grid = new Rectangle(7, 7, 2, 2);
			
			v_scrollBar = new SliderStyle();
			v_scrollBar.background = new ScaleBitmap(new bm0().bitmapData);
			v_scrollBar.background.scale9Grid = new Rectangle(7, 7, 2, 2);
			
			v_scrollBar.button = new ButtonBaseStyle();
			v_scrollBar.button.normal = new ScaleBitmap(new bm1().bitmapData);
			v_scrollBar.button.normal.scale9Grid = new Rectangle(7, 7, 2, 2);
			v_scrollBar.button.over = new ScaleBitmap(new bm2().bitmapData);
			v_scrollBar.button.over.scale9Grid = new Rectangle(7, 7, 2, 2);
			v_scrollBar.button.down = new ScaleBitmap(new bm3().bitmapData);
			v_scrollBar.button.down.scale9Grid = new Rectangle(7, 7, 2, 2);
			
			branch = new CheckBoxStyle();
			branch.title_normal = new TextStyle();
			branch.title_normal.textFormat.font = "Verdana";
			branch.title_normal.textFormat.size = 12;
			branch.title_normal.textFormat.color = 0xffffff;
			
			branch.title_checked = new TextStyle();
			branch.title_checked.textFormat.font = "Verdana";
			branch.title_checked.textFormat.size = 12;
			branch.title_checked.textFormat.color = 0xffa500;
			
			branch.normal = new ScaleBitmap(new bm7().bitmapData);
			branch.normal.scale9Grid = new Rectangle(10, 10, 2, 2);
			branch.checked = new ScaleBitmap(new bm6().bitmapData);
			branch.checked.scale9Grid = new Rectangle(10, 10, 2, 2);
			
			item = new CheckBoxStyle();
			item.title_normal = new TextStyle();
			item.title_normal.textFormat.font = "Verdana";
			item.title_normal.textFormat.size = 12;
			item.title_normal.textFormat.color = 0xffffff;
			
			item.title_checked = new TextStyle();
			item.title_checked.textFormat.font = "Verdana";
			item.title_checked.textFormat.size = 12;
			item.title_checked.textFormat.color = 0xffa500;
			
			item.normal = new ScaleBitmap(new bm5().bitmapData);
			item.normal.scale9Grid = new Rectangle(10, 10, 2, 2);
			item.checked = new ScaleBitmap(new bm4().bitmapData);
			item.checked.scale9Grid = new Rectangle(10, 10, 2, 2);
		}
		
		///////////////////////////////////
		// toString
		///////////////////////////////////
		
		override public function toString():String {
			return "[bloom.themes.blue.BlueTree]";
		}
		
	}

}