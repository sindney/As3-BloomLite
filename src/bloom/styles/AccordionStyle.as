package bloom.styles 
{
	/**
	 * AccordionStyle
	 */
	public class AccordionStyle implements IStyle {
		
		public var title:ToggleButtonStyle;
		public var content:ContainerStyle;
		
		public function AccordionStyle() {
			
		}
		
		///////////////////////////////////
		// toString
		///////////////////////////////////
		
		public function toString():String {
			return "[bloom.styles.AccordionStyle]";
		}
	}

}