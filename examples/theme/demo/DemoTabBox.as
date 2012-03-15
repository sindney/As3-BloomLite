package theme.demo 
{
	import flash.display.BitmapData;
	import flash.geom.Rectangle;
	
	import bloom.core.ScaleBitmap;
	import bloom.styles.ContainerStyle;
	import bloom.styles.TabBoxStyle;
	import bloom.styles.TextStyle;
	import bloom.styles.ToggleButtonStyle;
	
	public class DemoTabBox extends TabBoxStyle {
		
		[Embed(source="assets/tab_off.png")]
		private var bm0:Class;
		
		[Embed(source="assets/tab_on.png")]
		private var bm1:Class;
		
		public function DemoTabBox() {
			title = new ToggleButtonStyle();
			
			title.title_normal = new TextStyle();
			title.title_normal.textFormat.font = "Verdana";
			title.title_normal.textFormat.size = 12;
			title.title_normal.textFormat.color = 0x666666;
			
			title.title_active = new TextStyle();
			title.title_active.textFormat.font = "Verdana";
			title.title_active.textFormat.size = 12;
			title.title_active.textFormat.color = 0x000000;
			
			title.normal = new ScaleBitmap(new bm0().bitmapData);
			title.normal.scale9Grid = new Rectangle(11, 12, 1, 2);
			title.active = new ScaleBitmap(new bm1().bitmapData);
			title.active.scale9Grid = new Rectangle(11, 12, 1, 2);
			
			content = new ContainerStyle();
			content.background = new ScaleBitmap(new BitmapData(1, 1, false, 0xCCCCCC));
			
			header = new ContainerStyle();
			header.background = new ScaleBitmap(new BitmapData(1, 1, false, 0x666666));
		}
		
	}

}