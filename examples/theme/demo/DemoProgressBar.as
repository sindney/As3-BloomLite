package theme.demo 
{
	import flash.geom.Rectangle;
	
	import bloom.core.ScaleBitmap;
	import bloom.styles.ProgressBarStyle;
	
	public class DemoProgressBar extends ProgressBarStyle {
		
		[Embed(source="assets/progress_bg.png")]
		private static var bm0:Class;
		
		[Embed(source="assets/progress_bar.png")]
		private static var bm1:Class;
		
		public function DemoProgressBar() {
			background = new ScaleBitmap(new bm0().bitmapData);
			background.scale9Grid = new Rectangle(7, 7, 2, 2);
			progress = new ScaleBitmap(new bm1().bitmapData);
			progress.scale9Grid = new Rectangle(7, 7, 2, 2);
		}
		
	}

}