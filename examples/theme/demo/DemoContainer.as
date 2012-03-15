package theme.demo 
{
	import flash.geom.Rectangle;
	
	import bloom.core.ScaleBitmap;
	import bloom.styles.ContainerStyle;
	
	public class DemoContainer extends ContainerStyle {
		
		[Embed(source="assets/container.png")]
		private static var bm0:Class;
		
		public function DemoContainer() {
			background = new ScaleBitmap(new bm0().bitmapData);
			background.scale9Grid = new Rectangle(7, 7, 2, 2);
		}
		
	}

}