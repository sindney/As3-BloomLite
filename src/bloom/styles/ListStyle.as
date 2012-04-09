package bloom.styles 
{
	/**
	 * ListStyle
	 */
	public class ListStyle implements IStyle {
		
		public var container:ScrollContainerStyle;
		public var content:ToggleButtonStyle;
		
		public function ListStyle() {
			
		}
		
		///////////////////////////////////
		// toString
		///////////////////////////////////
		
		public function toString():String {
			return "[bloom.styles.ListStyle]";
		}
		
	}

}