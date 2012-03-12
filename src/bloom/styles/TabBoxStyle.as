package bloom.styles 
{
	/**
	 * TabBoxStyle
	 */
	public class TabBoxStyle implements IStyle {
		
		public var title:ToggleButtonStyle;
		public var content:ContainerStyle;
		public var header:ContainerStyle;
		
		public function TabBoxStyle() {
			
		}
		
		///////////////////////////////////
		// toString
		///////////////////////////////////
		
		public function toString():String {
			return "[bloom.styles.TabBoxStyle]";
		}
	}

}