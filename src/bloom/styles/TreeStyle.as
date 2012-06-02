package bloom.styles 
{
	/**
	 * TreeStyle
	 */
	public class TreeStyle extends ScrollContainerStyle {
		
		public var branch:CheckBoxStyle;
		public var item:CheckBoxStyle;
		
		public function TreeStyle() {
			super();
			
		}
		
		///////////////////////////////////
		// toString
		///////////////////////////////////
		
		override public function toString():String {
			return "[bloom.styles.TreeStyle]";
		}
		
	}

}