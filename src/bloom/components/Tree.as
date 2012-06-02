package bloom.components 
{
	import flash.display.DisplayObjectContainer;
	
	import bloom.core.ThemeBase;
	import bloom.styles.TreeStyle;
	
	/**
	 * Tree
	 */
	public class Tree extends ScrollContainer {
		
		private var _branch:TreeBranch;
		private var _group:CheckBoxGroup;
		
		public function Tree(p:DisplayObjectContainer = null) {
			super(p, FlowContainer.VERTICALLY);
			
			_group = new CheckBoxGroup( -1);
			
			style = ThemeBase.theme.tree;
			
			setScrollBar(true, true);
		}
		
		override public function dispose():void {
			super.dispose();
			if (_branch) _branch.dispose();
		}
		
		override protected function onThemeChanged():void {
			if (!_lock) style = ThemeBase.theme.tree;
		}
		
		///////////////////////////////////
		// getter/setters
		///////////////////////////////////
		
		public function get branch():TreeBranch {
			return _branch;
		}
		
		public function set branch(value:TreeBranch):void {
			if (_branch != value) {
				_branch = value;
				if (_branch) {
					_branch.tree = this;
					_content.addChild(_branch);
				}
			}
		}
		
		public function get group():CheckBoxGroup {
			return _group;
		}
		
		///////////////////////////////////
		// toString
		///////////////////////////////////
		
		override public function toString():String {
			return "[bloom.components.Tree]";
		}
	}

}