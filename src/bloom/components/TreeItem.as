package bloom.components 
{
	import flash.display.DisplayObjectContainer;
	
	import bloom.styles.TreeStyle;
	
	/**
	 * TreeItem
	 */
	public class TreeItem extends CheckBox {
		
		private var _tree:Tree;
		
		public function TreeItem(p:DisplayObjectContainer = null, title:String = "", value:Boolean = false) {
			super(p, title, value);
		}
		
		override public function dispose():void {
			super.dispose();
			_tree = null;
		}
		
		override protected function onThemeChanged():void {
			if (!_lock && _tree) style = (_tree.style as TreeStyle).item;
		}
		
		///////////////////////////////////
		// getter/setters
		///////////////////////////////////
		
		public function get tree():Tree {
			return _tree;
		}
		
		public function set tree(value:Tree):void {
			if (_tree != value) {
				_tree = value;
				if (_tree) style = (tree.style as TreeStyle).item;
			}
		}
		
		///////////////////////////////////
		// toString
		///////////////////////////////////
		
		override public function toString():String {
			return "[bloom.components.TreeItem]";
		}
		
	}

}